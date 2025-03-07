use crate::instructions::*;
use crate::registers::*;
use std::fs::File;
use std::io::Read;
use std::path::Path;

pub struct CPU {
    pub registers: Registers,
    pub pc: u16,
    pub sp: u16,
    pub bus: MemoryBus,
    is_halted: bool,
}

#[allow(dead_code)]
pub struct MemoryBus {
    memory: [u8; 0xFFFF + 1],
}

impl MemoryBus {
    pub fn read_byte(&self, address: u16) -> u8 {
        self.memory[address as usize]
    }

    pub fn write_byte(&mut self, address: u16, value: u8) {
        self.memory[address as usize] = value;
    }

    pub fn load_rom(&mut self, path: &Path) -> std::io::Result<()> {
        let mut file = File::open(path)?;
        let mut buffer = Vec::new();
        file.read_to_end(&mut buffer)?;

        let length = buffer.len().min(self.memory.len());
        self.memory[..length].copy_from_slice(&buffer[..length]);

        Ok(())
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
                memory: { [0u8; 0xFFFF + 1] },
            },
            is_halted: false,
        }
    }
}

impl CPU {
    pub fn new_with_rom(path: &Path) -> std::io::Result<Self> {
        let mut cpu = CPU::default();
        cpu.bus.load_rom(path).unwrap();
        Ok(cpu)
    }

    fn set_register_value(&mut self, value: u16, target: Target) {
        match target {
            Target::Register(arithmetic_target) => match arithmetic_target {
                ArithmeticTarget::A => self.registers.a = value as u8,
                ArithmeticTarget::B => self.registers.b = value as u8,
                ArithmeticTarget::C => self.registers.c = value as u8,
                ArithmeticTarget::D => self.registers.d = value as u8,
                ArithmeticTarget::E => self.registers.e = value as u8,
                ArithmeticTarget::H => self.registers.h = value as u8,
                ArithmeticTarget::L => self.registers.l = value as u8,
            },
            Target::Register16(double_target) => match double_target {
                DoubleTarget::BC => self.registers.set_bc(value),
                DoubleTarget::DE => self.registers.set_de(value),
                DoubleTarget::HL => self.registers.set_hl(value),
                DoubleTarget::SP => self.sp = value,
            },
            Target::MemoryR8(arithmetic_target) => match arithmetic_target {
                ArithmeticTarget::A => self.bus.write_byte(self.registers.a as u16, value as u8),
                ArithmeticTarget::B => self.bus.write_byte(self.registers.b as u16, value as u8),
                ArithmeticTarget::C => self.bus.write_byte(self.registers.c as u16, value as u8),
                ArithmeticTarget::D => self.bus.write_byte(self.registers.d as u16, value as u8),
                ArithmeticTarget::E => self.bus.write_byte(self.registers.e as u16, value as u8),
                ArithmeticTarget::H => self.bus.write_byte(self.registers.h as u16, value as u8),
                ArithmeticTarget::L => self.bus.write_byte(self.registers.l as u16, value as u8),
            },
            Target::MemoryR16(double_target) => match double_target {
                DoubleTarget::BC => self.bus.write_byte(self.registers.get_bc(), value as u8),
                DoubleTarget::DE => self.bus.write_byte(self.registers.get_de(), value as u8),
                DoubleTarget::HL => self.bus.write_byte(self.registers.get_hl(), value as u8),
                DoubleTarget::SP => self.bus.write_byte(self.sp, value as u8),
            },
            Target::MemoryConst16() => {
                let address = self.bus.read_byte(self.pc.wrapping_add(1));
                self.bus.write_byte(address as u16, value as u8);
                self.pc = self.pc.wrapping_add(1);
            }
            _ => {
                panic!("Invalid target for set_register_value: {:?}", target)
            }
        }
    }

    fn get_register_value(&mut self, source: Target) -> u16 {
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
                let result = self.bus.read_byte(self.pc.wrapping_add(1)) as u16;
                self.pc = self.pc.wrapping_add(1);
                result
            }
            Target::Const16() => {
                let low_byte = self.bus.read_byte(self.pc.wrapping_add(1)) as u16;
                let high_byte = self.bus.read_byte(self.pc.wrapping_add(2)) as u16;
                self.pc = self.pc.wrapping_add(2);
                (high_byte << 8) | low_byte
            }
            Target::MemoryConst16() => {
                let address = self.bus.read_byte(self.pc.wrapping_add(1));
                self.bus.read_byte(address as u16) as u16
            }
        };
        value
    }

    fn get_jcondition_value(&self, flag: JumpCondition) -> bool {
        match flag {
            JumpCondition::Always => true,
            JumpCondition::Zero => self.registers.f.zero,
            JumpCondition::NotZero => !self.registers.f.zero,
            JumpCondition::Carry => self.registers.f.carry,
            JumpCondition::NotCarry => !self.registers.f.carry,
        }
    }

    fn push(&mut self, value: u16) {
        if self.sp < 2 {
            panic!("Stack overflow");
        }
        self.sp = self.sp.wrapping_sub(2);
        self.bus.write_byte(self.sp, (value >> 8) as u8);
        self.bus.write_byte(self.sp.wrapping_add(1), value as u8);
        println!("Pushed value: {:04X} to SP: {:04X}", value, self.sp);
    }

    fn pop(&mut self) -> u16 {
        if self.sp > 0xFFFD {
            panic!("Stack underflow");
        }
        let value = (self.bus.read_byte(self.sp) as u16) << 8
            | self.bus.read_byte(self.sp.wrapping_add(1)) as u16;
        println!("Popped value: {:04X} from SP: {:04X}", value, self.sp);
        value
    }

    fn _jump(&mut self, address: u16) {
        self.pc = address;
    }

    pub fn step(&mut self) {
        if self.is_halted == true {
            return;
        }
        let mut instruction_byte = self.bus.read_byte(self.pc);
        println!("Instruction byte {:02x}", instruction_byte);
        let prefixed = instruction_byte == 0xCB;
        if prefixed {
            instruction_byte = self.bus.read_byte(self.pc.wrapping_add(1));
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

    pub fn execute(&mut self, instruction: Instruction) -> u16 {
        let pc = self.pc;
        match instruction {
            Instruction::ADD(target, source) => {
                let value: u16 = self.get_register_value(source);
                match target {
                    Target::Register(_) => {
                        let value = value as u8;
                        let temp = self.get_register_value(target) as u8;
                        let (new_value, did_overflow) = temp.overflowing_add(value);
                        self.registers.f.zero = new_value == 0;
                        self.registers.f.subtract = false;
                        self.registers.f.carry = did_overflow;
                        self.registers.f.half_carry =
                            ((self.registers.a & 0xF) + (value & 0xF)) & 0x10 == 0x10;
                        self.set_register_value(new_value as u16, target);
                    }
                    Target::Register16(_) => {
                        let val = self.get_register_value(target);
                        let (new_value, did_overflow) = val.overflowing_add(value);
                        self.registers.f.subtract = false;
                        self.registers.f.carry = did_overflow;
                        self.registers.f.half_carry =
                            ((val & 0xFFF) + (value & 0xFFF)) & 0x1000 == 0x1000;
                        self.set_register_value(new_value, target);
                    }
                    _ => {
                        panic!("Invalid source for ADD instruction: {:?}", source);
                    }
                }
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::ADC(target) => {
                let value = self.get_register_value(target);
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
                    Target::Register(_) => {
                        let carry = if self.registers.f.carry { 1 } else { 0 };
                        let (new_value, did_overflow) =
                            self.registers.a.overflowing_add(value as u8 + carry);
                        self.registers.f.zero = new_value == 0;
                        self.registers.f.subtract = false;
                        self.registers.f.carry = did_overflow;
                        self.registers.f.half_carry =
                            (self.registers.a & 0xF) + (value as u8 & 0xF) + carry > 0xF;
                        self.registers.a = new_value.wrapping_add(if did_overflow { 1 } else { 0 });
                    }
                    Target::MemoryR16(_) => {
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
            Instruction::SUB(target) => {
                let value = self.get_register_value(target);
                let (new_value, did_overflow) = self.registers.a.overflowing_sub(value as u8);
                self.registers.f.zero = new_value == 0;
                self.registers.f.carry = did_overflow;
                self.registers.f.subtract = true;
                self.registers.f.half_carry = (self.registers.a & 0xF) < (value as u8 & 0xF);
                self.registers.a = new_value;
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::SBC(target, source) => {
                let val = self.get_register_value(source);
                let temp = self.get_register_value(target) as u8;
                let carry = if self.registers.f.carry { 1 } else { 0 };
                let (new_value, did_overflow) = temp.overflowing_sub(val as u8 + carry);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = true;
                self.registers.f.carry = did_overflow;
                self.registers.f.half_carry = (self.registers.a & 0xF) < (val as u8 & 0xF) + carry;
                self.registers.a = new_value;
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::AND(target, source) => {
                let value = self.get_register_value(source) as u8;
                let val = self.get_register_value(target) as u8;
                let new_value = val & value;
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = true;
                self.registers.f.carry = false;
                self.set_register_value(new_value as u16, target);
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::OR(target, source) => {
                let value = self.get_register_value(source) as u8;
                let val = self.get_register_value(target) as u8;
                let new_value = val | value;
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.registers.f.carry = false;
                self.set_register_value(new_value as u16, target);
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::XOR(target, source) => {
                let value = self.get_register_value(source) as u8;
                let val = self.get_register_value(target) as u8;
                let new_value = val ^ value;
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.registers.f.carry = false;
                self.set_register_value(new_value as u16, target);
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::CP(target) => {
                let value = self.get_register_value(target) as u8;
                let (new_value, did_overflow) = self.registers.a.overflowing_sub(value);
                println!("{:}", new_value == 0x0000);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = true;
                self.registers.f.half_carry = (self.registers.a & 0xF) < (value & 0xF);
                self.registers.f.carry = did_overflow;
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::INC(target) => {
                let value = self.get_register_value(target);
                let (new_value, _did_overflow) = value.overflowing_add(1);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = (value & 0xF) == 0xF;
                self.set_register_value(new_value as u16, target);
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::DEC(target) => {
                let value = self.get_register_value(target);
                let (new_value, _did_overflow) = value.overflowing_sub(1);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = true;
                self.registers.f.half_carry = (value & 0xF) == 0xF;
                self.set_register_value(new_value as u16, target);
                self.pc = self.pc.wrapping_add(1);
            }
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
                self.pc = self.pc.wrapping_add(1);
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
            Instruction::BIT(bit, target) => {
                let value = self.get_register_value(target) as u8;
                self.registers.f.zero = (value & (1 << bit)) == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = true;
                self.pc = self.pc.wrapping_add(2);
            }
            Instruction::SET(offset, target) => {
                let value: u16 = self.get_register_value(target) | (1 << offset);
                self.set_register_value(value as u16, target);
                self.registers.f.zero = false;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.pc = self.pc.wrapping_add(2);
            }
            Instruction::SRL(target) => {
                let value = self.get_register_value(target);
                self.registers.f.carry = value & 0x1 == 0x1;
                let new_value = value >> 1;
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.set_register_value(new_value, target);
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
                self.set_register_value(new_value as u16, target);
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
                self.set_register_value(new_value as u16, target);
                self.pc = self.pc.wrapping_add(2);
            }
            Instruction::RRC(target) => {
                let value = self.get_register_value(target) as u8;
                self.registers.f.carry = value & 0x1 == 0x1;
                let new_value = value.rotate_right(1);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.set_register_value(new_value as u16, target);
                self.pc = self.pc.wrapping_add(2);
            }
            Instruction::RLC(target) => {
                let value = self.get_register_value(target) as u8;
                self.registers.f.carry = value & 0x80 == 0x80;
                let new_value = value.rotate_left(1);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.set_register_value(new_value as u16, target);
                self.pc = self.pc.wrapping_add(2);
            }
            Instruction::SRA(target) => {
                let value = self.get_register_value(target) as u8;
                self.registers.f.carry = value & 0x1 == 0x1;
                let new_value = (value >> 1) | (value & 0x80);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.set_register_value(new_value as u16, target);
                self.pc = self.pc.wrapping_add(2);
            }
            Instruction::SLA(target) => {
                let value = self.get_register_value(target) as u8;
                self.registers.f.carry = value & 0x80 == 0x80;
                let new_value = value << 1;
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.set_register_value(new_value as u16, target);
                self.pc = self.pc.wrapping_add(2);
            }
            Instruction::SWAP(target) => {
                let value = self.get_register_value(target) as u8;
                let new_value = ((value & 0x0F) << 4) | ((value & 0xF0) >> 4);
                println!("Original value: {:08b}", value);
                println!("Swapped value: {:08b}", new_value);
                self.registers.f.zero = new_value == 0;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = false;
                self.registers.f.carry = false;
                self.set_register_value(new_value as u16, target);
                self.pc = self.pc.wrapping_add(2);
            }
            Instruction::LD(target, source) => {
                let value: u16 = self.get_register_value(source);
                self.set_register_value(value, target);
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::NOP() => {
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::STOP() => {
                self.pc = self.pc.wrapping_add(2);
                unimplemented!("STOP instruction not implemented yet");
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
                self.pc = self.pc.wrapping_add(1);
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

                let jump = self.get_jcondition_value(condition);

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
            Instruction::JPHL(target) => {
                let target_address = self.get_register_value(target);
                self.pc = target_address;
            }
            Instruction::JR(condition) => {
                let jump = self.get_jcondition_value(condition);
                if jump {
                    let offset = self.bus.read_byte(self.pc.wrapping_add(1)) as i8;
                    self.pc = self.pc.wrapping_add(2).wrapping_add(offset as u16);
                } else {
                    self.pc = self.pc.wrapping_add(2);
                }
            }
            Instruction::PUSH(target) => {
                let value = self.get_register_value(target);
                self.sp = self.sp.wrapping_sub(2);
                self.bus.write_byte(self.sp, (value >> 8) as u8);
                self.bus.write_byte(self.sp.wrapping_add(1), value as u8);
                self.pc = self.pc.wrapping_add(1);
                println!("Pushed value: {:04X} to SP: {:04X}", value, self.sp);
            }
            Instruction::POP(target) => {
                let value = (self.bus.read_byte(self.sp) as u16) << 8
                    | self.bus.read_byte(self.sp.wrapping_add(1)) as u16;
                self.set_register_value(value, target);
                self.sp = self.sp.wrapping_add(2);
                self.pc = self.pc.wrapping_add(1);
                println!("Popped value: {:04X} from SP: {:04X}", value, self.sp);
            }
            Instruction::CALL(condition, address) => {
                let jump = self.get_jcondition_value(condition);
                let target_address = self.bus.read_byte(self.pc.wrapping_add(1)) as u16
                    | ((self.bus.read_byte(self.pc.wrapping_add(2)) as u16) << 8);
                if jump {
                    self.push(self.pc.wrapping_add(3));
                    self.pc = if address != 0 {
                        address
                    } else {
                        target_address
                    };
                } else {
                    return self.pc.wrapping_add(3);
                }
            }
            Instruction::RET(condition) => {
                let jump = self.get_jcondition_value(condition);
                if jump {
                    self.pc = self.pop();
                } else {
                    return self.pc.wrapping_add(1);
                }
            }
            Instruction::RETI(condition) => {
                let jump = self.get_jcondition_value(condition);
                if jump {
                    self.pc = self.pop();
                } else {
                    return self.pc.wrapping_add(1);
                }
                self.registers.ime = true;
            }
            Instruction::HALT() => {
                self.is_halted = true;
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::LDI(target, source) => {
                let value = self.get_register_value(source);
                self.set_register_value(value, target);
                self.registers
                    .set_hl(self.registers.get_hl().wrapping_add(1));
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::LDD(target, source) => {
                let value = self.get_register_value(source);
                println!("Value to load: {:#X}", value);
                println!("HL before decrement: {:#X}", self.registers.get_hl());
                self.set_register_value(value, target);
                self.registers
                    .set_hl(self.registers.get_hl().wrapping_sub(1));
                println!("HL after decrement: {:#X}", self.registers.get_hl());
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::LDH(target, source) => {
                let value: u8 = match source {
                    LDHRegister::C => self.bus.read_byte(0xFF00 + self.registers.c as u16),
                    LDHRegister::MemoryConst16(_) => {
                        self.pc = self.pc.wrapping_add(1);
                        self.get_register_value(Target::MemoryConst16()) as u8
                    }
                    LDHRegister::ArithmeticTarget => {
                        self.get_register_value(Target::Register(ArithmeticTarget::A)) as u8
                    }
                    LDHRegister::MemA8 => {
                        let address = self.bus.read_byte(self.pc.wrapping_add(1)) as u16;
                        self.pc = self.pc.wrapping_add(1);
                        self.bus.read_byte(0xFF00 + address)
                    }
                };
                match target {
                    LDHRegister::ArithmeticTarget => {
                        self.registers.a = value;
                    }
                    LDHRegister::C => {
                        self.bus.write_byte(0xFF00 + self.registers.c as u16, value);
                    }
                    LDHRegister::MemoryConst16(addr) => {
                        self.pc = self.pc.wrapping_add(1);
                        self.bus.write_byte(addr as u16, value);
                    }
                    LDHRegister::MemA8 => {
                        let address = self.bus.read_byte(self.pc.wrapping_add(1)) as u16;
                        self.pc = self.pc.wrapping_add(1);
                        self.bus.write_byte(0xFF00 + address, value);
                    }
                }
                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::LDHLSP() => {
                // LD HL,SP+e8
                let sp = self.sp;
                let offset = self.bus.read_byte(self.pc.wrapping_add(1) as u16) as i8;
                let result = self.sp.wrapping_add(offset as u16);
                self.registers.set_hl(result);
                self.registers.f.zero = false;
                self.registers.f.subtract = false;
                self.registers.f.half_carry = (sp & 0xF) + ((offset as u16) & 0xF) > 0xF;
                self.registers.f.carry = (sp & 0xFF) + ((offset as u16) & 0xFF) > 0xFF;
                self.pc = self.pc.wrapping_add(2);
            }
            Instruction::PUSHAF() => {
                self.sp = self.sp.wrapping_sub(1);
                self.bus.write_byte(self.sp, self.registers.a);

                self.sp = self.sp.wrapping_sub(1);
                let f_value = (self.registers.f.zero as u8) << 7
                    | (self.registers.f.subtract as u8) << 6
                    | (self.registers.f.half_carry as u8) << 5
                    | (self.registers.f.carry as u8) << 4;
                self.bus.write_byte(self.sp, f_value);

                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::POPAF() => {
                self.registers.f.carry = self.bus.read_byte(self.sp) & 0x10 == 0x10;
                self.registers.f.half_carry = self.bus.read_byte(self.sp) & 0x20 == 0x20;
                self.registers.f.subtract = self.bus.read_byte(self.sp) & 0x40 == 0x40;
                self.registers.f.zero = self.bus.read_byte(self.sp) & 0x80 == 0x80;
                self.sp = self.sp.wrapping_add(1);

                self.registers.a = self.bus.read_byte(self.sp);
                self.sp = self.sp.wrapping_add(1);

                self.pc = self.pc.wrapping_add(1);
            }
            Instruction::RES(bit, target) => {
                let value = self.get_register_value(target);
                let new_value = value & !(1 << bit);
                self.set_register_value(new_value, target);
                self.pc = self.pc.wrapping_add(2);
            }
        }
        print!(
            "Registers A: {:02x} | B: {:#02x} | C: {:02x} | D: {:02x} | E: {:02x} | H: {:02x} | L: {:02x} | SP: {:02x} PC: {:02x}\n",
            self.registers.a, self.registers.b, self.registers.c, self.registers.d, self.registers.e, self.registers.h, self.registers.l, self.sp , pc
        );
        print!(
            "FlagsZero: {:?} | Subtract: {:?} | Half Carry: {:?} | Carry: {:?}\n",
            self.registers.f.zero,
            self.registers.f.subtract,
            self.registers.f.half_carry,
            self.registers.f.carry
        );
        print!("Instruction: {:?}\n", &instruction);
        self.pc
    }
}
