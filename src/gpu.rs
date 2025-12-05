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
    pub fn step(&mut self, cycles: u16) -> (bool, bool) {
        self.mode_clock += cycles;
        let mut vblank = false;
        let stat = false;

        // Each scanline takes ~456 cycles
        if self.mode_clock >= 456 {
            self.mode_clock -= 456;

            // Move to next scanline
            self.ly = (self.ly + 1) % 154;

            if self.ly == 144 {
                vblank = true;
            }
        }
        (vblank, stat)
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
            // Return a white screen when LCD is disabled
            return vec![0xFFFFFFFF; SCREEN_WIDTH * SCREEN_HEIGHT];
        }

        let tilemap_base = if self.lcdc & 0x08 != 0 {
            0x9C00
        } else {
            0x9800
        };

        //self.render_tileset(&mut framebuffer);
        self.render_tilemap(&mut framebuffer, tilemap_base);

        framebuffer
    }

    pub fn render_tilemap(&mut self, framebuffer: &mut Vec<u32>, tilemap_base: usize) {
        const SCREEN_WIDTH: usize = 160;
        const SCREEN_HEIGHT: usize = 144;

        for y in 0..SCREEN_HEIGHT {
            for x in 0..SCREEN_WIDTH {
                let scrolled_x = x; // hardcoded for now unexpected behaviour writes to scx 0x46
                let scrolled_y = (y + self.scy as usize) % 256;

                let tile_x = scrolled_x / 8;
                let tile_y = scrolled_y / 8;

                let tilemap_index = tilemap_base + (tile_y * 32) + tile_x;
                let tile_index_val = self.vram[tilemap_index - VRAM_BEGIN];
                let tile_data_base = if self.lcdc & 0x10 != 0 {
                    0x8000
                } else {
                    0x8800
                };

                // Handle signed tile indices if using 0x8800-0x97FF
                let tile_index = if tile_data_base == 0x8800 {
                    ((tile_index_val as i8) as i16 + 128) as usize
                } else {
                    tile_index_val as usize
                };

                // Fetch the pixel data from the tile
                let pixel_x = scrolled_x % 8;
                let pixel_y = scrolled_y % 8;
                let pixel_value = self.tile_set[tile_index][pixel_y][pixel_x];

                // Map the pixel value to a color
                let color = match pixel_value {
                    TilePixelValue::Zero => 0xFFFFFFFF,  // White
                    TilePixelValue::One => 0xAAAAAAFF,   // Light gray
                    TilePixelValue::Two => 0x555555FF,   // Dark gray
                    TilePixelValue::Three => 0x000000FF, // Black
                };

                // Write the color to the framebuffer
                framebuffer[y * SCREEN_WIDTH + x] = color;
            }
        }
    }

    pub fn _render_tileset(&mut self, framebuffer: &mut Vec<u32>) {
        const SCREEN_WIDTH: usize = 160;
        const SCREEN_HEIGHT: usize = 144;

        for y in 0..SCREEN_HEIGHT {
            for x in 0..SCREEN_WIDTH {
                // Apply scroll values with wrapping
                let scrolled_y = (y + self.scy as usize) & 0xFF;

                let tile_x = x / 8;
                let tile_y = scrolled_y / 8;
                let pixel_x = x % 8;
                let pixel_y = scrolled_y % 8;

                let tile_index = tile_y * 20 + tile_x;
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
    }

    pub fn dump_vram(&self) -> std::io::Result<()> {
        let file_path = "vram_dump.txt";
        // Check if the file exists and is not empty
        if let Ok(metadata) = std::fs::metadata(file_path) {
            if metadata.len() > 0 {
                // File is not empty, skip dumping
                return Ok(());
            }
        }
        let mut file = OpenOptions::new()
            .create(true)
            .write(true)
            .truncate(true)
            .open("vram_dump.txt")?;

        writeln!(file, "VRAM Dump (0x8000-0x9FFF):")?;

        for (i, byte) in self.vram.iter().enumerate() {
            // Write the address at the start of each row
            if i % 16 == 0 {
                write!(file, "0x{:04X}: ", VRAM_BEGIN + i)?;
            }

            // Write the byte in hexadecimal format
            write!(file, "{:02X} ", byte)?;

            // Add a newline after every 16 bytes
            if i % 16 == 15 {
                writeln!(file)?;
            }
        }

        Ok(())
    }
}
