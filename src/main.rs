pub mod cpu;
pub mod gpu;
pub mod instructions;
pub mod registers;
mod unit_tests;
use cpu::CPU;
use log::info;
use log::LevelFilter;
use minifb::{Scale, Window, WindowOptions};
use std::path::Path;
use std::process::exit;
use std::sync::mpsc::{self};
use std::sync::{Arc, Mutex};
use std::thread::{self};
use std::time::Duration;

fn main() {
    env_logger::builder().filter_level(LevelFilter::Info).init();
    let (log_sender, log_receiver) = mpsc::channel();
    let path = Path::new("./roms/dmg_boot.bin");
    let cpu_state = Arc::new(Mutex::new(CPU::new_with_rom(path, log_sender).unwrap()));
    let render_cpu = Arc::clone(&cpu_state);
    let scale_factor = Scale::X4;

    let mut window = Window::new(
        "Game Boy Emulator",
        160,
        144,
        WindowOptions {
            scale: scale_factor,
            ..WindowOptions::default()
        },
    )
    .unwrap_or_else(|e| {
        panic!("{}", e);
    });

    thread::scope(move |s| {
        s.spawn(move || loop {
            let mut cpu = cpu_state.lock().unwrap();
            cpu.step();
            drop(cpu);
            std::thread::sleep(Duration::from_nanos(20));
        });
        s.spawn(move || {
            while let Ok(log_message) = log_receiver.recv() {
                info!("{}", log_message);
            }
            std::thread::sleep(Duration::from_secs(1));
        });
        while window.is_open() {
            let mut state = render_cpu.lock().unwrap();
            let framebuffer = state.bus.gpu.render_screen();
            drop(state);
            window.update_with_buffer(&framebuffer, 160, 144).unwrap();
            thread::sleep(Duration::from_millis(16));
        }
        exit(0);
    });
}
