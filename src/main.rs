pub mod cpu;
pub mod gpu;
pub mod instructions;
pub mod registers;
mod unit_tests;
use cpu::CPU;
use log::LevelFilter;
use minifb::{Key, Scale, Window, WindowOptions};
use std::path::Path;

fn main() {
    env_logger::builder().filter_level(LevelFilter::Info).init();
    let path = Path::new("./roms/dmg_boot.bin");
    let mut cpu = CPU::new_with_rom(path).unwrap();

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
    while window.is_open() && !window.is_key_down(Key::Escape) {
        cpu.step();

        let framebuffer = cpu.bus.gpu.render_screen();
        window.update_with_buffer(&framebuffer, 160, 144).unwrap();
    }
}
