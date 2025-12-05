use clap::Parser;
use cpu::CPU;
use minifb::{Scale, Window, WindowOptions};
use std::io::{self, Write};
use std::path::PathBuf;

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
    #[clap(default_value = "roms/Tetris.gb")]
    path: PathBuf,
}

fn wait_for_keypress() {
    print!("Press Enter to continue...");
    io::stdout().flush().unwrap();
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
}

fn main() {
    simple_logging::log_to_file("ramiel.log", log::LevelFilter::Info).unwrap();
    pub const SCREEN_WIDTH: usize = 160;
    pub const SCREEN_HEIGHT: usize = 144;

    let args = Args::parse();

    let mut cpu = CPU::_new_with_rom(&args.path).unwrap();
    cpu.debug_mode = args.debug;
    let scale_factor = Scale::X4;

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
            window
                .update_with_buffer(&framebuffer, SCREEN_WIDTH, SCREEN_HEIGHT)
                .unwrap();

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
            window
                .update_with_buffer(&framebuffer, SCREEN_WIDTH, SCREEN_HEIGHT)
                .unwrap();
        }
    }
}
