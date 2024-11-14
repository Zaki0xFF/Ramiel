use super::registers::*;

pub enum Instruction {
    ADD(ArithmeticTarget),
    ADDHL(),
    ADC(ArithmeticTarget),
}