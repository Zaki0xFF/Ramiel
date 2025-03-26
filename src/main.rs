use cpu::CPU;
use minifb::{Scale, Window, WindowOptions};
use std::path::Path;
use clap::{builder::Str, Parser};
use std::io::{self, Write};

mod cpu;
mod gpu;
mod instructions;
mod registers;
mod unit_tests;

#[derive(Debug, Parser)]
struct Args {
    #[clap(short, long)]
    ///Debug mode true = print debug info
    debug_mode: bool,
    #[clap(short, long)]
    ///Step mode - execute one instruction at a time
    step: bool,
    ///Path to the ROM file
    path: Option<String>,
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

    let path = Path::new(match &args.path {
        Some(path) => path.as_str(),
        None => "roms/dmg_boot.bin",
    });
    let mut cpu = CPU::new_bootrom(path).unwrap();
    cpu.debug_mode = args.debug_mode;
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
            
            // Dump VRAM when SCY=0 (logo is fully visible)
            if cpu.bus.gpu.scy == 0 {
                if let Err(e) = cpu.bus.gpu.dump_vram() {
                    eprintln!("Failed to dump VRAM: {}", e);
                }
            }

            window.update_with_buffer(&framebuffer, SCREEN_WIDTH, SCREEN_HEIGHT).unwrap();
        }
    }
}
