use super::registers::*;
#[derive(Clone, Copy, Debug)]
pub enum Instruction {
    //u8 instructions
    ADC(Target),
    ADD(Target, Target),
    AND(Target, Target),
    CP(Target),
    SUB(Target),
    SBC(Target, Target),
    OR(Target, Target),
    XOR(Target, Target),
    INC(Target),
    DEC(Target),
    BIT(u8, Target),
    SET(u8, Target),
    SRL(Target),
    RR(Target),
    RL(Target),
    RRC(Target),
    RLC(Target),
    SRA(Target),
    SLA(Target),
    SWAP(Target),
    LD(Target, Target),

    //No target instructions
    CCF(),
    CPL(),
    DAA(),
    NOP(),
    STOP(),
    SCF(),
    RRA(),
    RLA(),
    RLCA(),
    RRCA(),
    RRLA(),
    DI(),
    EI(),

    //jump instructions
    JPHL(Target),
    JP(JumpCondition, u16),
    JR(JumpCondition, u16),

    //stack instructions
    PUSH(Target),
    POP(Target),

    CALL(JumpCondition, u16),
    RET(JumpCondition),
    HALT(),
}

impl Instruction {
    pub fn from_prefixed_byte(byte: u8) -> Option<Instruction> {
        panic!("Prefix instruction not implemented yet: {:#X}", byte)
    }
    pub fn from_byte(byte: u8, prefixed: bool) -> Option<Instruction> {
        if prefixed {
            return Instruction::from_prefixed_byte(byte);
        }
        match byte {
            0x00 => Some(Instruction::NOP()),
            0x01 => Some(Instruction::LD(
                Target::Register16(DoubleTarget::BC),
                Target::Const16(),
            )),
            0x02 => Some(Instruction::LD(
                Target::Register16(DoubleTarget::BC),
                Target::Register(ArithmeticTarget::A),
            )),
            0x03 => Some(Instruction::INC(Target::Register16(DoubleTarget::BC))),
            0x04 => Some(Instruction::INC(Target::Register(ArithmeticTarget::B))),
            0x05 => Some(Instruction::DEC(Target::Register(ArithmeticTarget::B))),
            0x06 => Some(Instruction::LD(
                Target::Register(ArithmeticTarget::B),
                Target::Const8(),
            )),
            0x07 => Some(Instruction::RLC(Target::Register(ArithmeticTarget::A))),
            0x08 => {
                unimplemented!("Instruction not implemented yet: {:#X}", byte)
            }
            0x09 => Some(Instruction::ADD(
                Target::Register16(DoubleTarget::HL),
                Target::Register16(DoubleTarget::BC),
            )),
            0x0A => {
                unimplemented!("Instruction not implemented yet: {:#X}", byte)
            }
            0x0B => Some(Instruction::DEC(Target::Register16(DoubleTarget::BC))),
            0x0C => Some(Instruction::INC(Target::Register(ArithmeticTarget::C))),
            0x0D => Some(Instruction::DEC(Target::Register(ArithmeticTarget::C))),
            0x0E => {
                unimplemented!("Instruction not implemented yet: {:#X}", byte)
            }
            0x0F => Some(Instruction::RRC(Target::Register(ArithmeticTarget::A))),

            0x10 => Some(Instruction::STOP()),
            0x11 => {
                unimplemented!("Instruction not implemented yet: {:#X}", byte)
            }
            0x12 => {
                unimplemented!("Instruction not implemented yet: {:#X}", byte)
            }
            0x13 => Some(Instruction::INC(Target::Register16(DoubleTarget::DE))),
            0x14 => Some(Instruction::INC(Target::Register(ArithmeticTarget::D))),
            0x15 => Some(Instruction::DEC(Target::Register(ArithmeticTarget::D))),
            0x16 => {
                unimplemented!("Instruction not implemented yet: {:#X}", byte)
            }
            0x17 => Some(Instruction::RL(Target::Register(ArithmeticTarget::A))),
            0x18 => {
                unimplemented!("Instruction not implemented yet: {:#X}", byte)
            }
            0x19 => Some(Instruction::ADD(
                Target::Register16(DoubleTarget::HL),
                Target::Register16(DoubleTarget::DE),
            )),
            0x1A => {
                unimplemented!("Instruction not implemented yet: {:#X}", byte)
            }
            0x1B => Some(Instruction::DEC(Target::Register16(DoubleTarget::DE))),
            0x1C => Some(Instruction::INC(Target::Register(ArithmeticTarget::E))),
            0x1D => Some(Instruction::DEC(Target::Register(ArithmeticTarget::E))),
            0x1E => {
                unimplemented!("Instruction not implemented yet: {:#X}", byte)
            }
            0x1F => Some(Instruction::RR(Target::Register(ArithmeticTarget::A))),

            0x20 => {
                unimplemented!("Instruction not implemented yet: {:#X}", byte)
            }
            0x21 => {
                unimplemented!("Instruction not implemented yet: {:#X}", byte)
            }
            0x22 => {
                unimplemented!("Instruction not implemented yet: {:#X}", byte)
            }
            0x23 => Some(Instruction::INC(Target::Register16(DoubleTarget::HL))),
            0x24 => Some(Instruction::INC(Target::Register(ArithmeticTarget::H))),
            0x25 => Some(Instruction::DEC(Target::Register(ArithmeticTarget::H))),
            0x26 => {
                unimplemented!("Instruction not implemented yet: {:#X}", byte)
            }
            0x27 => Some(Instruction::DAA()),
            0x28 => {
                unimplemented!("Instruction not implemented yet: {:#X}", byte)
            }
            0x29 => Some(Instruction::ADD(
                Target::Register16(DoubleTarget::HL),
                Target::Register16(DoubleTarget::HL),
            )),
            0x2A => {
                unimplemented!("Instruction not implemented yet: {:#X}", byte)
            }
            0x2B => Some(Instruction::DEC(Target::Register16(DoubleTarget::HL))),
            0x2C => Some(Instruction::INC(Target::Register(ArithmeticTarget::L))),
            0x2D => Some(Instruction::DEC(Target::Register(ArithmeticTarget::L))),
            0x2E => {
                unimplemented!("Instruction not implemented yet: {:#X}", byte)
            }
            0x2F => Some(Instruction::CPL()),
            _ => panic!("Instruction not implemented yet: {:#X}", byte),
        }
    }
}
