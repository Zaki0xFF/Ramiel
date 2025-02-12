pub mod instructions;
pub mod registers;
mod unit_tests;
use instructions::*;
use registers::*;

pub struct CPU {
    registers: Registers,
    pc: u16,
    sp: u16,
    bus: MemoryBus,
}

#[allow(dead_code)]
struct MemoryBus {
    memory: [u8; 0xFFFF],
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

    fn get_source_value(&mut self, source: Target) -> u16 {
        let value: u16 = match source {
            Target::Register(arithmetic_target) => match arithmetic_target {
                ArithmeticTarget::A => self.registers.a as u16,
                ArithmeticTarget::B => self.registers.b as u16,
                ArithmeticTarget::C => self.registers.c as u16,
                ArithmeticTarget::D => self.registers.d as u16,
                ArithmeticTarget::E => self.registers.e as u16,
                ArithmeticTarget::H => self.registers.h as u16,
                ArithmeticTarget::L => self.registers.l as u16,
            },
            Target::Register16(double_target) => match double_target {
                DoubleTarget::BC => self.registers.get_bc(),
                DoubleTarget::DE => self.registers.get_de(),
                DoubleTarget::HL => self.registers.get_hl(),
                DoubleTarget::SP => self.sp,
            },
            Target::MemoryR8(arithmetic_target) => match arithmetic_target {
                ArithmeticTarget::A => self.bus.memory[self.registers.a as usize] as u16,
                ArithmeticTarget::B => self.bus.memory[self.registers.b as usize] as u16,
                ArithmeticTarget::C => self.bus.memory[self.registers.c as usize] as u16,
                ArithmeticTarget::D => self.bus.memory[self.registers.d as usize] as u16,
                ArithmeticTarget::E => self.bus.memory[self.registers.e as usize] as u16,
                ArithmeticTarget::H => self.bus.memory[self.registers.h as usize] as u16,
                ArithmeticTarget::L => self.bus.memory[self.registers.l as usize] as u16,
            },
            Target::MemoryR16(double_target) => match double_target {
                DoubleTarget::BC => self.bus.memory[self.registers.get_bc() as usize] as u16,
                DoubleTarget::DE => self.bus.memory[self.registers.get_de() as usize] as u16,
                DoubleTarget::HL => self.bus.memory[self.registers.get_hl() as usize] as u16,
                DoubleTarget::SP => self.bus.memory[self.sp as usize] as u16,
            },
            Target::Const8() => {
                self.pc = self.pc.wrapping_add(1);
                self.bus.read_byte(self.pc.wrapping_add(1)) as u16
            }
            Target::Const16() => {
                self.pc = self.pc.wrapping_add(2);
                self.bus.read_byte(self.pc.wrapping_add(1)) as u16 //Probably wrong
            }
            Target::MemoryConst16() => {
                let address = self.bus.read_byte(self.pc.wrapping_add(1)); // Probably wrong
                self.bus.read_byte(address as u16) as u16
            }
        };
        value
    }

    fn _jump(&mut self, address: u16) {
        self.pc = address;
    }

    fn step(&mut self) {
        let mut instruction_byte = self.bus.read_byte(self.pc);
        let prefixed = instruction_byte == 0xCB;
        if prefixed {
            instruction_byte = self.bus.read_byte(self.pc.wrapping_add(1));
            panic!(
                "Prefixed instruction not supported: 0xCB{:x}",
                instruction_byte
            );
        }
        let next_pc: u16 =
            if let Some(instruction) = Instruction::from_byte(instruction_byte, prefixed) {
                self.execute(instruction)
            } else {
                let description = format!(
                    "0x{}{:x}",
                    if prefixed { "cb" } else { "" },
                    instruction_byte
                );
                panic!("Unkown instruction found for: {}", description);
            };

        self.pc = next_pc;
    }

    fn execute(&mut self, instruction: Instruction) -> u16 {
        match instruction {
            Instruction::ADD(target, source) => {
                let value: u16 = self.get_source_value(source);
                match target {
                    Target::Register(arithmetic_target) => {
                        let value = value as u8;
                        let (new_value, did_overflow) = match arithmetic_target {
                            ArithmeticTarget::A => self.registers.a.overflowing_add(value),
                            ArithmeticTarget::B => self.registers.b.overflowing_add(value),
                            ArithmeticTarget::C => self.registers.c.overflowing_add(value),
                            ArithmeticTarget::D => self.registers.d.overflowing_add(value),
                            ArithmeticTarget::E => self.registers.e.overflowing_add(value),
                            ArithmeticTarget::H => self.registers.h.overflowing_add(value),
                            ArithmeticTarget::L => self.registers.l.overflowing_add(value),
                        };
                        self.registers.f.zero = new_value == 0;
                        self.registers.f.subtract = false;
                        self.registers.f.carry = did_overflow;
                        self.registers.f.half_carry =
                            ((self.registers.a & 0xF) + (value & 0xF)) & 0x10 == 0x10;
                        match arithmetic_target {
                            ArithmeticTarget::A => {
                                self.registers.a = new_value;
                            }
                            ArithmeticTarget::B => {
                                self.registers.b = new_value;
                            }
                            ArithmeticTarget::C => {
                                self.registers.c = new_value;
                            }
                            ArithmeticTarget::D => {
                                self.registers.d = new_value;
                            }
                            ArithmeticTarget::E => {
                                self.registers.e = new_value;
                            }
                            ArithmeticTarget::H => {
                                self.registers.h = new_value;
                            }
                            ArithmeticTarget::L => {
                                self.registers.l = new_value;
                            }
                        }
                    }
                    Target::Register16(target) => {
                        let val = match target {
                            DoubleTarget::BC => self.registers.get_bc(),
                            DoubleTarget::DE => self.registers.get_de(),
                            DoubleTarget::HL => self.registers.get_hl(),
                            DoubleTarget::SP => self.sp,
                        };
                        let (new_value, did_overflow) = val.overflowing_add(value);
                        self.registers.f.subtract = false;
                        self.registers.f.carry = did_overflow;
                        self.registers.f.half_carry =
                            ((val & 0xFFF) + (value & 0xFFF)) & 0x1000 == 0x1000;
                        match target {
                            DoubleTarget::BC => {
                                self.registers.set_bc(new_value);
                            }
                            DoubleTarget::DE => {
                                self.registers.set_de(new_value);
                            }
                            DoubleTarget::HL => {
                                self.registers.set_hl(new_value);
                            }
                            DoubleTarget::SP => {
                                self.sp = new_value;
                            }
                        }
                    }
                    _ => {
                        panic!("Invalid source for ADD instruction: {:?}", source);
                    }
                }
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::ADC(target) => {
                match target {
                    Target::Const8() => {
                        let value = self.bus.read_byte(self.pc.wrapping_add(1));
                        let carry = if self.registers.f.carry { 1 } else { 0 };
                        let (new_value, did_overflow) =
                            self.registers.a.overflowing_add(value + carry);
                        self.registers.f.zero = new_value == 0;
                        self.registers.f.subtract = false;
                        self.registers.f.carry = did_overflow;
                        self.registers.f.half_carry =
                            (self.registers.a & 0xF) + (value & 0xF) + carry > 0xF;
                        self.registers.a = new_value.wrapping_add(if did_overflow { 1 } else { 0 });
                        self.pc = self.pc.wrapping_add(1);
                    }
                    Target::Register(arithmetic_target) => {
                        let value = self.get_register_value(arithmetic_target);
                        let carry = if self.registers.f.carry { 1 } else { 0 };
                        let (new_value, did_overflow) =
                            self.registers.a.overflowing_add(value + carry);
                        self.registers.f.zero = new_value == 0;
                        self.registers.f.subtract = false;
                        self.registers.f.carry = did_overflow;
                        self.registers.f.half_carry =
                            (self.registers.a & 0xF) + (value & 0xF) + carry > 0xF;
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
                        self.registers.f.half_carry =
                            (self.registers.a & 0xF) + (value & 0xF) + carry > 0xF;
                        self.registers.a = result;
                    }
                    _ => {
                        panic!("Invalid target for ADC instruction: {:?}", target);
                    }
                }
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::SUB(target) => match target {
                Target::Register(arithmetic_target) => {
                    let value = self.get_register_value(arithmetic_target);
                    let (new_value, did_overflow) = self.registers.a.overflowing_sub(value);
                    self.registers.f.zero = new_value == 0;
                    self.registers.f.carry = did_overflow;
                    self.registers.f.subtract = true;
                    self.registers.f.half_carry = (self.registers.a & 0xF) < (value & 0xF);
                    self.registers.a = new_value;
                    self.pc = self.pc.wrapping_add(1);
                }
                Target::MemoryR16(target) => {
                    let hl_value = match target {
                        DoubleTarget::BC => self.registers.get_bc(),
                        DoubleTarget::DE => self.registers.get_de(),
                        DoubleTarget::HL => self.registers.get_hl(),
                        DoubleTarget::SP => self.sp,
                    };
                    let value = self.bus.read_byte(hl_value);
                    let (new_value, did_overflow) = self.registers.a.overflowing_sub(value);
                    self.registers.f.carry = did_overflow;
                    self.registers.f.zero = new_value == 0;
                    self.registers.f.subtract = true;
                    self.registers.f.half_carry = (self.registers.a & 0xF) < (value & 0xF);
                    self.registers.a = new_value;
                }
                _ => {
                    panic!("Invalid target for SUB instruction: {:?}", target);
                }
            },
            Instruction::SBC(target, source) => {
                let val = self.get_source_value(source);
                match target {
                    Target::Register(target) => {
                        let carry = if self.registers.f.carry { 1 } else { 0 };
                        let (new_value, did_overflow) = match target {
                            ArithmeticTarget::A => {
                                self.registers.a.overflowing_sub(val as u8 + carry)
                            }
                            _ => {
                                panic!("Invalid target for SBC instruction: {:?}", target);
                            }
                        };
                        self.registers.f.zero = new_value == 0;
                        self.registers.f.subtract = true;
                        self.registers.f.carry = did_overflow;
                        self.registers.f.half_carry =
                            (self.registers.a & 0xF) < (val as u8 & 0xF) + carry;
                        self.registers.a = new_value;
                    }
                    _ => {
                        panic!("Invalid target for SBC instruction: {:?}", target);
                    }
                }
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::AND(target, source) => {
                let value = self.get_source_value(source);
                match target {
                    Target::Register(arithmetic_target) => {
                        let val = self.get_register_value(arithmetic_target);
                        let new_value = val & value as u8;
                        self.registers.f.zero = new_value == 0;
                        self.registers.f.subtract = false;
                        self.registers.f.half_carry = true;
                        self.registers.f.carry = false;
                        match arithmetic_target {
                            ArithmeticTarget::A => {
                                self.registers.a = new_value;
                            }
                            ArithmeticTarget::B => {
                                self.registers.b = new_value;
                            }
                            ArithmeticTarget::C => {
                                self.registers.c = new_value;
                            }
                            ArithmeticTarget::D => {
                                self.registers.d = new_value;
                            }
                            ArithmeticTarget::E => {
                                self.registers.e = new_value;
                            }
                            ArithmeticTarget::H => {
                                self.registers.h = new_value;
                            }
                            ArithmeticTarget::L => {
                                self.registers.l = new_value;
                            }
                        }
                    }
                    _ => {
                        panic!("Invalid target for AND instruction: {:?}", target);
                    }
                }
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::OR(target, source) => {
                let value = self.get_source_value(source);
                match target {
                    Target::Register(arithmetic_target) => {
                        let val = self.get_register_value(arithmetic_target);
                        let new_value = val | value as u8;
                        self.registers.f.zero = new_value == 0;
                        self.registers.f.subtract = false;
                        self.registers.f.half_carry = false;
                        self.registers.f.carry = false;
                        match arithmetic_target {
                            ArithmeticTarget::A => {
                                self.registers.a = new_value;
                            }
                            ArithmeticTarget::B => {
                                self.registers.b = new_value;
                            }
                            ArithmeticTarget::C => {
                                self.registers.c = new_value;
                            }
                            ArithmeticTarget::D => {
                                self.registers.d = new_value;
                            }
                            ArithmeticTarget::E => {
                                self.registers.e = new_value;
                            }
                            ArithmeticTarget::H => {
                                self.registers.h = new_value;
                            }
                            ArithmeticTarget::L => {
                                self.registers.l = new_value;
                            }
                        }
                    }
                    _ => {
                        panic!("Invalid target for OR instruction: {:?}", target);
                    }
                }
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::XOR(target, source) => {
                let value = self.get_source_value(source);
                match target {
                    Target::Register(arithmetic_target) => {
                        let val = self.get_register_value(arithmetic_target);
                        let new_value = val ^ value as u8;
                        self.registers.f.zero = new_value == 0;
                        self.registers.f.subtract = false;
                        self.registers.f.half_carry = false;
                        self.registers.f.carry = false;
                        match arithmetic_target {
                            ArithmeticTarget::A => {
                                self.registers.a = new_value;
                            }
                            ArithmeticTarget::B => {
                                self.registers.b = new_value;
                            }
                            ArithmeticTarget::C => {
                                self.registers.c = new_value;
                            }
                            ArithmeticTarget::D => {
                                self.registers.d = new_value;
                            }
                            ArithmeticTarget::E => {
                                self.registers.e = new_value;
                            }
                            ArithmeticTarget::H => {
                                self.registers.h = new_value;
                            }
                            ArithmeticTarget::L => {
                                self.registers.l = new_value;
                            }
                        }
                    }
                    _ => {
                        panic!("Invalid target for XOR instruction: {:?}", target);
                    }
                }
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::CP(target) => {
                let value = self.get_source_value(target) as u8;
                let new_value = self.registers.a - value;
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = true;
                self.registers.f.half_carry = (self.registers.a & 0xF) < (value & 0xF);
                self.registers.f.carry = self.registers.a < value;
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::INC(target) => match target {
                Target::Register(arithmetic_target) => {
                    let register = self.get_register_value(arithmetic_target);
                    let (new_value, _did_overflow) = register.overflowing_add(1);
                    self.registers.f.zero = new_value == 0;
                    self.registers.f.subtract = false;
                    self.registers.f.half_carry = (register & 0xF) == 0xF;
                    match arithmetic_target {
                        ArithmeticTarget::A => {
                            self.registers.a = new_value;
                        }
                        ArithmeticTarget::B => {
                            self.registers.b = new_value;
                        }
                        ArithmeticTarget::C => {
                            self.registers.c = new_value;
                        }
                        ArithmeticTarget::D => {
                            self.registers.d = new_value;
                        }
                        ArithmeticTarget::E => {
                            self.registers.e = new_value;
                        }
                        ArithmeticTarget::H => {
                            self.registers.h = new_value;
                        }
                        ArithmeticTarget::L => {
                            self.registers.l = new_value;
                        }
                    }
                    self.pc = self.pc.wrapping_add(1);
                }
                Target::Register16(target) => {
                    let r16_value: u16 = match target {
                        DoubleTarget::BC => self.registers.get_bc(),
                        DoubleTarget::DE => self.registers.get_de(),
                        DoubleTarget::HL => self.registers.get_hl(),
                        DoubleTarget::SP => self.sp,
                    };
                    let (new_value, did_overflow) = r16_value.overflowing_add(1);
                    self.registers.f.subtract = false;
                    self.registers.f.carry = did_overflow;
                    self.registers.f.half_carry = (r16_value & 0xFFF) == 0xFFF;
                    match target {
                        DoubleTarget::BC => {
                            self.registers.set_bc(new_value);
                        }
                        DoubleTarget::DE => {
                            self.registers.set_de(new_value);
                        }
                        DoubleTarget::HL => {
                            self.registers.set_hl(new_value);
                        }
                        DoubleTarget::SP => {
                            self.sp = new_value;
                        }
                    }
                }
                Target::MemoryR16(target) => {
                    let r16_value = match target {
                        DoubleTarget::BC => self.registers.get_bc(),
                        DoubleTarget::DE => self.registers.get_de(),
                        DoubleTarget::HL => self.registers.get_hl(),
                        DoubleTarget::SP => self.sp,
                    };
                    let value = self.bus.read_byte(r16_value);
                    let (result, carry1) = value.overflowing_add(1);
                    self.registers.f.zero = result == 0;
                    self.registers.f.subtract = false;
                    self.registers.f.carry = carry1;
                    self.registers.f.half_carry = (value & 0xF) == 0xF;
                    self.bus.write_byte(r16_value, result);
                }
                _ => {
                    panic!("Invalid target for INC instruction: {:?}", target);
                }
            },
            Instruction::DEC(target) => match target {
                Target::Register(arithmetic_target) => {
                    let register = self.get_register_value(arithmetic_target);
                    let (new_value, _did_overflow) = register.overflowing_sub(1);
                    self.registers.f.zero = new_value == 0;
                    self.registers.f.subtract = true;
                    self.registers.f.half_carry = (register & 0xF) == 0xF;
                    match arithmetic_target {
                        ArithmeticTarget::A => {
                            self.registers.a = new_value;
                        }
                        ArithmeticTarget::B => {
                            self.registers.b = new_value;
                        }
                        ArithmeticTarget::C => {
                            self.registers.c = new_value;
                        }
                        ArithmeticTarget::D => {
                            self.registers.d = new_value;
                        }
                        ArithmeticTarget::E => {
                            self.registers.e = new_value;
                        }
                        ArithmeticTarget::H => {
                            self.registers.h = new_value;
                        }
                        ArithmeticTarget::L => {
                            self.registers.l = new_value;
                        }
                    }
                    self.pc = self.pc.wrapping_add(1);
                }
                Target::Register16(target) => {
                    let r16_value: u16 = match target {
                        DoubleTarget::BC => self.registers.get_bc(),
                        DoubleTarget::DE => self.registers.get_de(),
                        DoubleTarget::HL => self.registers.get_hl(),
                        DoubleTarget::SP => self.sp,
                    };
                    let (new_value, did_overflow) = r16_value.overflowing_sub(1);
                    self.registers.f.subtract = true;
                    self.registers.f.carry = did_overflow;
                    self.registers.f.half_carry = (r16_value & 0xFFF) == 0xFFF;
                    match target {
                        DoubleTarget::BC => {
                            self.registers.set_bc(new_value);
                        }
                        DoubleTarget::DE => {
                            self.registers.set_de(new_value);
                        }
                        DoubleTarget::HL => {
                            self.registers.set_hl(new_value);
                        }
                        DoubleTarget::SP => {
                            self.sp = new_value;
                        }
                    }
                }
                Target::MemoryR16(target) => {
                    let r16_value = match target {
                        DoubleTarget::BC => self.registers.get_bc(),
                        DoubleTarget::DE => self.registers.get_de(),
                        DoubleTarget::HL => self.registers.get_hl(),
                        DoubleTarget::SP => self.sp,
                    };
                    let value = self.bus.read_byte(r16_value);
                    let (result, carry1) = value.overflowing_sub(1);
                    self.registers.f.zero = result == 0;
                    self.registers.f.subtract = true;
                    self.registers.f.carry = carry1;
                    self.registers.f.half_carry = (value & 0xF) == 0xF;
                    self.bus.write_byte(r16_value, result);
                }
                _ => {
                    panic!("Invalid target for INC instruction: {:?}", target);
                }
            },
            Instruction::CCF() => {
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.registers.f.carry = !self.registers.f.carry;
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::SCF() => {
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.registers.f.carry = true;
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::RRA() => {
                let carry_in = if self.registers.f.carry { 0x80 } else { 0x00 };
                let carry_out = self.registers.a & 0x01 == 0x01;
                self.registers.a = (self.registers.a >> 1) | carry_in;
                self.registers.f.carry = carry_out;
                self.registers.f.zero = false;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::RLA() => {
                let carry_in = if self.registers.f.carry { 1 } else { 0 };
                let carry_out = self.registers.a & 0x80 == 0x80;
                self.registers.a = (self.registers.a << 1) | carry_in;
                self.registers.f.carry = carry_out;
                self.registers.f.zero = false;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
            }
            Instruction::RLCA() => {
                let carry_out = self.registers.a & 0x80 == 0x80;
                self.registers.a = self.registers.a.rotate_left(1);
                self.registers.f.carry = carry_out;
                self.registers.f.zero = false;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::RRCA() => {
                self.registers.f.carry = self.registers.a & 0x1 == 0x1;
                self.registers.a = self.registers.a.rotate_right(1);
                self.registers.f.zero = false;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::RRLA() => {
                self.registers.f.carry = self.registers.a & 0x80 == 0x80;
                self.registers.a = self.registers.a.rotate_left(1);
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::CPL() => {
                self.registers.a = !self.registers.a;
                self.registers.f.subtract = true;
                self.registers.f.half_carry = true;
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::BIT(u8, target) => {
                match target {
                    Target::Register(arithmetic_target) => {
                        let value = self.get_register_value(arithmetic_target);
                        self.registers.f.zero = (value & (1 << u8)) == 0;
                    }
                    Target::MemoryR16(double_target) => {
                        let adress = match double_target {
                            DoubleTarget::BC => self.registers.get_bc(),
                            DoubleTarget::DE => self.registers.get_de(),
                            DoubleTarget::HL => self.registers.get_hl(),
                            DoubleTarget::SP => self.sp,
                        };
                        let value = self.bus.read_byte(adress);
                        self.registers.f.zero = (value & (1 << u8)) == 0;
                    }
                    _ => {
                        panic!("Invalid target for BIT instruction: {:?}", target)
                    }
                }
                self.registers.f.subtract = false;
                self.registers.f.half_carry = true;
                self.pc = self.pc.wrapping_add(2);
            }
            Instruction::RESET(target) => {
                let value = self.get_register_value(target);
                self.registers.f.zero = (value & 0x1) == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = true;
            }
            Instruction::SET(offset, target) => {
                match target {
                    ArithmeticTarget::A => {
                        self.registers.a |= 1 << offset;
                    }
                    ArithmeticTarget::B => {
                        self.registers.b |= 1 << offset;
                    }
                    ArithmeticTarget::C => {
                        self.registers.c |= 1 << offset;
                    }
                    ArithmeticTarget::D => {
                        self.registers.d |= 1 << offset;
                    }
                    ArithmeticTarget::E => {
                        self.registers.e |= 1 << offset;
                    }
                    ArithmeticTarget::H => {
                        self.registers.h |= 1 << offset;
                    }
                    ArithmeticTarget::L => {
                        self.registers.l |= 1 << offset;
                    }
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
                self.pc = self.pc.wrapping_add(2);
            }
            Instruction::RR(target) => {
                let value = self.get_register_value(target);
                let carry = self.registers.f.carry;
                self.registers.f.carry = value & 0x1 == 0x1;
                let new_value = (value >> 1) | (if carry { 0x80 } else { 0x00 });
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.pc = self.pc.wrapping_add(2);
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
                self.pc = self.pc.wrapping_add(2);
            }
            Instruction::RLC(target) => {
                let value = self.get_register_value(target);
                self.registers.f.carry = value & 0x80 == 0x80;
                let new_value = value.rotate_left(1);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.pc = self.pc.wrapping_add(2);
            }
            Instruction::SRA(target) => {
                let value = self.get_register_value(target);
                self.registers.f.carry = value & 0x1 == 0x1;
                let new_value = (value >> 1) | (value & 0x80);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.pc = self.pc.wrapping_add(2);
            }
            Instruction::SLA(target) => {
                let value = self.get_register_value(target);
                self.registers.f.carry = value & 0x80 == 0x80;
                let new_value = value << 1;
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.pc = self.pc.wrapping_add(2);
            }
            Instruction::SWAP(target) => {
                let value = self.get_register_value(target);
                let new_value = value.rotate_left(4);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.registers.f.carry = false;
                self.pc = self.pc.wrapping_add(2);
            }
            Instruction::LD(target, source) => {
                let value: u16 = self.get_source_value(source);
                match target {
                    Target::Register(arithmetic_target) => match arithmetic_target {
                        ArithmeticTarget::A => {
                            self.registers.a = value as u8;
                        }
                        ArithmeticTarget::B => {
                            self.registers.b = value as u8;
                        }
                        ArithmeticTarget::C => {
                            self.registers.c = value as u8;
                        }
                        ArithmeticTarget::D => {
                            self.registers.d = value as u8;
                        }
                        ArithmeticTarget::E => {
                            self.registers.e = value as u8;
                        }
                        ArithmeticTarget::H => {
                            self.registers.h = value as u8;
                        }
                        ArithmeticTarget::L => {
                            self.registers.l = value as u8;
                        }
                    },
                    Target::Register16(double_target) => {
                        self.pc = self.pc.wrapping_add(1);
                        match double_target {
                            DoubleTarget::BC => {
                                self.registers.set_bc(value as u16);
                            }
                            DoubleTarget::DE => {
                                self.registers.set_de(value as u16);
                            }
                            DoubleTarget::HL => {
                                self.registers.set_hl(value as u16);
                            }
                            DoubleTarget::SP => {
                                self.sp = value as u16;
                            }
                        }
                    }
                    Target::MemoryR8(arithmetic_target) => match arithmetic_target {
                        ArithmeticTarget::A => {
                            self.bus.memory[self.registers.a as usize] = value as u8;
                        }
                        ArithmeticTarget::B => {
                            self.bus.memory[self.registers.b as usize] = value as u8;
                        }
                        ArithmeticTarget::C => {
                            self.bus.memory[self.registers.c as usize] = value as u8;
                        }
                        ArithmeticTarget::D => {
                            self.bus.memory[self.registers.d as usize] = value as u8;
                        }
                        ArithmeticTarget::E => {
                            self.bus.memory[self.registers.e as usize] = value as u8;
                        }
                        ArithmeticTarget::H => {
                            self.bus.memory[self.registers.h as usize] = value as u8;
                        }
                        ArithmeticTarget::L => {
                            self.bus.memory[self.registers.l as usize] = value as u8;
                        }
                    },
                    Target::MemoryR16(double_target) => match double_target {
                        DoubleTarget::BC => {
                            self.bus.memory[self.registers.get_bc() as usize] = value as u8;
                        }
                        DoubleTarget::DE => {
                            self.bus.memory[self.registers.get_de() as usize] = value as u8;
                        }
                        DoubleTarget::HL => {
                            self.bus.memory[self.registers.get_hl() as usize] = value as u8;
                        }
                        DoubleTarget::SP => {
                            self.bus.memory[self.sp as usize] = value as u8;
                        }
                    },
                    _ => {
                        panic!("Invalid target for LD instruction: {:?}", target);
                    }
                }
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::NOP() => {
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::STOP() => {
                unimplemented!("STOP instruction not implemented yet");
                self.pc = self.pc.wrapping_add(2);
            }
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
            Instruction::DI() => {
                self.registers.ime = false;
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::EI() => {
                self.registers.ime = true;
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::JP(condition, address) => {
                //address = 0 outside tests
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
                    if address != 0 {
                        self.pc = address;
                    } else {
                        self.pc = target_address;
                    }
                } else {
                    return self.pc.wrapping_add(3); // Skip over the instruction (1 byte) and operand (2 bytes)
                }
            }
        }
        print!("{:?}", &instruction);
        self.pc
    }
}

fn main() {
    let mut cpu = CPU::default();

    cpu.step();
}
