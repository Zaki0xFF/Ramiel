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

    fn write_byte(&mut self, address: u16, value: u8) {
      self.memory[address as usize] = value;
    }
}

#[allow(dead_code)]
impl Default for CPU {
    fn default() -> Self {
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
                ime: false,
            },
            pc: 0,
            sp: 0,
            bus: MemoryBus {
                memory: {
                    let mut _mem = [0u8; 0xFFFF];
                    //let boot_rom = include_bytes!("../roms/dmg0_boot.bin");
                    //mem[..boot_rom.len()].copy_from_slice(boot_rom);
                    [0u8; 0xFFFF]
                },
            },
        }
    }
}

impl CPU {
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

    fn jump(&mut self, address: u16) {
        self.pc = address;
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
            Instruction::ADD(target, source) => {
                let mut value = 0;
                match source {
                    Target::Register(arithmetic_target) => {
                        value = self.get_register_value(arithmetic_target);
                    }
                    Target::Const8() => {
                        value = self.bus.read_byte(self.pc.wrapping_add(1));
                    }
                    Target::Register16(target) => { // TODO: FIX THIS
                        panic!("This does not work yet");
                        let mut value: u16 = value as u16;
                        match target{
                            DoubleTarget::BC => { value = self.registers.get_bc(); }
                            DoubleTarget::DE => { value = self.registers.get_de(); }
                            DoubleTarget::HL => { value = self.registers.get_hl(); }
                            DoubleTarget::SP => { value = self.sp; }
                        }
                    }
                    _ => { panic!("Invalid target for ADD instruction: {:?}", target); }
                }
                match target {
                    Target::Register(arithmetic_target) => {
                         let (new_value, did_overflow) = match arithmetic_target {
                            ArithmeticTarget::A => { self.registers.a.overflowing_add(value) }
                            ArithmeticTarget::B => { self.registers.b.overflowing_add(value) }
                            ArithmeticTarget::C => { self.registers.c.overflowing_add(value) }
                            ArithmeticTarget::D => { self.registers.d.overflowing_add(value) }
                            ArithmeticTarget::E => { self.registers.e.overflowing_add(value) }
                            ArithmeticTarget::H => { self.registers.h.overflowing_add(value) }
                            ArithmeticTarget::L => { self.registers.l.overflowing_add(value) }
                        };
                        print!("Value: {} \n", value);
                        self.registers.f.zero = new_value == 0;
                        self.registers.f.subtract = false;
                        self.registers.f.carry = did_overflow;
                        self.registers.f.half_carry = ((self.registers.a & 0xF) + (value & 0xF)) & 0x10 == 0x10;
                        match arithmetic_target {
                            ArithmeticTarget::A => { self.registers.a = new_value; }
                            ArithmeticTarget::B => { self.registers.b = new_value; }
                            ArithmeticTarget::C => { self.registers.c = new_value; }
                            ArithmeticTarget::D => { self.registers.d = new_value; }
                            ArithmeticTarget::E => { self.registers.e = new_value; }
                            ArithmeticTarget::H => { self.registers.h = new_value; }
                            ArithmeticTarget::L => { self.registers.l = new_value; }
                        }
                    }
                    Target::Register16(target) => { // TODO
                        panic!("This does not work yet");
                        let value = match target{
                            DoubleTarget::BC => { self.registers.get_bc() }
                            DoubleTarget::DE => { self.registers.get_de() }
                            DoubleTarget::HL => { self.registers.get_hl() }
                            DoubleTarget::SP => { self.sp }
                        };
                        let (new_value, did_overflow) = self.registers.get_hl().overflowing_add(value);
                        self.registers.f.subtract = false;
                        self.registers.f.carry = did_overflow;
                        self.registers.f.half_carry = ((self.registers.get_hl() & 0xFFF) + (value & 0xFFF)) & 0x1000 == 0x1000;
                        match target{
                            DoubleTarget::BC => { self.registers.set_bc(new_value); }
                            DoubleTarget::DE => { self.registers.set_de(new_value); }
                            DoubleTarget::HL => { self.registers.set_hl(new_value); }
                            DoubleTarget::SP => { self.sp = new_value; }
                        }
                    }
                    Target::MemoryR16(target) => {
                        let hl_value = match target {
                            DoubleTarget::BC => self.registers.get_bc(),
                            DoubleTarget::DE => self.registers.get_de(),
                            DoubleTarget::HL => self.registers.get_hl(),
                            DoubleTarget::SP => self.sp,
                        };
                        let value = self.bus.read_byte(hl_value);
                        let (result, carry1) = self.registers.a.overflowing_add(value);
                        let (result, carry2) = result.overflowing_add(if self.registers.f.carry { 1 } else { 0 });
                        self.registers.f.zero = result == 0;
                        self.registers.f.subtract = false;
                        self.registers.f.carry = carry1 || carry2;
                        self.registers.f.half_carry = (self.registers.a & 0xF) + (value & 0xF) + (if self.registers.f.carry { 1 } else { 0 }) > 0xF;
                        self.registers.a = result;
                    }
                    _ => { panic!("Invalid source for ADD instruction: {:?}", source); }
                }
            }
            Instruction::ADC(target) => {
                match target {
                    Target::Const8() => {
                        let value = self.bus.read_byte(self.pc.wrapping_add(1));
                        let carry = if self.registers.f.carry { 1 } else { 0 };
                        let (new_value, did_overflow) = self.registers.a.overflowing_add(value + carry);
                        self.registers.f.zero = new_value == 0;
                        self.registers.f.subtract = false;
                        self.registers.f.carry = did_overflow;
                        self.registers.f.half_carry = (self.registers.a & 0xF) + (value & 0xF) + carry > 0xF;
                        self.registers.a = new_value.wrapping_add(if did_overflow { 1 } else { 0 });
                    }
                    Target::Register(arithmetic_target) => {
                        let value = self.get_register_value(arithmetic_target);
                        let carry = if self.registers.f.carry { 1 } else { 0 };
                        let (new_value, did_overflow) = self.registers.a.overflowing_add(value + carry);
                        self.registers.f.zero = new_value == 0;
                        self.registers.f.subtract = false;
                        self.registers.f.carry = did_overflow;
                        self.registers.f.half_carry = (self.registers.a & 0xF) + (value & 0xF) + carry > 0xF;
                        self.registers.a = new_value.wrapping_add(if did_overflow { 1 } else { 0 });
                    }
                    Target::MemoryR16(_target) => {
                        let hl_value = self.registers.get_hl();
                        let value = self.bus.read_byte(hl_value);
                        let carry = if self.registers.f.carry { 1 } else { 0 };
                        let (result, carry1) = self.registers.a.overflowing_add(value);
                        let (result, carry2) = result.overflowing_add(carry);
                        self.registers.f.zero = result == 0;
                        self.registers.f.subtract = false;
                        self.registers.f.carry = carry1 || carry2;
                        self.registers.f.half_carry = (self.registers.a & 0xF) + (value & 0xF) + carry > 0xF;
                        self.registers.a = result;
                    }
                    _ => { panic!("Invalid target for ADC instruction: {:?}", target); }
                }
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
                    ArithmeticTarget::A => { 
                        self.registers.a -= 1;
                        self.registers.f.zero = self.registers.a == 0;
                        self.registers.f.half_carry = (self.registers.a & 0xF) == 0;
                    }
                    ArithmeticTarget::B => { 
                        self.registers.b -= 1;
                        self.registers.f.zero = self.registers.b == 0;
                        self.registers.f.half_carry = (self.registers.b & 0xF) == 0;
                    }
                    ArithmeticTarget::C => {
                         self.registers.c -= 1;
                         self.registers.f.zero = self.registers.c == 0;
                         self.registers.f.half_carry = (self.registers.c & 0xF) == 0;
                    }
                    ArithmeticTarget::D => { 
                        self.registers.d -= 1;
                        self.registers.f.zero = self.registers.d == 0;
                        self.registers.f.half_carry = (self.registers.d & 0xF) == 0;
                    }
                    ArithmeticTarget::E => { 
                        self.registers.e -= 1;
                        self.registers.f.zero = self.registers.e == 0;
                        self.registers.f.half_carry = (self.registers.e & 0xF) == 0;
                    }
                    ArithmeticTarget::H => { 
                        self.registers.h -= 1;
                        self.registers.f.zero = self.registers.h == 0;
                        self.registers.f.half_carry = (self.registers.h & 0xF) == 0;
                    }
                    ArithmeticTarget::L => { 
                        self.registers.l -= 1;
                        self.registers.f.zero = self.registers.l == 0;
                        self.registers.f.half_carry = (self.registers.l & 0xF) == 0;}  
                    }
                self.registers.f.subtract = true;
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
                self.registers.a = self.registers.a.rotate_right(1);
            }
            Instruction::RRLA() => {
                self.registers.f.carry = self.registers.a & 0x80 == 0x80;
                self.registers.a = self.registers.a.rotate_left(1);
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
            Instruction::SET(offset,target) => {
                match target {
                    ArithmeticTarget::A => { self.registers.a |= 1 << offset; }
                    ArithmeticTarget::B => { self.registers.b |= 1 << offset; }
                    ArithmeticTarget::C => { self.registers.c |= 1 << offset; }
                    ArithmeticTarget::D => { self.registers.d |= 1 << offset; }
                    ArithmeticTarget::E => { self.registers.e |= 1 << offset; }
                    ArithmeticTarget::H => { self.registers.h |= 1 << offset; }
                    ArithmeticTarget::L => { self.registers.l |= 1 << offset; }
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
                let new_value = value.rotate_right(1);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
            }
            Instruction::RLC(target) => {
                let value = self.get_register_value(target);
                self.registers.f.carry = value & 0x80 == 0x80;
                let new_value = value.rotate_left(1);
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
                let new_value = value.rotate_left(4);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.registers.f.carry = false;
            }
            Instruction::LD(target, source) => {
                let mut value = 0;
                match source {
                    Target::Register(arithmetic_target) => {
                        value = match arithmetic_target {
                            ArithmeticTarget::A => { self.registers.a }
                            ArithmeticTarget::B => { self.registers.b }
                            ArithmeticTarget::C => { self.registers.c }
                            ArithmeticTarget::D => { self.registers.d }
                            ArithmeticTarget::E => { self.registers.e }
                            ArithmeticTarget::H => { self.registers.h }
                            ArithmeticTarget::L => { self.registers.l }
                        }
                    },
                    Target::Register16(double_target) => {//TODO: FIX THIS
                        panic!("This does not work yet");
                        let mut value: u16 = value as u16;
                        match double_target{
                            DoubleTarget::BC => { value = self.registers.get_bc(); }
                            DoubleTarget::DE => { value = self.registers.get_de(); }
                            DoubleTarget::HL => { value = self.registers.get_hl(); }
                            DoubleTarget::SP => { value = self.sp; }
                        }
                    },
                    Target::MemoryR8(arithmetic_target) => {
                        match arithmetic_target {
                            ArithmeticTarget::A => { value = self.bus.memory[self.registers.a as usize]; }
                            ArithmeticTarget::B => { value = self.bus.memory[self.registers.b as usize]; }
                            ArithmeticTarget::C => { value = self.bus.memory[self.registers.c as usize]; }
                            ArithmeticTarget::D => { value = self.bus.memory[self.registers.d as usize]; }
                            ArithmeticTarget::E => { value = self.bus.memory[self.registers.e as usize]; }
                            ArithmeticTarget::H => { value = self.bus.memory[self.registers.h as usize]; }
                            ArithmeticTarget::L => { value = self.bus.memory[self.registers.l as usize]; }
                        }
                    },
                    Target::MemoryR16(double_target) => {
                        match double_target {
                            DoubleTarget::BC => { value = self.bus.memory[self.registers.get_bc() as usize]; }
                            DoubleTarget::DE => { value = self.bus.memory[self.registers.get_de() as usize]; }
                            DoubleTarget::HL => { value = self.bus.memory[self.registers.get_hl() as usize]; }
                            DoubleTarget::SP => { value = self.bus.memory[self.sp as usize]; }
                        }
                    },
                    Target::Const8() => {
                        value = self.bus.read_byte(self.pc.wrapping_add(1));
                    },
                    Target::Const16() => {
                        value = self.bus.read_byte(self.pc.wrapping_add(1));
                    },
                    Target::MemoryConst16() => {
                        let address = self.bus.read_byte(self.pc.wrapping_add(1));
                        value = self.bus.read_byte(address as u16);
                    },
                }
                match target {
                    Target::Register(arithmetic_target) => {
                        match arithmetic_target {
                            ArithmeticTarget::A => { self.registers.a = value; }
                            ArithmeticTarget::B => { self.registers.b = value; }
                            ArithmeticTarget::C => { self.registers.c = value; }
                            ArithmeticTarget::D => { self.registers.d = value; }
                            ArithmeticTarget::E => { self.registers.e = value; }
                            ArithmeticTarget::H => { self.registers.h = value; }
                            ArithmeticTarget::L => { self.registers.l = value; }
                        }
                    },
                    Target::Register16(double_target) => {
                        match double_target {
                            DoubleTarget::BC => { self.registers.set_bc(value as u16); }
                            DoubleTarget::DE => { self.registers.set_de(value as u16); }
                            DoubleTarget::HL => { self.registers.set_hl(value as u16); }
                            DoubleTarget::SP => { self.sp = value as u16; }
                        }
                    }
                    Target::MemoryR8(arithmetic_target) => { 
                        match arithmetic_target {
                            ArithmeticTarget::A => { self.bus.memory[self.registers.a as usize] = value; }
                            ArithmeticTarget::B => { self.bus.memory[self.registers.b as usize] = value; }
                            ArithmeticTarget::C => { self.bus.memory[self.registers.c as usize] = value; }
                            ArithmeticTarget::D => { self.bus.memory[self.registers.d as usize] = value; }
                            ArithmeticTarget::E => { self.bus.memory[self.registers.e as usize] = value; }
                            ArithmeticTarget::H => { self.bus.memory[self.registers.h as usize] = value; }
                            ArithmeticTarget::L => { self.bus.memory[self.registers.l as usize] = value; }
                        }
                    }
                    Target::MemoryR16(double_target) => {
                        match double_target {
                            DoubleTarget::BC => { self.bus.memory[self.registers.get_bc() as usize] = value; }
                            DoubleTarget::DE => { self.bus.memory[self.registers.get_de() as usize] = value; }
                            DoubleTarget::HL => { self.bus.memory[self.registers.get_hl() as usize] = value; }
                            DoubleTarget::SP => { self.bus.memory[self.sp as usize] = value; }
                        }
                    }
                    _ => { panic!("Invalid target for LD instruction: {:?}", target);}
                }
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
            Instruction::DI() => {self.registers.ime = false;}
            Instruction::EI() => {self.registers.ime = true;}
            Instruction::JP(condition, address) => { //address = 0 outside tests
                let target_address = self.bus.read_byte(self.pc.wrapping_add(1)) as u16 
                    | ((self.bus.read_byte(self.pc.wrapping_add(2)) as u16) << 8);
                
                let jump = match condition {
                    JumpCondition::Always => true,
                    JumpCondition::Zero => self.registers.f.zero,
                    JumpCondition::NotZero => !self.registers.f.zero,
                    JumpCondition::Carry => self.registers.f.carry,
                    JumpCondition::NotCarry => !self.registers.f.carry,
                };
            
                if jump {
                    if address != 0 { self.pc = address; }
                    else { self.pc = target_address; }
                } else {
                    return self.pc.wrapping_add(3);  // Skip over the instruction (1 byte) and operand (2 bytes)
                }
            }
            _ => { /* TODO: support more instructions */ unimplemented!("not implemented yet cannot execute") }
        }
        print!("{:?}", &instruction);
        self.pc.wrapping_add(1)
    }
}

fn main() {
    let mut cpu = CPU::default();

    cpu.step();
}
