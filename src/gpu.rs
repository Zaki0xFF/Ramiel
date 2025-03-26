#![allow(unused_variables)]
use std::fs::OpenOptions;
use std::io::Write;

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
}

impl GPU {
    pub fn step(&mut self, cycles: u16) -> u8 {
        self.mode_clock += cycles;

        // Each scanline takes ~456 cycles
        if self.mode_clock >= 456 {
            self.mode_clock -= 456;

            // Move to next scanline
            self.ly = (self.ly + 1) % 154;

            // Return LY so CPU can update memory
            return self.ly;
        }

        // No update
        return self.ly;
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

    pub fn render_screen(&mut self) -> Vec<u32> {
        const SCREEN_WIDTH: usize = 160;
        const SCREEN_HEIGHT: usize = 144;

        let mut framebuffer = vec![0u32; SCREEN_WIDTH * SCREEN_HEIGHT];

        if self.lcdc & 0x80 == 0 {
            return framebuffer;
        }

        if self.scy == 0 {
            self.dump_vram().unwrap();
        };

        for y in 0..SCREEN_HEIGHT {
            for x in 0..SCREEN_WIDTH {
                // Apply scroll values with wrapping
                let scrolled_y = (y + self.scy as usize) & 0xFF;

                let tile_x = x / 8;
                let tile_y = scrolled_y / 8;
                let pixel_x = x % 8;
                let pixel_y = scrolled_y % 8;

                // Updated Nintendo logo rendering logic with better horizontal centering
                let logo_width = 12; // Width in tiles
                let screen_width_tiles = 20; // Screen width in tiles (160/8)
                let center_x = (screen_width_tiles - logo_width) / 2; // Center point = 4

                let tile_index = if tile_y >= 8
                    && tile_y < 10
                    && tile_x >= center_x
                    && tile_x < center_x + logo_width
                {
                    let row = tile_y - 8;
                    let col = tile_x - center_x;

                    1 + row * 12 + col
                } else if tile_y == 9 && tile_x == center_x + logo_width {
                    // Registered trademark symbol - position right after the logo
                    25
                } else {
                    0
                };

                if tile_index < self.tile_set.len() {
                    let pixel_value = self.tile_set[tile_index][pixel_y][pixel_x];

                    let color = match pixel_value {
                        TilePixelValue::Zero => 0xFFFFFFFF,  // White
                        TilePixelValue::One => 0xAAAAAAFF,   // Light gray
                        TilePixelValue::Two => 0x555555FF,   // Dark gray
                        TilePixelValue::Three => 0x000000FF, // Black
                    };

                    framebuffer[y * SCREEN_WIDTH + x] = color;
                }
            }
        }

        framebuffer
    }

    pub fn dump_vram(&self) -> std::io::Result<()> {
        let mut file = OpenOptions::new()
            .create(true)
            .write(true)
            .truncate(true)
            .open("vram_dump.txt")?;

        writeln!(file, "Nintendo Logo VRAM Dump (tiles 1-25):")?;
        writeln!(file, "Total logo tiles: 25")?;
        writeln!(file)?;

        // Only dump tiles 1-25 which contain the Nintendo logo
        for tile in 1..=25 {
            writeln!(file, "Tile {} (0x{:04X}):", tile, 0x8000 + tile * 16)?;
            for row in 0..8 {
                let offset = tile * 16 + row * 2;
                let byte1 = self.vram[offset];
                let byte2 = self.vram[offset + 1];
                let binary1: String = format!("{:08b}", byte1).chars().map(|c| if c == '1' { '#' } else { '.' }).collect();
                let binary2: String = format!("{:08b}", byte2).chars().map(|c| if c == '1' { '#' } else { '.' }).collect();
                writeln!(file, "  Row {}: {:#02X} {:#02X}  {} {}", 
                    row,
                    byte1,
                    byte2,
                    binary1,
                    binary2)?;
            }
            writeln!(file)?;
        }

        Ok(())
    }
}
