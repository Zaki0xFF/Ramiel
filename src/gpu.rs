#![allow(unused_variables)]
pub const VRAM_BEGIN: usize = 0x8000;
pub const VRAM_END: usize = 0x9FFF;
pub const VRAM_SIZE: usize = VRAM_END - VRAM_BEGIN + 1;

#[derive(Copy, Clone)]
enum TilePixelValue {
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
}

impl GPU {
    pub fn new() -> Self {
        GPU {
            vram: [0; VRAM_SIZE],
            tile_set: [empty_tile(); 384],
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
        let mut framebuffer = vec![0u32; 160 * 144];

        for y in 0..144 {
            for x in 0..160 {
                let tile_x = x / 8;
                let tile_y = y / 8;
                let pixel_x = x % 8;
                let pixel_y = y % 8;

                let tile_index = tile_y * 20 + tile_x;
                let pixel_value = self.tile_set[tile_index][pixel_y][pixel_x];

                let color = match pixel_value {
                    TilePixelValue::Zero => 0xFFFFFFFF,  // White
                    TilePixelValue::One => 0xAAAAAAFF,   // Light gray
                    TilePixelValue::Two => 0x555555FF,   // Dark gray
                    TilePixelValue::Three => 0x000000FF, // Black
                };

                framebuffer[y * 160 + x] = color;
            }
        }
        framebuffer
    }
}
