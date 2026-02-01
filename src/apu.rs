
pub struct SquareChannel {
    pub enabled: bool,
    pub duty: u8,
    pub freq: u16,
    pub volume: u8,
    pub length_timer: u16,
    pub length_enabled: bool,
    pub envelope_volume: u8,
    pub envelope_period: u8,
    pub envelope_timer: u8,
    pub envelope_increase: bool,
    // Generation
    pub timer: u16,
    pub duty_step: u8,
}

impl SquareChannel {
    fn new() -> Self {
        SquareChannel {
            enabled: false,
            duty: 0,
            freq: 0,
            volume: 0,
            length_timer: 0,
            length_enabled: false,
            envelope_volume: 0,
            envelope_period: 0,
            envelope_timer: 0,
            envelope_increase: false,
            timer: 0,
            duty_step: 0,
        }
    }
    
    fn tick_length(&mut self) {
        if self.length_enabled && self.length_timer > 0 {
            self.length_timer -= 1;
            if self.length_timer == 0 {
                self.enabled = false;
            }
        }
    }

    fn tick_timer(&mut self) {
        if self.timer > 0 {
            self.timer -= 1;
        }
        if self.timer == 0 {
            self.timer = (2048 - self.freq) * 4;
            self.duty_step = (self.duty_step + 1) & 7;
        }
    }
}

pub struct WaveChannel {
    pub enabled: bool,
    pub wave_ram: [u8; 16],
    pub freq: u16,
    pub volume: u8,
    pub length_timer: u16,
    pub length_enabled: bool,
    // Generation
    pub timer: u16,
    pub position: u8,
}

impl WaveChannel {
    fn new() -> Self {
        WaveChannel {
            enabled: false,
            wave_ram: [0; 16],
            freq: 0,
            volume: 0,
            length_timer: 0,
            length_enabled: false,
            timer: 0,
            position: 0,
        }
    }
    
    fn tick_length(&mut self) {
        if self.length_enabled && self.length_timer > 0 {
            self.length_timer -= 1;
            if self.length_timer == 0 {
                self.enabled = false;
            }
        }
    }
    
    fn tick_timer(&mut self) {
        if self.timer > 0 {
            self.timer -= 1;
        }
        if self.timer == 0 {
            self.timer = (2048 - self.freq) * 2;
            self.position = (self.position + 1) & 31;
        }
    }
}

pub struct NoiseChannel {
    pub enabled: bool,
    pub volume: u8,
    pub length_timer: u16,
    pub length_enabled: bool,
    pub lfsr: u16,
    // Generation
    pub timer: u16,
    pub shift_amount: u8,
    pub width_mode: bool,
    pub divisor_code: u8,
    pub envelope_volume: u8,
    pub envelope_period: u8,
    pub envelope_timer: u8,
    pub envelope_increase: bool,
}

impl NoiseChannel {
    fn new() -> Self {
        NoiseChannel {
            enabled: false,
            volume: 0,
            length_timer: 0,
            length_enabled: false,
            lfsr: 0x7FFF,
            timer: 0,
            shift_amount: 0,
            width_mode: false,
            divisor_code: 0,
            envelope_volume: 0,
            envelope_period: 0,
            envelope_timer: 0,
            envelope_increase: false,
        }
    }
    
    fn tick_length(&mut self) {
        if self.length_enabled && self.length_timer > 0 {
            self.length_timer -= 1;
            if self.length_timer == 0 {
                self.enabled = false;
            }
        }
    }
    
    fn tick_timer(&mut self) {
        if self.timer > 0 {
            self.timer -= 1;
        }
        if self.timer == 0 {
            let divisor = match self.divisor_code {
                0 => 8,
                1 => 16,
                2 => 32,
                3 => 48,
                4 => 64,
                5 => 80,
                6 => 96,
                7 => 112,
                _ => 8,
            };
            self.timer = divisor << self.shift_amount;
            
            let xor_result = (self.lfsr & 1) ^ ((self.lfsr >> 1) & 1);
            self.lfsr = (self.lfsr >> 1) | (xor_result << 14);
            if self.width_mode {
                self.lfsr = (self.lfsr & !0x40) | (xor_result << 6);
            }
        }
    }
}

pub struct APU {
    pub buffer: Vec<f32>,
    pub sample_rate: u32,
    pub io_regs: [u8; 0x30], // 0xFF10 - 0xFF3F
    
    // Channels
    pub ch1: SquareChannel,
    pub ch2: SquareChannel,
    pub ch3: WaveChannel,
    pub ch4: NoiseChannel,

    pub cycles: u64,
    pub frame_sequencer: u8,
    pub frame_timer: u16,
    pub sample_timer: u16,
}

impl APU {
    pub fn new(sample_rate: u32) -> Self {
        APU {
            buffer: Vec::new(),
            sample_rate,
            io_regs: [0; 0x30],
            ch1: SquareChannel::new(),
            ch2: SquareChannel::new(),
            ch3: WaveChannel::new(),
            ch4: NoiseChannel::new(),
            cycles: 0,
            frame_sequencer: 0,
            frame_timer: 0,
            sample_timer: 0,
        }
    }

    pub fn step(&mut self, cycles: u64) {
        self.cycles += cycles;
        
        self.frame_timer += cycles as u16;
        if self.frame_timer >= 8192 {
            self.frame_timer -= 8192;
            self.frame_sequencer = (self.frame_sequencer + 1) % 8;

            match self.frame_sequencer {
                0 | 4 => {
                    self.tick_length();
                }
                2 | 6 => {
                    self.tick_length();
                    self.tick_sweep();
                }
                7 => {
                    self.tick_envelope();
                }
                _ => {}
            }
        }
        
        for _ in 0..cycles {
             self.tick_channels();
        }
        
        // Sample Generation
        let cycles_per_sample = 4194304.0 / self.sample_rate as f32;
        self.sample_timer += cycles as u16;
        while self.sample_timer >= cycles_per_sample as u16 {
             self.sample_timer -= cycles_per_sample as u16;
             
             let mut sample = 0.0;
             if self.ch1.enabled {
                 let duty_patterns = [
                     0b00000001, // 12.5%
                     0b10000001, // 25%
                     0b10000111, // 50%
                     0b01111110, // 75%
                 ];
                 let pattern = duty_patterns[self.ch1.duty as usize];
                 let bit = (pattern >> self.ch1.duty_step) & 1;
                 
                 let vol = self.ch1.envelope_volume as f32 / 15.0;
                 if bit == 1 { sample += vol * 0.1; } else { sample -= vol * 0.1; }
             }
             if self.ch2.enabled {
                 let duty_patterns = [
                     0b00000001, // 12.5%
                     0b10000001, // 25%
                     0b10000111, // 50%
                     0b01111110, // 75%
                 ];
                 let pattern = duty_patterns[self.ch2.duty as usize];
                 let bit = (pattern >> self.ch2.duty_step) & 1;
                 
                 let vol = self.ch2.envelope_volume as f32 / 15.0;
                 if bit == 1 { sample += vol * 0.1; } else { sample -= vol * 0.1; }
             }
             if self.ch3.enabled {
                 let byte_idx = (self.ch3.position / 2) as usize;
                 let byte = self.ch3.wave_ram[byte_idx];
                 let sample_byte = if self.ch3.position % 2 == 0 {
                     byte >> 4
                 } else {
                     byte & 0x0F
                 };
                 // Volume shift: 0=Mute, 1=100%, 2=50%, 3=25%
                 let shift = match self.ch3.volume {
                     1 => 0,
                     2 => 1,
                     3 => 2,
                     _ => 4,
                 };
                 let wave_out = sample_byte >> shift;
                 // Center wave: (0..15 -> -7.5..7.5)
                 let centered = (wave_out as f32 - 7.5) / 7.5; 
                 sample += centered * 0.1; 
             }
             if self.ch4.enabled {
                 let vol = self.ch4.envelope_volume as f32 / 15.0;
                 if self.ch4.lfsr & 1 == 0 { // Inverted logic for output? or normal? usually low bit is output
                     sample += vol * 0.1; 
                 } else {
                     sample -= vol * 0.1;
                 }
             }
             
             self.buffer.push(sample * 0.25);
        }
    }

    fn tick_channels(&mut self) {
        if self.ch1.enabled { self.ch1.tick_timer(); }
        if self.ch2.enabled { self.ch2.tick_timer(); }
        if self.ch3.enabled { self.ch3.tick_timer(); }
        if self.ch4.enabled { self.ch4.tick_timer(); }
    }

    fn tick_length(&mut self) {
        self.ch1.tick_length();
        self.ch2.tick_length();
        self.ch3.tick_length();
        self.ch4.tick_length();
    }

    fn tick_sweep(&mut self) {
    }

    fn tick_envelope(&mut self) {
        // Ch1
        if self.ch1.envelope_period > 0 {
            if self.ch1.envelope_timer > 0 {
                self.ch1.envelope_timer -= 1;
            }
            if self.ch1.envelope_timer == 0 {
                self.ch1.envelope_timer = self.ch1.envelope_period;
                if self.ch1.envelope_increase {
                    if self.ch1.envelope_volume < 15 { self.ch1.envelope_volume += 1; }
                } else {
                    if self.ch1.envelope_volume > 0 { self.ch1.envelope_volume -= 1; }
                }
            }
        }
        // Ch2
        if self.ch2.envelope_period > 0 {
            if self.ch2.envelope_timer > 0 {
                self.ch2.envelope_timer -= 1;
            }
            if self.ch2.envelope_timer == 0 {
                self.ch2.envelope_timer = self.ch2.envelope_period;
                if self.ch2.envelope_increase {
                    if self.ch2.envelope_volume < 15 { self.ch2.envelope_volume += 1; }
                } else {
                    if self.ch2.envelope_volume > 0 { self.ch2.envelope_volume -= 1; }
                }
            }
        }
        // Ch4
        if self.ch4.envelope_period > 0 {
            if self.ch4.envelope_timer > 0 {
                self.ch4.envelope_timer -= 1;
            }
            if self.ch4.envelope_timer == 0 {
                self.ch4.envelope_timer = self.ch4.envelope_period;
                if self.ch4.envelope_increase {
                    if self.ch4.envelope_volume < 15 { self.ch4.envelope_volume += 1; }
                } else {
                    if self.ch4.envelope_volume > 0 { self.ch4.envelope_volume -= 1; }
                }
            }
        }
    }

    pub fn read_byte(&self, address: u16) -> u8 {
        if address >= 0xFF10 && address <= 0xFF3F {
            return self.io_regs[(address - 0xFF10) as usize];
        }
        0xFF
    }

    pub fn write_byte(&mut self, address: u16, value: u8) {
        if address >= 0xFF10 && address <= 0xFF3F {
            self.io_regs[(address - 0xFF10) as usize] = value;
            
            match address {
                0xFF11 => { // NRx1: Duty (2), Length (6)
                   self.ch1.duty = value >> 6;
                   self.ch1.length_timer = 64 - (value & 0x3F) as u16;
                }
                0xFF12 => { // NRx2: Volume
                   self.ch1.volume = value >> 4;
                   self.ch1.envelope_increase = (value & 0x08) != 0;
                   self.ch1.envelope_period = value & 0x07;
                }
                0xFF14 => { // NRx4: Trigger (7), Length Enable (6), Freq Hi (3)
                    if value & 0x80 != 0 {
                        // Trigger
                        self.ch1.enabled = true;
                        if self.ch1.length_timer == 0 { self.ch1.length_timer = 64; }
                        self.ch1.volume = self.io_regs[0x02] >> 4; 
                        self.ch1.envelope_volume = self.ch1.volume;
                        self.ch1.envelope_timer = self.ch1.envelope_period;
                    }
                    self.ch1.length_enabled = value & 0x40 != 0;
                    let freq_hi = (value & 0x07) as u16;
                    let freq_lo = self.io_regs[0x03] as u16; // 0xFF13
                    self.ch1.freq = (freq_hi << 8) | freq_lo;
                }
                0xFF16 => { // Ch2 NRx1: Duty (2), Length (6)
                    self.ch2.duty = value >> 6;
                    self.ch2.length_timer = 64 - (value & 0x3F) as u16;
                 }
                0xFF17 => { // Ch2 NRx2
                    self.ch2.volume = value >> 4;
                    self.ch2.envelope_increase = (value & 0x08) != 0;
                    self.ch2.envelope_period = value & 0x07;
                }
                0xFF19 => { // Ch2 NRx4
                     if value & 0x80 != 0 {
                         self.ch2.enabled = true;
                         if self.ch2.length_timer == 0 { self.ch2.length_timer = 64; }
                         self.ch2.volume = self.io_regs[0x07] >> 4; 
                         self.ch2.envelope_volume = self.ch2.volume; // Reload envelope
                         self.ch2.envelope_timer = self.ch2.envelope_period;
                     }
                     self.ch2.length_enabled = value & 0x40 != 0;
                     let freq_hi = (value & 0x07) as u16;
                     let freq_lo = self.io_regs[0x08] as u16; // 0xFF18
                     self.ch2.freq = (freq_hi << 8) | freq_lo;
                }
                0xFF1A => { // Ch3 On/Off
                    if value & 0x80 == 0 { self.ch3.enabled = false; }
                    else { if self.ch3.length_enabled { self.ch3.enabled = true; } } // Checking enable bit
                }
                0xFF1B => { // Ch3 Length
                    self.ch3.length_timer = 256 - value as u16;
                }
                0xFF1C => { // Ch3 Volume
                    self.ch3.volume = (value >> 5) & 0x03;
                }
                0xFF1D => { // Ch3 Freq Lo
                    let freq_hi = (self.io_regs[0x0E] & 0x07) as u16; // 0xFF1E
                    self.ch3.freq = (freq_hi << 8) | value as u16;
                }
                0xFF1E => { // Ch3 Freq Hi / Trigger
                    if value & 0x80 != 0 {
                        self.ch3.enabled = true;
                        if self.ch3.length_timer == 0 { self.ch3.length_timer = 256; }
                        self.ch3.position = 0;
                    }
                    self.ch3.length_enabled = value & 0x40 != 0;
                    let freq_lo = self.io_regs[0x0D] as u16; // 0xFF1D
                    self.ch3.freq = ((value as u16 & 0x07) << 8) | freq_lo;
                }
                0xFF20 => { // Ch4 Length
                    self.ch4.length_timer = 64 - (value & 0x3F) as u16;
                }
                0xFF21 => { // NRx2: Volume
                    self.ch4.volume = value >> 4;
                    self.ch4.envelope_increase = (value & 0x08) != 0;
                    self.ch4.envelope_period = value & 0x07;
                }
                0xFF22 => { // Ch4 Poly
                    self.ch4.shift_amount = value >> 4;
                    self.ch4.width_mode = (value & 0x08) != 0;
                    self.ch4.divisor_code = value & 0x07;
                }
                0xFF23 => { // Ch4 Trigger
                     if value & 0x80 != 0 {
                         self.ch4.enabled = true;
                         if self.ch4.length_timer == 0 { self.ch4.length_timer = 64; }
                         self.ch4.lfsr = 0x7FFF;
                         self.ch4.volume = self.io_regs[0x11] >> 4; // Reload volume
                         self.ch4.envelope_volume = self.ch4.volume; // Reload envelope
                         self.ch4.envelope_timer = self.ch4.envelope_period;
                     }
                     self.ch4.length_enabled = value & 0x40 != 0;
                }
                0xFF26 => { // NR52: Power Control
                    if value & 0x80 == 0 {
                        self.ch1.enabled = false;
                        self.ch2.enabled = false;
                        self.ch3.enabled = false;
                        self.ch4.enabled = false;
                    }
                }
                0xFF30..=0xFF3F => { // Wave RAM
                    self.ch3.wave_ram[(address - 0xFF30) as usize] = value;
                }
                _ => {}
            }
        }
    }
}
