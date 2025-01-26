use super::registers::*;
#[derive(Clone, Copy, Debug)]
pub enum Instruction {
    //u8 instructions
    ADC(Target),
    ADD(ArithmeticTarget),
    AND(ArithmeticTarget),
    CP(ArithmeticTarget),
    SUB(ArithmeticTarget),
    SBC(ArithmeticTarget),
    OR(ArithmeticTarget),
    XOR(ArithmeticTarget),
    INC(ArithmeticTarget),
    DEC(ArithmeticTarget),
    BIT(u8,ArithmeticTarget),
    RESET(ArithmeticTarget),
    SET(u8, ArithmeticTarget),
    SRL(ArithmeticTarget),
    RR(ArithmeticTarget),
    RL(ArithmeticTarget),
    RRC(ArithmeticTarget),
    RLC(ArithmeticTarget),
    SRA(ArithmeticTarget),
    SLA(ArithmeticTarget),
    SWAP(ArithmeticTarget),
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
    RRCA(),
    RRLA(),
    DI(),
    EI(),

    //u16 instructions

    ADDHL(DoubleTarget),
    INCDBL(DoubleTarget),
    DECDBL(DoubleTarget),
    LDDBL(DoubleTarget),
    LDDBLA(DoubleTarget, ArithmeticTarget),
    ANDHL(),

    //jump instructions
    JP(JumpCondition, u16),
}

impl Instruction{
    pub fn from_prefixed_byte(byte: u8) -> Option<Instruction> {
        panic!("Prefix instruction not implemented yet: {:#X}", byte)
    }
    pub fn from_byte(byte: u8) -> Option<Instruction> {
        match byte {
            0x00 => { Some(Instruction::NOP()) },
            0x01 => { Some(Instruction::LDDBL(DoubleTarget::BC)) },
            0x02 => { Some(Instruction::LDDBLA(DoubleTarget::BC, ArithmeticTarget::A)) },
            0x03 => { Some(Instruction::INCDBL(DoubleTarget::BC)) },
            0x04 => { Some(Instruction::INC(ArithmeticTarget::B)) },
            0x05 => { Some(Instruction::DEC(ArithmeticTarget::B)) },
            0x06 => { Some(Instruction::LD(Target::Register(ArithmeticTarget::B), Target::Const8())) },
            0x07 => { Some(Instruction::RLC(ArithmeticTarget::A)) },
            0x08 => { unimplemented!("Instruction not implemented yet: {:#X}", byte) },
            0x09 => { Some(Instruction::ADDHL(DoubleTarget::BC)) },
            0x0A => { unimplemented!("Instruction not implemented yet: {:#X}", byte) },
            0x0B => { Some(Instruction::DECDBL(DoubleTarget::BC)) },
            0x0C => { Some(Instruction::INC(ArithmeticTarget::C)) },
            0x0D => { Some(Instruction::DEC(ArithmeticTarget::C)) },
            0x0E => { unimplemented!("Instruction not implemented yet: {:#X}", byte) },
            0x0F => { Some(Instruction::RRC(ArithmeticTarget::A)) },

            0x10 => { Some(Instruction::STOP()) },
            0x11 => { unimplemented!("Instruction not implemented yet: {:#X}", byte) },
            0x12 => { unimplemented!("Instruction not implemented yet: {:#X}", byte) },
            0x13 => { Some(Instruction::INCDBL(DoubleTarget::DE)) },
            0x14 => { Some(Instruction::INC(ArithmeticTarget::D)) },
            0x15 => { Some(Instruction::DEC(ArithmeticTarget::D)) },
            0x16 => { unimplemented!("Instruction not implemented yet: {:#X}", byte) },
            0x17 => { Some(Instruction::RL(ArithmeticTarget::A)) },
            0x18 => { unimplemented!("Instruction not implemented yet: {:#X}", byte) },
            0x19 => { Some(Instruction::ADDHL(DoubleTarget::DE)) },
            0x1A => { unimplemented!("Instruction not implemented yet: {:#X}", byte) },
            0x1B => { Some(Instruction::DECDBL(DoubleTarget::DE)) },
            0x1C => { Some(Instruction::INC(ArithmeticTarget::E)) },
            0x1D => { Some(Instruction::DEC(ArithmeticTarget::E)) },
            0x1E => { unimplemented!("Instruction not implemented yet: {:#X}", byte) },
            0x1F => { Some(Instruction::RR(ArithmeticTarget::A)) },

            0x20 => { unimplemented!("Instruction not implemented yet: {:#X}", byte) },
            0x21 => { unimplemented!("Instruction not implemented yet: {:#X}", byte) },
            0x22 => { unimplemented!("Instruction not implemented yet: {:#X}", byte) },
            0x23 => { Some(Instruction::INCDBL(DoubleTarget::HL)) },
            0x24 => { Some(Instruction::INC(ArithmeticTarget::H)) },
            0x25 => { Some(Instruction::DEC(ArithmeticTarget::H)) },
            0x26 => { unimplemented!("Instruction not implemented yet: {:#X}", byte) },
            0x27 => { Some(Instruction::DAA()) },
            0x28 => { unimplemented!("Instruction not implemented yet: {:#X}", byte) },
            0x29 => { Some(Instruction::ADDHL(DoubleTarget::HL)) },
            0x2A => { unimplemented!("Instruction not implemented yet: {:#X}", byte) },
            0x2B => { Some(Instruction::DECDBL(DoubleTarget::HL)) },
            0x2C => { Some(Instruction::INC(ArithmeticTarget::L)) },
            0x2D => { Some(Instruction::DEC(ArithmeticTarget::L)) },
            0x2E => { unimplemented!("Instruction not implemented yet: {:#X}", byte) },
            0x2F => { Some(Instruction::CPL()) },
            _ => panic!("Instruction not implemented yet: {:#X}", byte),
        }
     }
}