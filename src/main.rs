pub mod cpu;
pub mod gpu;
pub mod instructions;
pub mod registers;
mod unit_tests;
use cpu::CPU;
use log::info;
use log::LevelFilter;
use minifb::{Scale, Window, WindowOptions};
use std::path::Path;
use std::sync::mpsc::{self};
use std::sync::{Arc, Mutex};
use std::thread::{self};
use std::time::Duration;

fn test_render(){
    const SCREEN_WIDTH: usize = 160;
    const SCREEN_HEIGHT: usize = 144;

    let (log_sender, _) = mpsc::channel();
    let path = Path::new("./roms/dmg_boot.bin");
    let mut cpu = CPU::new_with_rom(path, log_sender).unwrap();
    
    // Clear VRAM
    for i in 0..0x2000 {  // 8KB VRAM
        cpu.bus.write_byte(0x8000 + i, 0);
    }

    /* Addr_00A8:
	;Nintendo Logo
	.DB $CE,$ED,$66,$66,$CC,$0D,$00,$0B,$03,$73,$00,$83,$00,$0C,$00,$0D 
	.DB $00,$08,$11,$1F,$88,$89,$00,$0E,$DC,$CC,$6E,$E6,$DD,$DD,$D9,$99 
	.DB $BB,$BB,$67,$63,$6E,$0E,$EC,$CC,$DD,$DC,$99,$9F,$BB,$B9,$33,$3E 
    (*/
    let nintendo_logo_pattern = [
        0xC6, 0xC0, 0x00, 0x00, 0x01, 0x80,
        0xE6, 0xC0, 0x30, 0x00, 0x01, 0x80,
        0xE6, 0x00, 0x78, 0x00, 0x01, 0x80,
        0xD6, 0xDB, 0x33, 0xCD, 0x8F, 0x9E,
        0xD6, 0xDD, 0xB6, 0x6E, 0xD9, 0xB3,
        0xCE, 0xD9, 0xB7, 0xEC, 0xD9, 0xB3,
        0xCE, 0xD9, 0xB6, 0x0C, 0xD9, 0xB3, 
        0xC6, 0xD9, 0xB3, 0xEC, 0xCF, 0x9E,
    ];

    // Store this pattern in VRAM as tiles
    // Each row is 6 bytes (48 bits), which we need to split into 6 tiles (8 bits each)
    // Total: 6 tiles wide by 8 pixels high

    // First, clear all tiles we're going to use
    for tile in 1..=6 {
        for i in 0..16 {
            cpu.bus.write_byte(0x8000 + (tile * 16 + i) as u16, 0);
        }
    }

    // Now write the logo data to tiles
    for row in 0..8 {  // 8 rows
        for col in 0..6 {  // 6 bytes per row
            // Get the byte for this 8-pixel segment
            let byte = nintendo_logo_pattern[row * 6 + col];
            
            // Calculate which tile this belongs to
            let tile_index = col + 1;  // Start at tile 1
            
            // Calculate the address in VRAM for this tile's row
            let addr = 0x8000 + (tile_index as u16 * 16) + (row as u16 * 2);
            
            // For Game Boy's 2bpp format, we need both bytes to be the same
            // to get proper black (11) and white (00)
            cpu.bus.write_byte(addr, byte);     // Bit 0 of color
            cpu.bus.write_byte(addr + 1, byte); // Bit 1 of color
        }
    }
    
    // Set up the tilemap to show our Nintendo logo
    // We'll place it in the center of the screen
    let map_y = 8;  // Row in tilemap
    let map_x = 7;  // Starting column - centered better
    
    // Map the 6 tiles of the logo
    for i in 0..6 {
        let map_addr = 0x9800 + ((map_y * 32) + map_x + i) as u16;
        cpu.bus.write_byte(map_addr, (i + 1) as u8);
    }
    
    // Setup GPU registers
    cpu.bus.write_byte(0xFF40, 0x91);  // LCDC - LCD on, BG on
    cpu.bus.write_byte(0xFF42, 64);    // SCY - Position vertically
    cpu.bus.write_byte(0xFF43, 0);     // SCX - No horizontal scroll
    cpu.bus.write_byte(0xFF47, 0xE4);  // BGP - Classic Game Boy palette
    
    // Create a window for display
    let mut window = Window::new(
        "Nintendo Logo - Direct Binary",
        SCREEN_WIDTH,
        SCREEN_HEIGHT,
        WindowOptions {
            scale: Scale::X4,
            ..WindowOptions::default()
        },
    ).unwrap();
    
    println!("Displaying Nintendo logo using direct binary pattern");
    
    // Main rendering loop with simple animation
    let mut current_scy = 144;  // Start off-screen
    let target_scy = 50;        // End at middle of screen
    
    while window.is_open() && !window.is_key_down(minifb::Key::Escape) {
        // Scroll in the logo
        if current_scy > target_scy {
            current_scy -= 1;
            cpu.bus.write_byte(0xFF42, current_scy);
        }
        
        // Render frame
        let framebuffer = cpu.bus.gpu.render_screen();
        window.update_with_buffer(&framebuffer, SCREEN_WIDTH, SCREEN_HEIGHT)
            .unwrap();
        
        // Slow down animation
        thread::sleep(Duration::from_millis(30));
    }
}

fn main() {
    pub const SCREEN_WIDTH: usize = 160;
    pub const SCREEN_HEIGHT: usize = 144;

    env_logger::builder().filter_level(LevelFilter::Info).init();
    let (log_sender, log_receiver) = mpsc::channel();
    let path = Path::new("./roms/dmg_boot.bin");
    let cpu_state = Arc::new(Mutex::new(CPU::new_with_rom(path, log_sender).unwrap()));
    let render_cpu = Arc::clone(&cpu_state);
    let scale_factor = Scale::X4;

    let mut window = Window::new(
        "Game Boy Emulator",
        160,
        144,
        WindowOptions {
            scale: scale_factor,
            ..WindowOptions::default()
        },
    )
    .unwrap_or_else(|e| {
        panic!("{}", e);
    });

    thread::scope(move |s| {
        s.spawn(move || loop {
            let mut cpu = cpu_state.lock().unwrap();
            cpu.step();
            drop(cpu);
            std::thread::sleep(Duration::from_nanos(20));
        });
        s.spawn(move || {
            while let Ok(log_message) = log_receiver.recv() {
                info!("{}", log_message);
            }
            std::thread::sleep(Duration::from_secs(1));
        });
        while window.is_open() {
            let mut state = render_cpu.lock().unwrap();
            let framebuffer = state.bus.gpu.render_screen();
            drop(state);
            window
                .update_with_buffer(&framebuffer, SCREEN_WIDTH, SCREEN_HEIGHT)
                .unwrap();
            thread::sleep(Duration::from_millis(16));
        }
    });
}
