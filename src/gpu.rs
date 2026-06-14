#![allow(unused_variables)]


pub const VRAM_BEGIN: usize = 0x8000;
pub const VRAM_END: usize = 0x9FFF;
pub const VRAM_SIZE: usize = VRAM_END - VRAM_BEGIN + 1;

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum TilePixelValue {
    Zero,
    One,
    Two,
    Three,
}

type Tile = [[TilePixelValue; 8]; 8];
fn empty_tile() -> Tile {
    [[TilePixelValue::Zero; 8]; 8]
}

pub struct GPU {
    vram: [u8; VRAM_SIZE],
    tile_set: [Tile; 384],
    pub scx: u8,  // Scroll X
    pub scy: u8,  // SCroll Y
    pub ly: u8,   //LCD Y-Coordinate
    pub lyc: u8,  // LY Compare
    pub lcdc: u8, // LCD Control
    pub stat: u8, // LCDC Status
    mode_clock: u16,
    pub bgp: u8, // Background Palette
    pub obp0: u8, // Object Palette 0
    pub obp1: u8, // Object Palette 1
    pub oam: [u8; 160], // Object Attribute Memory
    pub wx: u8,
    pub wy: u8,
    pub mode: u8,

    pub buffer: Vec<u32>,
    pub previous_stat_interrupt_state: bool,
}

impl GPU {
    pub fn step(&mut self, cycles: u16) -> (bool, bool) {
        let mut vblank = false;
        let mut stat_int = false;

        self.mode_clock += cycles;

        const OAM_SEARCH_CYCLES: u16 = 80;
        const PIXEL_TRANSFER_CYCLES: u16 = 172;
        const HBLANK_CYCLES: u16 = 204;
        const VBLANK_LINE_CYCLES: u16 = 456;

        match self.mode {
            // Mode 2: OAM Search
            2 => {
                if self.mode_clock >= OAM_SEARCH_CYCLES {
                    self.mode_clock -= OAM_SEARCH_CYCLES;
                    self.mode = 3;
                }
            }
            // Mode 3: Pixel Transfer
            3 => {
                if self.mode_clock >= PIXEL_TRANSFER_CYCLES {
                    self.mode_clock -= PIXEL_TRANSFER_CYCLES;
                    self.mode = 0;
                    
                }
            }
            // Mode 0: HBlank
            0 => {
                if self.mode_clock >= HBLANK_CYCLES {
                    self.mode_clock -= HBLANK_CYCLES;
                    
                    self.render_scanline();

                    self.ly += 1;

                    if self.ly == 144 {
                        self.mode = 1;
                        vblank = true;
                    } else {
                        self.mode = 2;
                    }
                }
            }
            // Mode 1: VBlank
            1 => {
                if self.mode_clock >= VBLANK_LINE_CYCLES {
                    self.mode_clock -= VBLANK_LINE_CYCLES;
                    self.ly += 1;

                    if self.ly > 153 {
                        self.mode = 2;
                        self.ly = 0;
                        self.mode = 2;
                        self.ly = 0;

                    }
                }
            }
            _ => { self.mode = 2; self.mode_clock = 0; }
        }

        // Update STAT register with current mode (Bits 0-1)
        self.stat &= 0xFC;
        self.stat |= self.mode;

        // LYC == LY Check (Bit 2)
        if self.ly == self.lyc {
            self.stat |= 0x04;
        } else {
            self.stat &= !0x04;
        }
        
        // STAT Interrupt Signal Logic (Edge Triggered)
        let mode0_int = (self.stat & 0x08 != 0) && (self.mode == 0);
        let mode1_int = (self.stat & 0x10 != 0) && (self.mode == 1);
        let mode2_int = (self.stat & 0x20 != 0) && (self.mode == 2);
        let lyc_int   = (self.stat & 0x40 != 0) && (self.ly == self.lyc);
        
        let current_stat_interrupt_state = mode0_int || mode1_int || mode2_int || lyc_int;
        
        if current_stat_interrupt_state && !self.previous_stat_interrupt_state {
            stat_int = true;
        }
        
        self.previous_stat_interrupt_state = current_stat_interrupt_state;

        (vblank, stat_int)
    }

    pub fn new() -> Self {
        GPU {
            vram: [0; VRAM_SIZE],
            tile_set: [empty_tile(); 384],
            scx: 0,
            scy: 0,
            ly: 0,
            lyc: 0,
            lcdc: 0,
            stat: 0,
            mode_clock: 0,
            bgp: 0xE4,
            obp0: 0xE4,
            obp1: 0xE4,
            oam: [0; 160],
            wx: 0,
            wy: 0,
            mode: 0,

            buffer: vec![0; 160 * 144],
            previous_stat_interrupt_state: false,
        }
    }
    pub fn read_vram(&self, address: usize) -> u8 {
        self.vram[address]
    }

    pub fn write_vram(&mut self, index: usize, value: u8) {
        self.vram[index] = value;
        if index >= 0x1800 {
            return;
        }

        let normalized_index = index & 0xFFFE;
        let byte1 = self.vram[normalized_index];
        let byte2 = self.vram[normalized_index + 1];
        let tile_index = index / 16;
        let row_index = (index % 16) / 2;

        for pixel_index in 0..8 {
            let mask = 1 << (7 - pixel_index);
            let lsb = byte1 & mask;
            let msb = byte2 & mask;

            let value = match (lsb != 0, msb != 0) {
                (true, true) => TilePixelValue::Three,
                (false, true) => TilePixelValue::Two,
                (true, false) => TilePixelValue::One,
                (false, false) => TilePixelValue::Zero,
            };

            self.tile_set[tile_index][row_index][pixel_index] = value;
        }
    }
    
    pub fn read_oam(&self, address: usize) -> u8 {
        self.oam[address]
    }

    pub fn write_oam(&mut self, address: usize, value: u8) {
        self.oam[address] = value;
    }

    pub fn render_screen(&mut self) -> Vec<u32> {
        let mut framebuffer = self.buffer.clone();

        if self.lcdc & 0x02 != 0 {
             self.render_sprites(&mut framebuffer);
        }
        
        framebuffer
    }

    fn render_scanline(&mut self) {
        let y = self.ly;
        if y >= 144 { return; }

        const SCREEN_WIDTH: usize = 160;
        
        // Background
        if self.lcdc & 0x01 != 0 {
            let scrolled_y = (y as u8).wrapping_add(self.scy) as usize;
            let tilemap_base = if self.lcdc & 0x08 != 0 { 0x9C00 } else { 0x9800 };
            let tile_data_base = if self.lcdc & 0x10 != 0 { 0x8000 } else { 0x8800 };
            
            let tile_y = scrolled_y / 8;
            let pixel_y = scrolled_y % 8;
            
            for x in 0..SCREEN_WIDTH {
                 let scrolled_x = (x as u8).wrapping_add(self.scx) as usize;
                 let tile_x = scrolled_x / 8;
                 let pixel_x = scrolled_x % 8;
                 
                 let tilemap_index = tilemap_base + (tile_y * 32) + (tile_x % 32); // Wrap x index
                 let tile_index_val = self.vram[tilemap_index - VRAM_BEGIN];
                 
                 let tile_index = if tile_data_base == 0x8800 {
                    ((tile_index_val as i8) as i16 + 256) as usize
                } else {
                    tile_index_val as usize
                };
                
                let pixel_value = self.tile_set[tile_index][pixel_y][pixel_x];
                let color_bits = self.get_bg_color_bits(pixel_value);
                self.buffer[y as usize * SCREEN_WIDTH + x] = self.get_color(color_bits);
            }
        } else {
             for x in 0..SCREEN_WIDTH {
                 self.buffer[y as usize * SCREEN_WIDTH + x] = 0x00E0F8D0;
             }
        }
        
        // Window
        if self.lcdc & 0x20 != 0 {
             let wx = self.wx.wrapping_sub(7);
             let wy = self.wy;
             
             if (y as u8) >= wy {
                 let window_y = (y as u8).wrapping_sub(wy);
                 let tile_y = window_y / 8;
                 let pixel_y = (window_y % 8) as usize;
                 
                 let tilemap_base = if self.lcdc & 0x40 != 0 { 0x9C00 } else { 0x9800 };
                 let tile_data_base = if self.lcdc & 0x10 != 0 { 0x8000 } else { 0x8800 };

                 for x in (wx as usize)..SCREEN_WIDTH {
                     let window_x = (x as u8).wrapping_sub(wx);
                     let tile_x = window_x / 8;
                     let pixel_x = (window_x % 8) as usize;
                     
                     let tilemap_index = tilemap_base + (tile_y as usize * 32) + tile_x as usize;
                     if tilemap_index < VRAM_BEGIN || tilemap_index > VRAM_END { continue; }
                     let tile_index_val = self.vram[tilemap_index - VRAM_BEGIN];
                     
                     let tile_index = if tile_data_base == 0x8800 {
                        ((tile_index_val as i8) as i16 + 256) as usize
                    } else {
                        tile_index_val as usize
                    };
                    
                    let pixel_value = self.tile_set[tile_index][pixel_y][pixel_x];
                    let color_bits = self.get_bg_color_bits(pixel_value);
                    self.buffer[y as usize * SCREEN_WIDTH + x] = self.get_color(color_bits);
                 }
             }
        }
    }

    fn get_bg_color_bits(&self, pixel_value: TilePixelValue) -> u8 {
         match pixel_value {
            TilePixelValue::Zero => (self.bgp >> 0) & 0x03,
            TilePixelValue::One => (self.bgp >> 2) & 0x03,
            TilePixelValue::Two => (self.bgp >> 4) & 0x03,
            TilePixelValue::Three => (self.bgp >> 6) & 0x03,
        }
    }
    
    fn get_color(&self, color_bits: u8) -> u32 {
         match color_bits {
            0 => 0x00E0F8D0,
            1 => 0x0088C070,
            2 => 0x00346856,
            3 => 0x00081820,
            _ => 0x00E0F8D0,
        }
    }





    fn render_sprites(&self, framebuffer: &mut Vec<u32>) {
        const SCREEN_WIDTH: usize = 160;
        const SCREEN_HEIGHT: usize = 144;
        
        let sprite_size_y = if self.lcdc & 0x04 != 0 { 16 } else { 8 };

        for i in 0..40 {
            let offset = i * 4;
            let y_pos = self.oam[offset] as i16 - 16;
            let x_pos = self.oam[offset + 1] as i16 - 8;
            let tile_index = self.oam[offset + 2];
            let attributes = self.oam[offset + 3];

            if y_pos <= 144 && y_pos + sprite_size_y > 0 { 
                 let palette = if attributes & 0x10 != 0 { self.obp1 } else { self.obp0 };
                 let x_flip = attributes & 0x20 != 0;
                 let y_flip = attributes & 0x40 != 0;
                 let bg_priority = attributes & 0x80 != 0; 
                 let t_index = if sprite_size_y == 16 { tile_index & 0xFE } else { tile_index } as usize;

                 for row in 0..sprite_size_y {
                     let screen_y = y_pos + row;
                     if screen_y < 0 || screen_y >= SCREEN_HEIGHT as i16 { continue; }
                     let tile_row = if y_flip { sprite_size_y - 1 - row } else { row };                   
                     let current_tile_index = if tile_row < 8 { t_index } else { t_index + 1 };
                     let current_tile_row = (tile_row % 8) as usize;
                     for col in 0..8 {
                         let screen_x = x_pos + col;
                         if screen_x < 0 || screen_x >= SCREEN_WIDTH as i16 { continue; }
                         let tile_col = if x_flip { 7 - col } else { col };
                         let pixel_val = self.tile_set[current_tile_index][current_tile_row][tile_col as usize];
                         if pixel_val == TilePixelValue::Zero { continue; } 
                         if bg_priority {
                             let current_color = framebuffer[(screen_y as usize) * SCREEN_WIDTH + (screen_x as usize)];
                             if current_color != 0x00E0F8D0 { continue; }
                         }
                         let color_bits = match pixel_val {
                             TilePixelValue::Zero => 0,
                             TilePixelValue::One => (palette >> 0) & 0x03,
                             // Palette logic: 
                             // Bits 0-1 for Color 0 (Transparent - unused)
                             // Bits 2-3 for Color 1
                             // Bits 4-5 for Color 2
                             // Bits 6-7 for Color 3
                             TilePixelValue::Two => (palette >> 2) & 0x03,
                             TilePixelValue::Three => (palette >> 4) & 0x03,
                         };

                         let color = match color_bits {
                             0 => 0x00E0F8D0,
                             1 => 0x0088C070,
                             2 => 0x00346856,
                             3 => 0x00081820,
                             _ => 0x00E0F8D0,
                         };
                         framebuffer[(screen_y as usize) * SCREEN_WIDTH + (screen_x as usize)] = color;
                     }
                 }
            }
        }
    }


}
