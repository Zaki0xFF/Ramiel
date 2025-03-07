pub mod cpu;
pub mod instructions;
pub mod registers;
mod unit_tests;
use cpu::CPU;
use std::io::{self, Write};
use std::path::Path;

fn main() {
    let path = Path::new("./roms/dmg_boot.bin");
    let mut cpu = CPU::new_with_rom(path).unwrap();
    while !(cpu.pc == 0x006a) {
        cpu.step();
    }
    loop {
        print!("Press Enter to step:");
        io::stdout().flush().unwrap();

        let mut input = String::new();
        io::stdin()
            .read_line(&mut input)
            .expect("Failed to read from stdin");

        cpu.step();
        print!("\n");
    }
}
