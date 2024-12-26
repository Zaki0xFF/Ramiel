use registers::*;
use instructions::*;

use crate::{instructions, registers};

#[cfg(test)]
mod instructions_unit {
    use crate::CPU;

    use super::*;
    #[test]
    fn add() {//ADD A, r8
        let mut cpu = CPU::new();
        cpu.registers.a = 1;
        cpu.registers.b = 2;
        cpu.execute(Instruction::ADD(ArithmeticTarget::B));
        assert_eq!(cpu.registers.a, 3);
    }

    #[test]
    fn addhl() {//ADD HL, r16
        let mut cpu = CPU::new();
        cpu.registers.h = 0x12;
        cpu.registers.l = 0x34;
        cpu.registers.b = 0x56;
        cpu.registers.c = 0x78;
        cpu.execute(Instruction::ADDHL(DoubleTarget::BC));
        assert_eq!(cpu.registers.h, 0x68);
        assert_eq!(cpu.registers.l, 0xAC);
    }

    #[test]
    fn adc() {//ADC r8
        let mut cpu = CPU::new();
        cpu.registers.a = 3;
        cpu.registers.b = 255;
        cpu.execute(Instruction::ADC(ArithmeticTarget::B));
        assert_eq!(cpu.registers.a, 3);
        assert_eq!(cpu.registers.f.carry, true);
    }

    #[test]
    fn and() {//AND r8
        let mut cpu = CPU::new();
        cpu.registers.a = 0b10101010;
        cpu.registers.b = 0b11001100;
        cpu.execute(Instruction::AND(ArithmeticTarget::B));
        assert_eq!(cpu.registers.a, 0b10001000);
    }
}