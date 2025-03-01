#[cfg(test)]
mod instructions_unit {
    use crate::{ArithmeticTarget, DoubleTarget, Instruction, JumpCondition, Target, CPU};

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

    #[test]
    fn inc_sp() {
        let mut cpu = CPU::default();
        cpu.sp = 0x1234;
        cpu.execute(Instruction::INC(Target::Register16(DoubleTarget::SP)));
        assert_eq!(cpu.sp, 0x1235);
    }

    #[test]
    fn ei() {
        let mut cpu = CPU::default();
        cpu.registers.ime = false;
        cpu.execute(Instruction::EI());
        assert!(cpu.registers.ime);
    }

    #[test]
    fn di() {
        let mut cpu = CPU::default();
        cpu.registers.ime = true;
        cpu.execute(Instruction::DI());
        assert!(!cpu.registers.ime);
    }

    #[test]
    fn ld() {
        // LD r8, r8
        let mut cpu = CPU::default();
        cpu.registers.a = 0x01;
        cpu.execute(Instruction::LD(
            Target::Register(ArithmeticTarget::B),
            Target::Register(ArithmeticTarget::A),
        ));
        assert_eq!(cpu.registers.b, 0x01);
    }

    #[test]
    fn ld_hl() {
        // LD (HL), r8
        let mut cpu = CPU::default();
        cpu.registers.a = 0x01;
        cpu.registers.set_hl(0x1234);
        cpu.execute(Instruction::LD(
            Target::MemoryR16(DoubleTarget::HL),
            Target::Register(ArithmeticTarget::A),
        ));
        assert_eq!(cpu.bus.read_byte(0x1234), 0x01);
    }

    #[test]
    fn ld_r8_hl() {
        // LD r8, (HL)
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0x01);
        cpu.execute(Instruction::LD(
            Target::Register(ArithmeticTarget::A),
            Target::MemoryR16(DoubleTarget::HL),
        ));
        assert_eq!(cpu.registers.a, 0x01);
    }

    #[test]
    fn ld_a_r16() {
        // LD A, (r16)
        let mut cpu = CPU::default();
        cpu.registers.set_bc(0x1234);
        cpu.bus.write_byte(0x1234, 0x01);
        cpu.execute(Instruction::LD(
            Target::Register(ArithmeticTarget::A),
            Target::MemoryR16(DoubleTarget::BC),
        ));
        assert_eq!(cpu.registers.a, 0x01);
    }

    #[test]
    fn xor() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0b10101010;
        cpu.registers.b = 0b11001100;
        cpu.execute(Instruction::XOR(
            Target::Register(ArithmeticTarget::A),
            Target::Register(ArithmeticTarget::B),
        ));
        assert_eq!(cpu.registers.a, 0b01100110);
    }

    #[test]
    fn xor_hl() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0b10101010;
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0b11001100);
        cpu.execute(Instruction::XOR(
            Target::Register(ArithmeticTarget::A),
            Target::MemoryR16(DoubleTarget::HL),
        ));
        assert_eq!(cpu.registers.a, 0b01100110);
    }

    #[test]
    fn or_r8() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0b10101010;
        cpu.registers.b = 0b11001100;
        cpu.execute(Instruction::OR(
            Target::Register(ArithmeticTarget::A),
            Target::Register(ArithmeticTarget::B),
        ));
        assert_eq!(cpu.registers.a, 0b11101110);
    }

    #[test]
    fn or_hl() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0b10101010;
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0b11001100);
        cpu.execute(Instruction::OR(
            Target::Register(ArithmeticTarget::A),
            Target::MemoryR16(DoubleTarget::HL),
        ));
        assert_eq!(cpu.registers.a, 0b11101110);
    }

    #[test]
    fn rla() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0b10000000;
        cpu.registers.f.carry = true;
        cpu.execute(Instruction::RLA());
        assert_eq!(cpu.registers.a, 0b00000001);
        assert!(cpu.registers.f.carry);
    }

    #[test]
    fn rl_r8() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0b10000000;
        cpu.execute(Instruction::RL(Target::Register(ArithmeticTarget::A)));
        assert_eq!(cpu.registers.a, 0b00000000);
        assert!(cpu.registers.f.carry);
    }

    #[test]
    fn rl_hl() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0b10000000);
        cpu.execute(Instruction::RL(Target::MemoryR16(DoubleTarget::HL)));
        assert_eq!(cpu.bus.read_byte(0x1234), 0b00000000);
        assert!(cpu.registers.f.carry);
    }

    #[test]
    fn rlc_r8() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0b10000000;
        cpu.execute(Instruction::RLC(Target::Register(ArithmeticTarget::A)));
        assert_eq!(cpu.registers.a, 0b00000001);
        assert!(cpu.registers.f.carry);
    }

    #[test]
    fn rlc_hl() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0b10000000);
        cpu.execute(Instruction::RLC(Target::MemoryR16(DoubleTarget::HL)));
        assert_eq!(cpu.bus.read_byte(0x1234), 0b00000001);
        assert!(cpu.registers.f.carry);
    }

    #[test]
    fn rlca() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0b10000000;
        cpu.execute(Instruction::RLCA());
        assert_eq!(cpu.registers.a, 0b00000001);
        assert!(cpu.registers.f.carry);
    }

    #[test]
    fn rr_r8() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0b00000001;
        cpu.registers.f.carry = true;
        cpu.execute(Instruction::RR(Target::Register(ArithmeticTarget::A)));
        assert_eq!(cpu.registers.a, 0b10000000);
        assert!(cpu.registers.f.carry);
    }

    #[test]
    fn rr_hl() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0b00000001);
        cpu.registers.f.carry = true;
        cpu.execute(Instruction::RR(Target::MemoryR16(DoubleTarget::HL)));
        assert_eq!(cpu.bus.read_byte(0x1234), 0b10000000);
        assert!(cpu.registers.f.carry);
    }

    #[test]
    fn rrc_r8() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0b00000001;
        cpu.execute(Instruction::RRC(Target::Register(ArithmeticTarget::A)));
        assert_eq!(cpu.registers.a, 0b10000000);
        assert!(cpu.registers.f.carry);
    }

    #[test]
    fn rrc_hl() {
        let mut cpu = CPU::default();
        cpu.registers.set_hl(0x1234);
        cpu.bus.write_byte(0x1234, 0b00000001);
        cpu.execute(Instruction::RRC(Target::MemoryR16(DoubleTarget::HL)));
        assert_eq!(cpu.bus.read_byte(0x1234), 0b10000000);
        assert!(cpu.registers.f.carry);
    }

    #[test]
    fn rra() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0b00000001;
        cpu.registers.f.carry = true;
        cpu.execute(Instruction::RRA());
        assert_eq!(cpu.registers.a, 0b10000000);
        assert!(cpu.registers.f.carry);
    }

    #[test]
    fn rrca() {
        let mut cpu = CPU::default();
        cpu.registers.a = 0b00000001;
        cpu.execute(Instruction::RRCA());
        assert_eq!(cpu.registers.a, 0b10000000);
        assert!(cpu.registers.f.carry);
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
    fn jr() {
        let mut cpu = CPU::default();
        cpu.execute(Instruction::JR(JumpCondition::Always, 0x01));
        assert_eq!(cpu.pc, 0x01);
    }

    #[test]
    fn jr_nz() {
        let mut cpu = CPU::default();
        cpu.registers.f.zero = false;
        cpu.execute(Instruction::JR(JumpCondition::NotZero, 0x01));
        assert_eq!(cpu.pc, 0x01);
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
        assert_eq!(cpu.bus.read_byte(cpu.sp), 0x12);
        assert_eq!(cpu.bus.read_byte(cpu.sp + 1), 0x34);
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
}
