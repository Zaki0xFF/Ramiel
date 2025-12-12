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

    let mut cpu = CPU::_new_bootrom(&args.path).unwrap();
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
        if window.is_key_pressed(minifb::Key::Q, minifb::KeyRepeat::No) {
            cpu.debug_mode = !cpu.debug_mode;
            println!("Debug mode: {}", cpu.debug_mode);
        }

        let mut joypad_state = 0u8;
        if window.is_key_down(minifb::Key::Right) { joypad_state |= 0x01; }
        if window.is_key_down(minifb::Key::Left) { joypad_state |= 0x02; }
        if window.is_key_down(minifb::Key::Up) { joypad_state |= 0x04; }
        if window.is_key_down(minifb::Key::Down) { joypad_state |= 0x08; }
        if window.is_key_down(minifb::Key::Z) { joypad_state |= 0x10; } // A
        if window.is_key_down(minifb::Key::X) { joypad_state |= 0x20; } // B
        if window.is_key_down(minifb::Key::Backspace) { joypad_state |= 0x40; } // Select
        if window.is_key_down(minifb::Key::Enter) { joypad_state |= 0x80; } // Start

        // Trigger interrupt if button pressed state changed to pressed (Edge detection?)
        // Or simplified: Just request interrupt if any key is pressed?
        // Game Boy HW requests interrupt on falling edge of P10-P13 lines (when button pressed).
        // For simple emulation, we can just request it when state changes, strictly speaking.
        // But for now, let's just update the state. The CPU loop will request proper INT if P10-P13 go low.

        let prev_state = cpu.bus.joypad_state;
        cpu.bus.joypad_state = joypad_state;

        // Simple interrupt request trigger if any button pressed (not 100% accurate but works for many games)
        // Correct implementation requires checking 0xFF00 selection.
        // We will do it in CPU step loop or write_joypad logic if needed. 
        // But for now, triggering it here if state changed or simplified.
        
        // Actually, the interrupt should be requested when the line goes from High to Low.
        // Since 0=Pressed, line goes Low when button is pressed.
        if joypad_state != 0 && joypad_state != prev_state {
             cpu.bus.memory[0xFF0F] |= 0x10; // Request Joypad Interrupt (Bit 4) directly or via method
        }

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
            // 70224 cycles per frame (4.194304 MHz / 59.73 Hz)
            while executed_cycles < 70224 {
                cpu.step();
                executed_cycles += cpu.cycle_count as u32;
            }

            let framebuffer = cpu.bus.gpu.render_screen();
            window
                .update_with_buffer(&framebuffer, SCREEN_WIDTH, SCREEN_HEIGHT)
                .unwrap();
        }
    }
}
