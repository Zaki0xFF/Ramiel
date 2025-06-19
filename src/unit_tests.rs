#[cfg(test)]
mod instructions_unit {
    use crate::{cpu::*, instructions::*, registers::*};
    #[test]
    fn add() {
        //ADD A, r8
        let mut cpu = CPU::default();
        cpu.registers.a = 1;
        cpu.registers.b = 2;
        cpu.execute(Instruction::ADD(
            Target::Register(ArithmeticTarget::A),
            Target::Register(ArithmeticTarget::B),
        ));

        // Debug prints
        println!("Register A: {}", cpu.registers.a);
        println!("Register B: {}", cpu.registers.b);

        assert_eq!(cpu.registers.a, 3);
    }

    #[test]
    fn add_memhl() {
        //ADD A, (HL)
        let mut cpu = CPU::default();
        cpu.registers.a = 1;
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 2);
        cpu.execute(Instruction::ADD(
            Target::Register(ArithmeticTarget::A),
            Target::MemoryR16(DoubleTarget::HL),
        ));
        assert_eq!(cpu.registers.a, 3);
    }

    #[test]
    fn add_hl_r16() {
        //ADD HL, r16
        let mut cpu = CPU::default();
        cpu.registers.h = 0x12;
        cpu.registers.l = 0x34;
        cpu.registers.b = 0x56;
        cpu.registers.c = 0x78;
        cpu.execute(Instruction::ADD(
            Target::Register16(DoubleTarget::HL),
            Target::Register16(DoubleTarget::BC),
        ));
        assert_eq!(cpu.registers.h, 0x68);
        assert_eq!(cpu.registers.l, 0xAC);
    }

    #[test]
    fn add_hl_sp() {
        //ADD HL, SP
        let mut cpu = CPU::default();
        cpu.registers.h = 0x12;
        cpu.registers.l = 0x34;
        cpu.sp = 0x5678;
        cpu.execute(Instruction::ADD(
            Target::Register16(DoubleTarget::HL),
            Target::Register16(DoubleTarget::SP),
        ));
        assert_eq!(cpu.registers.h, 0x68);
        assert_eq!(cpu.registers.l, 0xAC);
    }

    #[test]
    fn and() {
        //AND r8
        let mut cpu = CPU::default();
        cpu.registers.a = 0b10101010;
        cpu.registers.b = 0b11001100;
        cpu.execute(Instruction::AND(
            Target::Register(ArithmeticTarget::A),
            Target::Register(ArithmeticTarget::B),
        ));
        assert_eq!(cpu.registers.a, 0b10001000);
    }

    #[test]
    fn and_hl() {
        //AND (HL)
        let mut cpu = CPU::default();
        cpu.registers.a = 0b10101010;
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0b11001100);
        cpu.execute(Instruction::AND(
            Target::Register(ArithmeticTarget::A),
            Target::MemoryR16(DoubleTarget::HL),
        ));
        assert_eq!(cpu.registers.a, 0b10001000);
    }

    #[test]
    fn adc() {
        //ADC r8
        let mut cpu = CPU::default();
        cpu.registers.a = 3;
        cpu.registers.b = 255;
        cpu.execute(Instruction::ADC(Target::Register(ArithmeticTarget::B)));
        assert_eq!(cpu.registers.a, 3);
        assert!(cpu.registers.f.carry);
    }

    #[test]
    fn test_adc_a_hl_no_carry() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0x12);
        cpu.registers.a = 0x34;
        cpu.registers.f.carry = false;

        cpu.execute(Instruction::ADC(Target::MemoryR16(DoubleTarget::HL)));

        assert_eq!(cpu.registers.a, 0x46);
        assert!(!cpu.registers.f.zero);
        assert!(!cpu.registers.f.subtract);
        assert!(!cpu.registers.f.carry);
        assert!(!cpu.registers.f.half_carry);
    }

    #[test]
    fn test_adc_a_hl_with_carry() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0x12);
        cpu.registers.a = 0x34;
        cpu.registers.f.carry = true;

        cpu.execute(Instruction::ADC(Target::MemoryR16(DoubleTarget::HL)));

        assert_eq!(cpu.registers.a, 0x47);
        assert!(!cpu.registers.f.zero);
        assert!(!cpu.registers.f.subtract);
        assert!(!cpu.registers.f.carry);
        assert!(!cpu.registers.f.half_carry);
    }

    #[test]
    fn srl_r8() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0b10000000;
        cpu.execute(Instruction::SRL(Target::Register(ArithmeticTarget::A)));
        assert_eq!(cpu.registers.a, 0b01000000);
        assert!(!cpu.registers.f.carry);
    }

    #[test]
    fn sra_r8() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0b10000000;
        cpu.execute(Instruction::SRA(Target::Register(ArithmeticTarget::A)));
        assert_eq!(cpu.registers.a, 0b11000000);
        assert!(!cpu.registers.f.carry);
    }

    #[test]
    fn sra_hl() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0b10000000);
        cpu.execute(Instruction::SRA(Target::MemoryR16(DoubleTarget::HL)));
        assert_eq!(cpu.bus.read_byte(0x1234), 0b11000000);
        assert!(!cpu.registers.f.carry);
    }

    #[test]
    fn sla_r8() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0b10000000;
        cpu.execute(Instruction::SLA(Target::Register(ArithmeticTarget::A)));
        assert_eq!(cpu.registers.a, 0b00000000);
        assert!(cpu.registers.f.carry);
    }

    #[test]
    fn sla_hl() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0b10000000);
        cpu.execute(Instruction::SLA(Target::MemoryR16(DoubleTarget::HL)));
        assert_eq!(cpu.bus.read_byte(0x1234), 0b00000000);
        assert!(cpu.registers.f.carry);
    }

    #[test]
    fn srl_hl() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0b10000000);
        cpu.execute(Instruction::SRL(Target::MemoryR16(DoubleTarget::HL)));
        assert_eq!(cpu.bus.read_byte(0x1234), 0b01000000);
        assert!(!cpu.registers.f.carry);
    }

    #[test]
    fn test_adc_a_hl_with_overflow() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0xFF);
        cpu.registers.a = 0x01;
        cpu.registers.f.carry = true;

        cpu.execute(Instruction::ADC(Target::MemoryR16(DoubleTarget::HL)));

        assert_eq!(cpu.registers.a, 0x01);
        assert!(!cpu.registers.f.zero);
        assert!(!cpu.registers.f.subtract);
        assert!(cpu.registers.f.carry);
        assert!(cpu.registers.f.half_carry);
    }

    #[test]
    fn bit() {
        //BIT r8
        let mut cpu = CPU::default();
        cpu.registers.a = 0b00001000;
        cpu.execute(Instruction::BIT(3, Target::Register(ArithmeticTarget::A)));
        assert!(!cpu.registers.f.zero);
    }

    #[test]
    fn bit_hl() {
        //BIT (HL)
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0b00001000);
        cpu.execute(Instruction::BIT(3, Target::MemoryR16(DoubleTarget::HL)));
        assert!(!cpu.registers.f.zero);
    }

    #[test]
    fn ccf() {
        //CCF
        let mut cpu = CPU::default();
        cpu.registers.f.carry = true;
        cpu.execute(Instruction::CCF());
        assert!(!cpu.registers.f.carry);
    }

    #[test]
    fn cp_r8() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0x12;
        cpu.registers.b = 0x12;
        cpu.execute(Instruction::CP(Target::Register(ArithmeticTarget::B)));
        assert!(cpu.registers.f.zero);
    }

    #[test]
    fn cp_hl() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0x12;
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0x12);
        cpu.execute(Instruction::CP(Target::MemoryR16(DoubleTarget::HL)));
        assert!(cpu.registers.f.zero);
    }

    #[test]
    fn cpl() {
        //CPL
        let mut cpu = CPU::default();
        cpu.registers.a = 0b10101010;
        cpu.execute(Instruction::CPL());
        assert_eq!(cpu.registers.a, 0b01010101);
        assert!(cpu.registers.f.subtract);
        assert!(cpu.registers.f.half_carry);
    }

    #[test]
    fn daa() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0x3c; // 0x3c = 60 DEC
        cpu.registers.f.half_carry = true;
        cpu.registers.f.carry = false;
        cpu.execute(Instruction::DAA());
        assert_eq!(cpu.registers.a, 0x42); // Sprawdź, czy A = 42 DEC
        assert!(!cpu.registers.f.zero);
        assert!(!cpu.registers.f.half_carry);
        assert!(!cpu.registers.f.carry);
    }

    #[test]
    fn dec() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0x01;
        cpu.execute(Instruction::DEC(Target::Register(ArithmeticTarget::A)));
        assert_eq!(cpu.registers.a, 0x00);
        assert!(cpu.registers.f.zero);
        assert!(cpu.registers.f.subtract);
    }

    #[test]
    fn dec_r16() {
        let mut cpu = CPU::default();
        cpu.registers.set_bc(0x1234);
        cpu.execute(Instruction::DEC(Target::Register16(DoubleTarget::BC)));
        assert_eq!(cpu.registers.get_bc(), 0x1233);
    }

    #[test]
    fn dec_hl() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0x12);
        cpu.execute(Instruction::DEC(Target::MemoryR16(DoubleTarget::HL)));
        assert_eq!(cpu.bus.read_byte(0x1234), 0x11);
    }

    #[test]
    fn inc() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0x01;
        cpu.execute(Instruction::INC(Target::Register(ArithmeticTarget::A)));
        assert_eq!(cpu.registers.a, 0x02);
        assert!(!cpu.registers.f.zero);
        assert!(!cpu.registers.f.subtract);
    }

    #[test]
    fn sbc_r8() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0x03;
        cpu.registers.b = 0x02;
        cpu.registers.f.carry = true;
        cpu.execute(Instruction::SBC(
            Target::Register(ArithmeticTarget::A),
            Target::Register(ArithmeticTarget::B),
        ));
        assert_eq!(cpu.registers.a, 0x00);
        assert!(cpu.registers.f.zero);
        assert!(cpu.registers.f.subtract);
        assert!(!cpu.registers.f.carry);
    }

    #[test]
    fn sbc_hl() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0x03;
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0x02);
        cpu.registers.f.carry = true;
        cpu.execute(Instruction::SBC(
            Target::Register(ArithmeticTarget::A),
            Target::MemoryR16(DoubleTarget::HL),
        ));
        assert_eq!(cpu.registers.a, 0x00);
        assert!(cpu.registers.f.zero);
        assert!(cpu.registers.f.subtract);
        assert!(!cpu.registers.f.carry);
    }

    #[test]
    fn sub() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0x02;
        cpu.registers.b = 0x01;
        cpu.execute(Instruction::SUB(Target::Register(ArithmeticTarget::B)));
        assert_eq!(cpu.registers.a, 0x01);
        assert!(!cpu.registers.f.zero);
        assert!(cpu.registers.f.subtract);
    }

    #[test]
    fn sub_hl() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0x02;
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0x01);
        cpu.execute(Instruction::SUB(Target::MemoryR16(DoubleTarget::HL)));
        assert_eq!(cpu.registers.a, 0x01);
        assert!(!cpu.registers.f.zero);
        assert!(cpu.registers.f.subtract);
    }

    #[test]
    fn inc_memhl() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0x12);
        cpu.execute(Instruction::INC(Target::MemoryR16(DoubleTarget::HL)));
        assert_eq!(cpu.bus.read_byte(0x1234), 0x13);
    }

    #[test]
    fn inc_r16() {
        let mut cpu = CPU::default();
        cpu.registers.set_bc(0x1234);
        cpu.execute(Instruction::INC(Target::Register16(DoubleTarget::BC)));
        assert_eq!(cpu.registers.get_bc(), 0x1235);
    }

    // Stack Pointer (SP) instruction tests
    #[test]
    fn inc_sp() {
        // INC SP - Test incrementing stack pointer
        let mut cpu = CPU::default();
        cpu.sp = 0x1000;
        cpu.execute(Instruction::INC(Target::Register16(DoubleTarget::SP)));
        assert_eq!(cpu.sp, 0x1001);
    }

    #[test]
    fn dec_sp() {
        // DEC SP - Test decrementing stack pointer
        let mut cpu = CPU::default();
        cpu.sp = 0x1000;
        cpu.execute(Instruction::DEC(Target::Register16(DoubleTarget::SP)));
        assert_eq!(cpu.sp, 0x0FFF);
    }

    #[test]
    fn ld_sp_hl() {
        // LD SP,HL - Test loading HL into SP
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.sp = 0x0000;
        cpu.execute(Instruction::LD(
            Target::Register16(DoubleTarget::SP),
            Target::Register16(DoubleTarget::HL),
        ));
        assert_eq!(cpu.sp, 0x1234);
    }

    #[test]
    fn add_sp_positive() {
        // ADD SP,r8 with positive offset
        let mut cpu = CPU::default();
        cpu.sp = 0x1000;
        cpu.bus.write_byte(cpu.pc + 1, 0x05); // +5 offset
        cpu.execute(Instruction::ADD(
            Target::Register16(DoubleTarget::SP),
            Target::Const8(),
        ));
        assert_eq!(cpu.sp, 0x1005);
        // ADD SP should clear zero flag and subtract flag
        assert!(!cpu.registers.f.zero);
        assert!(!cpu.registers.f.subtract);
    }

    #[test]
    fn add_sp_negative() {
        // ADD SP,r8 with negative offset
        let mut cpu = CPU::default();
        cpu.sp = 0x1000;
        cpu.bus.write_byte(cpu.pc + 1, 0xFF); // -1 offset (0xFF as signed byte = -1)
        cpu.execute(Instruction::ADD(
            Target::Register16(DoubleTarget::SP),
            Target::Const8(),
        ));
        assert_eq!(cpu.sp, 0x0FFF);
        // ADD SP should clear zero flag and subtract flag
        assert!(!cpu.registers.f.zero);
        assert!(!cpu.registers.f.subtract);
    }

    #[test]
    fn add_sp_carry_flag() {
        // ADD SP,r8 - Test carry flag behavior
        let mut cpu = CPU::default();
        cpu.sp = 0x00FF;
        cpu.bus.write_byte(cpu.pc + 1, 0x01); // +1 offset
        cpu.execute(Instruction::ADD(
            Target::Register16(DoubleTarget::SP),
            Target::Const8(),
        ));
        assert_eq!(cpu.sp, 0x0100);
        // Should set carry flag (carry from bit 7 to bit 8)
        assert!(cpu.registers.f.carry);
    }

    #[test]
    fn add_sp_half_carry_flag() {
        // ADD SP,r8 - Test half carry flag behavior
        let mut cpu = CPU::default();
        cpu.sp = 0x000F;
        cpu.bus.write_byte(cpu.pc + 1, 0x01); // +1 offset
        cpu.execute(Instruction::ADD(
            Target::Register16(DoubleTarget::SP),
            Target::Const8(),
        ));
        assert_eq!(cpu.sp, 0x0010);
        // Should set half carry flag (carry from bit 3 to bit 4)
        assert!(cpu.registers.f.half_carry);
    }

    #[test]
    fn ldhlsp_positive() {
        // LD HL,SP+r8 with positive offset
        let mut cpu = CPU::default();
        cpu.sp = 0x1000;
        cpu.registers.set_hl(0x0000);
        cpu.bus.write_byte(cpu.pc + 1, 0x05); // +5 offset
        cpu.execute(Instruction::LDHLSP());
        assert_eq!(cpu.registers.get_hl(), 0x1005);
        assert_eq!(cpu.sp, 0x1000); // SP should remain unchanged
    }

    #[test]
    fn ldhlsp_negative() {
        // LD HL,SP+r8 with negative offset
        let mut cpu = CPU::default();
        cpu.sp = 0x1000;
        cpu.registers.set_hl(0x0000);
        cpu.bus.write_byte(cpu.pc + 1, 0xFF); // -1 offset (0xFF as signed byte = -1)
        cpu.execute(Instruction::LDHLSP());
        assert_eq!(cpu.registers.get_hl(), 0x0FFF);
        assert_eq!(cpu.sp, 0x1000); // SP should remain unchanged
    }

    #[test]
    fn ldhlsp_flags() {
        // LD HL,SP+r8 - Test flag behavior
        let mut cpu = CPU::default();
        cpu.sp = 0x00FF;
        cpu.registers.set_hl(0x0000);
        cpu.bus.write_byte(cpu.pc + 1, 0x01); // +1 offset
        cpu.execute(Instruction::LDHLSP());
        assert_eq!(cpu.registers.get_hl(), 0x0100);
        
        // LDHLSP should clear zero and subtract flags
        assert!(!cpu.registers.f.zero);
        assert!(!cpu.registers.f.subtract);
        // Should set carry flag (carry from bit 7 to bit 8)
        assert!(cpu.registers.f.carry);
        assert!(!cpu.registers.f.half_carry); // No half carry in this case
    }

    #[test]
    fn ldhlsp_half_carry_flags() {
        // LD HL,SP+r8 - Test half carry flag behavior
        let mut cpu = CPU::default();
        cpu.sp = 0x000F;
        cpu.registers.set_hl(0x0000);
        cpu.bus.write_byte(cpu.pc + 1, 0x01); // +1 offset
        cpu.execute(Instruction::LDHLSP());
        assert_eq!(cpu.registers.get_hl(), 0x0010);
        
        // LDHLSP should clear zero and subtract flags
        assert!(!cpu.registers.f.zero);
        assert!(!cpu.registers.f.subtract);
        // Should set half carry flag (carry from bit 3 to bit 4)
        assert!(cpu.registers.f.half_carry);
        assert!(!cpu.registers.f.carry); // No carry in this case
    }

    #[test]
    fn sp_wraparound() {
        // Test SP wraparound behavior
        let mut cpu = CPU::default();
        
        // Test INC SP wraparound from 0xFFFF to 0x0000
        cpu.sp = 0xFFFF;
        cpu.execute(Instruction::INC(Target::Register16(DoubleTarget::SP)));
        assert_eq!(cpu.sp, 0x0000);
        
        // Test DEC SP wraparound from 0x0000 to 0xFFFF
        cpu.sp = 0x0000;
        cpu.execute(Instruction::DEC(Target::Register16(DoubleTarget::SP)));
        assert_eq!(cpu.sp, 0xFFFF);
    }

    #[test]
    fn jp() {
        let mut cpu = CPU::default();
        cpu.execute(Instruction::JP(JumpCondition::Always, 0x1234));
        assert_eq!(cpu.pc, 0x1234);
    }

    #[test]
    fn jp_nz() {
        let mut cpu = CPU::default();
        cpu.registers.f.zero = false;
        cpu.execute(Instruction::JP(JumpCondition::NotZero, 0x1234));
        assert_eq!(cpu.pc, 0x1234);
    }

    #[test]
    fn jp_hl() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.execute(Instruction::JPHL(Target::Register16(DoubleTarget::HL)));
        assert_eq!(cpu.pc, 0x1234);
    }
    #[test]
    fn swap_r8() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0b11110000;
        cpu.execute(Instruction::SWAP(Target::Register(ArithmeticTarget::A)));
        assert_eq!(cpu.registers.a, 0b00001111);
        assert!(!cpu.registers.f.zero);
        assert!(!cpu.registers.f.subtract);
        assert!(!cpu.registers.f.half_carry);
        assert!(!cpu.registers.f.carry);
    }

    #[test]
    fn swap_hl() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0b11110000);
        cpu.execute(Instruction::SWAP(Target::MemoryR16(DoubleTarget::HL)));
        assert_eq!(cpu.bus.read_byte(0x1234), 0b00001111);
        assert!(!cpu.registers.f.zero);
        assert!(!cpu.registers.f.subtract);
        assert!(!cpu.registers.f.half_carry);
        assert!(!cpu.registers.f.carry);
    }

    #[test]
    fn push_pop() {
        let mut cpu = CPU::default();

        cpu.sp = 0xFFFE; // Assume SP is set to 0xFFFE for the sake of the test
                         // In the hardware it is normally set in the boot ROM

        cpu.registers.set_bc(0x1234);
        cpu.execute(Instruction::PUSH(Target::Register16(DoubleTarget::BC)));
        assert_eq!(cpu.bus.read_byte(cpu.sp), 0x34);
        assert_eq!(cpu.bus.read_byte(cpu.sp + 1), 0x12);
        cpu.execute(Instruction::POP(Target::Register16(DoubleTarget::BC)));
        assert_eq!(cpu.registers.get_bc(), 0x1234);
    }

    #[test]
    fn call_ret() {
        let mut cpu = CPU::default();
        cpu.pc = 0x1234;
        cpu.sp = 0xFFEE;
        cpu.execute(Instruction::CALL(JumpCondition::Always, 0x5678));
        assert_eq!(cpu.pc, 0x5678);

        cpu.execute(Instruction::RET(JumpCondition::Always));
        assert_eq!(cpu.pc, 0x1237);
    }

    #[test]
    fn ldi() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.registers.a = 0x12;
        cpu.execute(Instruction::LDI(
            Target::MemoryR16(DoubleTarget::HL),
            Target::Register(ArithmeticTarget::A),
        ));
        assert_eq!(cpu.bus.read_byte(0x1234), 0x12);
        assert_eq!(cpu.registers.get_hl(), 0x1235);
    }

    #[test]
    fn ldi_a() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0x12);
        cpu.execute(Instruction::LDI(
            Target::Register(ArithmeticTarget::A),
            Target::MemoryR16(DoubleTarget::HL),
        ));
        assert_eq!(cpu.bus.read_byte(0x1234), 0x12);
        assert_eq!(cpu.registers.get_hl(), 0x1235);
    }

    #[test]
    fn ldd() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.registers.a = 0x12;
        cpu.execute(Instruction::LDD(
            Target::MemoryR16(DoubleTarget::HL),
            Target::Register(ArithmeticTarget::A),
        ));
        assert_eq!(cpu.bus.read_byte(0x1234), 0x12);
        assert_eq!(cpu.registers.get_hl(), 0x1233);
    }

    #[test]
    fn ldd_a() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0x12);
        cpu.execute(Instruction::LDD(
            Target::Register(ArithmeticTarget::A),
            Target::MemoryR16(DoubleTarget::HL),
        ));
        assert_eq!(cpu.bus.read_byte(0x1234), 0x12);
        assert_eq!(cpu.registers.get_hl(), 0x1233);
    }
}
