#[cfg(test)]
use registers::*;
use instructions::*;

use crate::{instructions, registers};
use crate::CPU;

mod instructions_unit {
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

    #[test]
    fn bit(){ //BIT r8
        let mut cpu = CPU::new();
        cpu.registers.a = 0b00001000;
        cpu.execute(Instruction::BIT(3,ArithmeticTarget::A));
        assert_eq!(cpu.registers.f.zero, false);
    }

    #[test]
    fn ccf(){ //CCF
        let mut cpu = CPU::new();
        cpu.registers.f.carry = true;
        cpu.execute(Instruction::CCF());
        assert_eq!(cpu.registers.f.carry, false);
    }

    #[test]
    fn cp(){ //CP r8
        let mut cpu = CPU::new();
        cpu.registers.a = 0x12;
        cpu.registers.b = 0x12;
        cpu.execute(Instruction::CP(ArithmeticTarget::B));
        assert_eq!(cpu.registers.f.zero, true);
    }

    #[test]
    fn cpl(){ //CPL
        let mut cpu = CPU::new();
        cpu.registers.a = 0b10101010;
        cpu.execute(Instruction::CPL());
        assert_eq!(cpu.registers.a, 0b01010101);
        assert_eq!(cpu.registers.f.subtract, true);
        assert_eq!(cpu.registers.f.half_carry, true);
    }

    #[test]
    fn daa() {
        let mut cpu = CPU::new();
        cpu.registers.a = 0x3c; // 0x3c = 60 DEC
        cpu.registers.f.half_carry = true;
        cpu.registers.f.carry = false;
        cpu.execute(Instruction::DAA());
        assert_eq!(cpu.registers.a, 0x42); // Sprawdź, czy A = 42 DEC
        assert_eq!(cpu.registers.f.zero, false);
        assert_eq!(cpu.registers.f.half_carry, false);
        assert_eq!(cpu.registers.f.carry, false);
    }

    #[test]
    fn dec() {
        let mut cpu = CPU::new();
        cpu.registers.a = 0x01;
        cpu.execute(Instruction::DEC(ArithmeticTarget::A));
        assert_eq!(cpu.registers.a, 0x00);
        assert_eq!(cpu.registers.f.zero, true);
        assert_eq!(cpu.registers.f.subtract, true);
    }

    #[test]
    fn inc() {
        let mut cpu = CPU::new();
        cpu.registers.a = 0x01;
        cpu.execute(Instruction::INC(ArithmeticTarget::A));
        assert_eq!(cpu.registers.a, 0x02);
        assert_eq!(cpu.registers.f.zero, false);
        assert_eq!(cpu.registers.f.subtract, false);
    }

    #[test]
    fn ei() {
        let mut cpu = CPU::new();
        cpu.registers.ime = false;
        cpu.execute(Instruction::EI());
        assert_eq!(cpu.registers.ime, true);
    }

    #[test]
    fn di() {
        let mut cpu = CPU::new();
        cpu.registers.ime = true;
        cpu.execute(Instruction::DI());
        assert_eq!(cpu.registers.ime, false);
    }

    #[test]
    fn ld() { // LD r8, r8
        let mut cpu = CPU::new();
        cpu.registers.a = 0x01;
        cpu.execute(Instruction::LD(Target::Register(ArithmeticTarget::B), Target::Register(ArithmeticTarget::A)));
        assert_eq!(cpu.registers.b, 0x01);
    }
}