pub mod registers;
pub mod instructions;
use registers::*;
use instructions::*;

pub struct CPU {
    registers: Registers,
}

impl Registers {
    fn get_bc(&self) -> u16 {
        (self.b as u16) << 8 | self.c as u16
    }

    fn set_bc(&mut self, value: u16) {
        self.b = ((value & 0xFF00) >> 8) as u8;
        self.c = (value & 0xFF) as u8;
    }

    fn get_hl(&self) -> u16 {
        (self.h as u16) << 8 | self.l as u16
    }

    fn set_hl(&mut self, value: u16) {
        self.h = ((value & 0xFF00) >> 8) as u8;
        self.l = (value & 0xFF) as u8;
    }

    fn get_de(&self) -> u16 {
        (self.d as u16) << 8 | self.e as u16
    }

    fn set_de(&mut self, value: u16) {
        self.d = ((value & 0xFF00) >> 8) as u8;
        self.e = (value & 0xFF) as u8;
    }
}

impl CPU {
    fn execute(&mut self, instruction: Instruction) {
        match instruction {
            Instruction::ADD(target) => {
                let mut value;
                match target {
                    ArithmeticTarget::A => { value = self.registers.d;}
                    ArithmeticTarget::B => { value = self.registers.b;}
                    ArithmeticTarget::C => { value = self.registers.c;}
                    ArithmeticTarget::D => { value = self.registers.d;}
                    ArithmeticTarget::E => { value = self.registers.e;}
                    ArithmeticTarget::H => { value = self.registers.h;}
                    ArithmeticTarget::L => { value = self.registers.l;}   
                }
                let new_value = self.add(value);
                self.registers.a = new_value;
            }
            Instruction::ADDHL() =>{
                let mut value = self.registers.get_hl();
                let result = self.addhl(value);
            }
            Instruction::ADC(target) => {
                let mut value;
                match target {
                    ArithmeticTarget::A => { value = self.registers.d;}
                    ArithmeticTarget::B => { value = self.registers.b;}
                    ArithmeticTarget::C => { value = self.registers.c;}
                    ArithmeticTarget::D => { value = self.registers.d;}
                    ArithmeticTarget::E => { value = self.registers.e;}
                    ArithmeticTarget::H => { value = self.registers.h;}
                    ArithmeticTarget::L => { value = self.registers.l;}   
                }
                let new_value = self.add(value);
                self.registers.a = new_value;
            }
            _ => { /* TODO: support more instructions */ }
        }
    }

    fn add(&mut self, value: u8) -> u8 {
        let (new_value, did_overflow) = self.registers.a.overflowing_add(value);
        self.registers.f.zero = new_value == 0;
        self.registers.f.subtract = false;
        self.registers.f.carry = did_overflow;
        self.registers.f.half_carry = (self.registers.a & 0xF) + (value & 0xF) > 0xF;
        new_value
    }

    fn addhl(&mut self, value: u16) -> u16 {
        let hl = self.registers.get_hl();
        let (new_value, did_overflow) = hl.overflowing_add(value);
        self.registers.f.zero = new_value == 0;
        self.registers.f.subtract = false;
        self.registers.f.carry = did_overflow;
        self.registers.f.half_carry = (value & 0x0FFF) + (hl & 0x0FFF) > 0x0FFF;
        new_value
    }

    fn adc(&mut self, value: u8) -> u8 {
        let carry = if self.registers.f.carry { 1 } else { 0 };
        let (new_value, did_overflow) = self.registers.a.overflowing_add(value + carry);
        self.registers.f.zero = new_value == 0;
        self.registers.f.subtract = false;
        self.registers.f.carry = did_overflow;
        self.registers.f.half_carry = (self.registers.a & 0xF) + (value & 0xF) + carry > 0xF;
        new_value
    }
}

fn main() {
    let test: u8 = 0b1000_1111;
    let test2: u8 = 0b0000_0000;
    println!("Hello, world! {:#b}", (test as u16) << 8 | test2 as u16);
}
