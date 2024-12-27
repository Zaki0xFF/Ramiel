pub mod registers;
pub mod instructions;
mod unit_tests;
use registers::*;
use instructions::*;

pub struct CPU {
    registers: Registers,
    pc: u16,
    sp: u16,
    bus: MemoryBus,
}

#[allow(dead_code)]
struct MemoryBus {
    memory: [u8; 0xFFFF]
}

impl MemoryBus {
    fn read_byte(&self, address: u16) -> u8 {
      self.memory[address as usize]
    }
}

#[allow(dead_code)]
impl CPU {
    pub fn new() -> CPU {
        CPU {
            registers: Registers {
                a: 0,
                b: 0,
                c: 0,
                d: 0,
                e: 0,
                f: FlagsRegister {
                    zero: false,
                    subtract: false,
                    half_carry: false,
                    carry: false,
                },
                h: 0,
                l: 0,
            },
            pc: 0,
            sp: 0,
            bus: MemoryBus {
                memory: {
                    let mut mem = [0u8; 0xFFFF];
                    //let boot_rom = include_bytes!("../roms/dmg0_boot.bin");
                    //mem[..boot_rom.len()].copy_from_slice(boot_rom);
                    mem
                },
            },
        }
    }

    fn get_register_value(&self, target: ArithmeticTarget) -> u8 {
        match target {
            ArithmeticTarget::A => self.registers.a,
            ArithmeticTarget::B => self.registers.b,
            ArithmeticTarget::C => self.registers.c,
            ArithmeticTarget::D => self.registers.d,
            ArithmeticTarget::E => self.registers.e,
            ArithmeticTarget::H => self.registers.h,
            ArithmeticTarget::L => self.registers.l,
        }
    }

    fn step(&mut self) {
        let mut instruction_byte = self.bus.read_byte(self.pc);
        let prefixed = instruction_byte == 0xCB;
        if prefixed{
            instruction_byte = self.bus.read_byte(self.pc.wrapping_add(1));
            panic!("Prefixed instruction not supported: 0xCB{:x}", instruction_byte);
        }
        let next_pc: u16 = if let Some(instruction) = Instruction::from_byte(instruction_byte) {
          self.execute(instruction)
        } else {
            let description = format!("0x{}{:x}", if prefixed { "cb" } else { "" }, instruction_byte);
            panic!("Unkown instruction found for: {}", description);
        };
    
        self.pc = next_pc;
      }

    fn execute(&mut self, instruction: Instruction) -> u16 {
        match instruction {
            Instruction::ADD(target) => {
                let value = self.get_register_value(target);
                let (new_value, did_overflow) = self.registers.a.overflowing_add(value);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.carry = did_overflow;
                self.registers.f.half_carry = (self.registers.a & 0xF) + (value & 0xF) > 0xF;
                self.registers.a = new_value;
            }
            Instruction::ADDHL(target) => {
                let value = match target {
                    DoubleTarget::BC => self.registers.get_bc(),
                    DoubleTarget::DE => self.registers.get_de(),
                    DoubleTarget::HL => self.registers.get_hl(),
                    DoubleTarget::SP => self.sp,
                };
                let (new_value, did_overflow) = self.registers.get_hl().overflowing_add(value);
                self.registers.f.subtract = false;
                self.registers.f.carry = did_overflow;
                self.registers.f.half_carry = (self.registers.get_hl() & 0xFFF) + (value & 0xFFF) > 0xFFF;
                self.registers.set_hl(new_value);
            }
            Instruction::ADC(target) => {
                let value = self.get_register_value(target);
                let carry = if self.registers.f.carry { 1 } else { 0 };
                let (new_value, did_overflow) = self.registers.a.overflowing_add(value + carry);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.carry = did_overflow;
                self.registers.f.half_carry = (self.registers.a & 0xF) + (value & 0xF) + carry > 0xF;
                self.registers.a = new_value.wrapping_add(if did_overflow { 1 } else { 0 });
            }
            Instruction::SUB(target) => {
                let value = self.get_register_value(target);
                let (new_value, did_overflow) = self.registers.a.overflowing_sub(value);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = true;
                self.registers.f.carry = did_overflow;
                self.registers.f.half_carry = (self.registers.a & 0xF) < (value & 0xF);
                self.registers.a = new_value;
            }
            Instruction::SBC(target) => {
                let value = self.get_register_value(target);
                let carry = if self.registers.f.carry { 1 } else { 0 };
                let (new_value, did_overflow) = self.registers.a.overflowing_sub(value + carry);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = true;
                self.registers.f.carry = did_overflow;
                self.registers.f.half_carry = (self.registers.a & 0xF) < (value & 0xF) + carry;
                self.registers.a = new_value;
            }
            Instruction::AND(target) => {
                let value = self.get_register_value(target);
                let new_value = self.registers.a & value;
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = true;
                self.registers.f.carry = false;
                self.registers.a = new_value;
            }
            Instruction::OR(target) => {
                let value = self.get_register_value(target);
                let new_value = self.registers.a | value;
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.registers.f.carry = false;
                self.registers.a = new_value;
            }
            Instruction::XOR(target) => {
                let value = self.get_register_value(target);
                let new_value = self.registers.a ^ value;
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.registers.f.carry = false;
                self.registers.a = new_value;
            }
            Instruction::CP(target) => {
                let value = self.get_register_value(target);
                let new_value = self.registers.a - value;
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = true;
                self.registers.f.half_carry = (self.registers.a & 0xF) < (value & 0xF);
                self.registers.f.carry = self.registers.a < value;
            }
            Instruction::INC(target) => {
                match target {
                    ArithmeticTarget::A => { self.registers.a += 1;}
                    ArithmeticTarget::B => { self.registers.b += 1;}
                    ArithmeticTarget::C => { self.registers.c += 1;}
                    ArithmeticTarget::D => { self.registers.d += 1;}
                    ArithmeticTarget::E => { self.registers.e += 1;}
                    ArithmeticTarget::H => { self.registers.h += 1;}
                    ArithmeticTarget::L => { self.registers.l += 1;}
                }
            }
            Instruction::INCDBL(target) => {
                match target {
                    DoubleTarget::BC => { self.registers.set_bc(self.registers.get_bc() + 1); }
                    DoubleTarget::DE => { self.registers.set_de(self.registers.get_de() + 1); }
                    DoubleTarget::HL => { self.registers.set_hl(self.registers.get_hl() + 1); }
                    DoubleTarget::SP => { self.sp += 1; }
                }
            }
            Instruction::DEC(target) => {
                match target {
                    ArithmeticTarget::A => { self.registers.a -= 1;}
                    ArithmeticTarget::B => { self.registers.b -= 1;}
                    ArithmeticTarget::C => { self.registers.c -= 1;}
                    ArithmeticTarget::D => { self.registers.d -= 1;}
                    ArithmeticTarget::E => { self.registers.e -= 1;}
                    ArithmeticTarget::H => { self.registers.h -= 1;}
                    ArithmeticTarget::L => { self.registers.l -= 1;}  
                }
            }
            Instruction::DECDBL(target) => {
                match target {
                    DoubleTarget::BC => { self.registers.set_bc(self.registers.get_bc() - 1); }
                    DoubleTarget::DE => { self.registers.set_de(self.registers.get_de() - 1); }
                    DoubleTarget::HL => { self.registers.set_hl(self.registers.get_hl() - 1); }
                    DoubleTarget::SP => { self.sp -= 1; }
                }
            }
            Instruction::CCF() => {
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.registers.f.carry = !self.registers.f.carry;
            }
            Instruction::SCF() => {
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.registers.f.carry = true;
            }
            Instruction::RRA() => {
                let carry = self.registers.f.carry;
                self.registers.f.carry = self.registers.a & 0x1 == 0x1;
                self.registers.a = (self.registers.a >> 1) | (if carry { 0x80 } else { 0x00 });
            }
            Instruction::RLA() => {
                let carry = self.registers.f.carry;
                self.registers.f.carry = self.registers.a & 0x80 == 0x80;
                self.registers.a = (self.registers.a << 1) | (if carry { 0x1 } else { 0x0 });
            }
            Instruction::RRCA() => {
                self.registers.f.carry = self.registers.a & 0x1 == 0x1;
                self.registers.a = (self.registers.a >> 1) | (self.registers.a << 7);
            }
            Instruction::RRLA() => {
                self.registers.f.carry = self.registers.a & 0x80 == 0x80;
                self.registers.a = (self.registers.a << 1) | (self.registers.a >> 7);
            }
            Instruction::CPL() => {
                self.registers.a = !self.registers.a;
                self.registers.f.subtract = true;
                self.registers.f.half_carry = true;
            }
            Instruction::BIT(u8,target) => {
                let value = self.get_register_value(target);
                self.registers.f.zero = (value & (1 << u8)) == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = true;
            }
            Instruction::RESET(target) => {
                let value = self.get_register_value(target);
                self.registers.f.zero = (value & 0x1) == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = true;
            }
            Instruction::SET(target) => {
                match target {
                    ArithmeticTarget::A => { self.registers.a |= 1 << 3; }
                    ArithmeticTarget::B => { self.registers.b |= 1 << 3; }
                    ArithmeticTarget::C => { self.registers.c |= 1 << 3; }
                    ArithmeticTarget::D => { self.registers.d |= 1 << 3; }
                    ArithmeticTarget::E => { self.registers.e |= 1 << 3; }
                    ArithmeticTarget::H => { self.registers.h |= 1 << 3; }
                    ArithmeticTarget::L => { self.registers.l |= 1 << 3; }
                }
                // Update flags if necessary
                self.registers.f.zero = false;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
            }
            Instruction::SRL(target) => {
                let value = self.get_register_value(target);
                self.registers.f.carry = value & 0x1 == 0x1;
                let new_value = value >> 1;
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
            }
            Instruction::RR(target) => {
                let value = self.get_register_value(target);
                let carry = self.registers.f.carry;
                self.registers.f.carry = value & 0x1 == 0x1;
                let new_value = (value >> 1) | (if carry { 0x80 } else { 0x00 });
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
            }
            Instruction::RL(target) => {
                let value = self.get_register_value(target);
                let carry = self.registers.f.carry;
                self.registers.f.carry = value & 0x80 == 0x80;
                let new_value = (value << 1) | (if carry { 0x1 } else { 0x0 });
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
            }
            Instruction::RRC(target) => {
                let value = self.get_register_value(target);
                self.registers.f.carry = value & 0x1 == 0x1;
                let new_value = (value >> 1) | (value << 7);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
            }
            Instruction::RLC(target) => {
                let value = self.get_register_value(target);
                self.registers.f.carry = value & 0x80 == 0x80;
                let new_value = (value << 1) | (value >> 7);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
            }
            Instruction::SRA(target) => {
                let value = self.get_register_value(target);
                self.registers.f.carry = value & 0x1 == 0x1;
                let new_value = (value >> 1) | (value & 0x80);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
            }
            Instruction::SLA(target) => {
                let value = self.get_register_value(target);
                self.registers.f.carry = value & 0x80 == 0x80;
                let new_value = value << 1;
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
            }
            Instruction::SWAP(target) => {
                let value = self.get_register_value(target);
                let new_value = (value >> 4) | (value << 4);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.registers.f.carry = false;
            }
            Instruction::LD(target) => {
                let value = self.bus.read_byte(self.pc.wrapping_add(1));
                match target {
                    ArithmeticTarget::A => { self.registers.a = value; }
                    ArithmeticTarget::B => { self.registers.b = value; }
                    ArithmeticTarget::C => { self.registers.c = value; }
                    ArithmeticTarget::D => { self.registers.d = value; }
                    ArithmeticTarget::E => { self.registers.e = value; }
                    ArithmeticTarget::H => { self.registers.h = value; }
                    ArithmeticTarget::L => { self.registers.l = value; }
                }
            }
            Instruction::LDDBL(target) => {
                let value = self.bus.read_byte(self.pc.wrapping_add(1));
                match target {
                    DoubleTarget::BC => { self.registers.set_bc(value as u16); }
                    DoubleTarget::DE => { self.registers.set_de(value as u16); }
                    DoubleTarget::HL => { self.registers.set_hl(value as u16); }
                    DoubleTarget::SP => { self.sp = value as u16; }
                }
            }
            Instruction::ADCHL(target) => {
                let value = self.bus.read_byte(self.pc.wrapping_add(1));
                let (new_value, did_overflow) = self.registers.get_hl().overflowing_add(value as u16);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.carry = did_overflow;
                self.registers.f.half_carry = (self.registers.get_hl() & 0xFFF) + (value as u16 & 0xFFF) > 0xFFF;
                self.registers.set_hl(new_value);
            }
            Instruction::NOP() => {}
            Instruction::STOP() => {unimplemented!("STOP instruction not implemented yet")},
            Instruction::DAA() => {
                let mut adjust = 0;
                let mut carry = self.registers.f.carry;
            
                if !self.registers.f.subtract {
                    if self.registers.f.half_carry || (self.registers.a & 0x0F) > 9 {
                        adjust |= 0x06;
                    }
                    if self.registers.f.carry || self.registers.a > 0x99 {
                        adjust |= 0x60;
                        carry = true;
                    }
                    self.registers.a = self.registers.a.wrapping_add(adjust);
                } else {
                    if self.registers.f.half_carry {
                        adjust |= 0x06;
                    }
                    if self.registers.f.carry {
                        adjust |= 0x60;
                    }
                    self.registers.a = self.registers.a.wrapping_sub(adjust);
                }
            
                self.registers.f.half_carry = false;
                self.registers.f.zero = self.registers.a == 0;
                self.registers.f.carry = carry;
            }
            _ => { /* TODO: support more instructions */ unimplemented!("not implemented yet cannot execute") }
        }
        print!("{:?}", &instruction);
        return self.pc.wrapping_add(1);
    }
}

fn main() {
    let mut cpu = CPU::new();

    cpu.step();
}
