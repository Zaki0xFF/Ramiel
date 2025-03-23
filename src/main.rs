use cpu::CPU;
use minifb::{Scale, Window, WindowOptions};
use std::path::Path;

mod cpu;
mod gpu;
mod instructions;
mod registers;
mod unit_tests;

fn main() {
    pub const SCREEN_WIDTH: usize = 160;
    pub const SCREEN_HEIGHT: usize = 144;

    env_logger::builder()
        .filter_level(log::LevelFilter::Info)
        .init();

    let path = Path::new("./roms/dmg_boot.bin");
    let mut cpu = CPU::new_bootrom(path).unwrap();
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
        // Gameboy CPU runs at 4.194304MHz
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
