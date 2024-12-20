use registers::*;
use instructions::*;

use crate::{instructions, registers};

#[cfg(test)]
mod instructions_unit {
    use std::env::consts::ARCH;

    use crate::CPU;

    use super::*;
    #[test]
    fn ADD() {//ADD A, r8
        let mut cpu = CPU::new();
        cpu.registers.a = 1;
        cpu.registers.b = 2;
        cpu.execute(Instruction::ADD(ArithmeticTarget::B));
        assert_eq!(cpu.registers.a, 3);
    }

    #[test]
    fn ADDHL() {//ADD HL, r16
        let mut cpu = CPU::new();
        cpu.registers.h = 0x12;
        cpu.registers.l = 0x34;
        cpu.registers.b = 0x56;
        cpu.registers.c = 0x78;
        cpu.execute(Instruction::ADDHL(DoubleTarget::BC));
        assert_eq!(cpu.registers.h, 0x68);
        assert_eq!(cpu.registers.l, 0xAC);
    }
}