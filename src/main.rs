use cpu::CPU;
use minifb::{Scale, Window, WindowOptions};
use std::path::PathBuf;
use clap::Parser;
use std::io::{self, Write};

mod cpu;
mod gpu;
mod instructions;
mod registers;
mod unit_tests;

#[derive(Debug, Parser)]
struct Args {
    #[clap(short, long)]
    /// Print debug info
    debug: bool,
    #[clap(short, long)]
    /// Execute one instruction at a time
    step: bool,
    /// Path to the ROM file
    #[clap(default_value = "roms/dmg_boot.bin")]
    path: PathBuf,
}

fn wait_for_keypress() {
    print!("Press Enter to continue...");
    io::stdout().flush().unwrap();
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
}

fn main() {
    pub const SCREEN_WIDTH: usize = 160;
    pub const SCREEN_HEIGHT: usize = 144;

    let args = Args::parse();

    env_logger::builder()
        .filter_level(log::LevelFilter::Info)
        .init();

    let mut cpu = CPU::new_bootrom(&args.path).unwrap();
    cpu.debug_mode = args.debug;
    let scale_factor = Scale::X2;

    let mut window = Window::new(
        "Game Boy Emulator",
        SCREEN_WIDTH,
        SCREEN_HEIGHT,
        WindowOptions {
            scale: scale_factor,
            ..WindowOptions::default()
        },
    )
    .unwrap();

    window.set_target_fps(60);
    while window.is_open() {
        if args.step {
            // In step mode, execute one instruction and wait for key press
            cpu.step();
            let framebuffer = cpu.bus.gpu.render_screen();
            window.update_with_buffer(&framebuffer, SCREEN_WIDTH, SCREEN_HEIGHT).unwrap();
            
            if !window.is_open() {
                break;
            }
            wait_for_keypress();
        } else {
            // Normal mode - run at full speed
            let mut executed_cycles: u32 = 0;
            loop {
                cpu.step();
                executed_cycles += cpu.cycle_count as u32;
                if executed_cycles >= 69905 {
                    break;
                }
            }

            let framebuffer = cpu.bus.gpu.render_screen();
            window.update_with_buffer(&framebuffer, SCREEN_WIDTH, SCREEN_HEIGHT).unwrap();
        }
    }
}
