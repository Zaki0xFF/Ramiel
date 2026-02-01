use clap::Parser;
use cpu::CPU;
use minifb::{Scale, Window, WindowOptions};
use std::io::{self, Write};
use std::path::PathBuf;
use std::sync::{Arc, Mutex};
use std::collections::VecDeque;
use cpal::traits::{DeviceTrait, HostTrait, StreamTrait};

mod cpu;
mod gpu;
mod apu;
mod instructions;
mod registers;
mod unit_tests;

#[derive(Debug, Parser)]
struct Args {
    #[clap(short, long)]
    /// Print debug info
    debug: bool,
    #[clap(short, long)]
    /// Execute one instruction at a time
    step: bool,
    /// Path to the ROM file
    #[clap(default_value = "roms/Kirby's Dream Land (USA, Europe).gb")]
    path: PathBuf,
}

fn wait_for_keypress() {
    print!("Press Enter to continue...");
    io::stdout().flush().unwrap();
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
}

fn main() {
    simple_logging::log_to_file("ramiel.log", log::LevelFilter::Info).unwrap();
    log::info!("Emulator Started");
    pub const SCREEN_WIDTH: usize = 160;
    pub const SCREEN_HEIGHT: usize = 144;

    let args = Args::parse();



    // Audio Setup
    let host = cpal::default_host();
    let device = host.default_output_device().expect("No audio output device available");
    let supported_config = device.default_output_config().expect("No default config");
    let sample_format = supported_config.sample_format();
    let config: cpal::StreamConfig = supported_config.into();
    let channels = config.channels;
    
    let mut cpu = CPU::_new_with_rom(&args.path, config.sample_rate.0).unwrap();
    cpu.debug_mode = args.debug;
    let scale_factor = Scale::X4;
    
    let audio_buffer = Arc::new(Mutex::new(VecDeque::<f32>::new()));
    let audio_buffer_clone = audio_buffer.clone();

    let err_fn = |err| eprintln!("Audio error: {}", err);
    
    let stream = match sample_format {
        cpal::SampleFormat::F32 => {
            let mut last_sample = 0.0;
            device.build_output_stream(
                &config,
                move |data: &mut [f32], _: &cpal::OutputCallbackInfo| {
                    let mut buffer = audio_buffer_clone.lock().unwrap();
                    for frame in data.chunks_mut(channels as usize) {
                        let sample = if let Some(s) = buffer.pop_front() {
                            last_sample = s;
                            s
                        } else {
                            last_sample
                        };
                        for out in frame.iter_mut() {
                            *out = sample;
                        }
                    }
                },
                err_fn,
                None,
            )
        },
        cpal::SampleFormat::I16 => {
            let mut last_sample = 0.0;
            device.build_output_stream(
                &config,
                move |data: &mut [i16], _: &cpal::OutputCallbackInfo| {
                    let mut buffer = audio_buffer_clone.lock().unwrap();
                    for frame in data.chunks_mut(channels as usize) {
                        let f32_sample = if let Some(s) = buffer.pop_front() {
                            last_sample = s;
                            s
                        } else {
                            last_sample
                        };
                        let sample = (f32_sample.clamp(-1.0, 1.0) * i16::MAX as f32) as i16;
                        for out in frame.iter_mut() {
                            *out = sample;
                        }
                    }
                },
                err_fn,
                None,
            )
        },
        cpal::SampleFormat::U16 => {
            let mut last_sample = 0.0;
            device.build_output_stream(
                &config,
                move |data: &mut [u16], _: &cpal::OutputCallbackInfo| {
                    let mut buffer = audio_buffer_clone.lock().unwrap();
                    for frame in data.chunks_mut(channels as usize) {
                        let f32_sample = if let Some(s) = buffer.pop_front() {
                            last_sample = s;
                            s
                        } else {
                            last_sample
                        };
                        let sample = ((f32_sample.clamp(-1.0, 1.0) * 0.5 + 0.5) * u16::MAX as f32) as u16;
                        for out in frame.iter_mut() {
                            *out = sample;
                        }
                    }
                },
                err_fn,
                None,
            )
        },
        _ => panic!("Unsupported sample format"),
    }.unwrap();

    stream.play().unwrap();

    let mut window = Window::new(
        "Game Boy Emulator",
        SCREEN_WIDTH,
        SCREEN_HEIGHT,
        WindowOptions {
            scale: scale_factor,
            ..WindowOptions::default()
        },
    )
    .unwrap();

    window.set_target_fps(60);
    while window.is_open() {
        if window.is_key_pressed(minifb::Key::Q, minifb::KeyRepeat::No) {
            cpu.debug_mode = !cpu.debug_mode;
            println!("Debug mode: {}", cpu.debug_mode);
        }

        let mut joypad_state = 0u8;
        if window.is_key_down(minifb::Key::Right) { joypad_state |= 0x01; }
        if window.is_key_down(minifb::Key::Left) { joypad_state |= 0x02; }
        if window.is_key_down(minifb::Key::Up) { joypad_state |= 0x04; }
        if window.is_key_down(minifb::Key::Down) { joypad_state |= 0x08; }
        if window.is_key_down(minifb::Key::Z) { joypad_state |= 0x10; } // A
        if window.is_key_down(minifb::Key::X) { joypad_state |= 0x20; } // B
        if window.is_key_down(minifb::Key::Backspace) { joypad_state |= 0x40; } // Select
        if window.is_key_down(minifb::Key::Enter) { joypad_state |= 0x80; } // Start

        // Simple interrupt request trigger if any button pressed
        let prev_state = cpu.bus.joypad_state;
        cpu.bus.joypad_state = joypad_state;

        if joypad_state != 0 && joypad_state != prev_state {
             cpu.bus.memory[0xFF0F] |= 0x10; 
        }

        if args.step {
            // In step mode, execute one instruction and wait for key press
            cpu.step();
            let framebuffer = cpu.bus.gpu.render_screen();
            window
                .update_with_buffer(&framebuffer, SCREEN_WIDTH, SCREEN_HEIGHT)
                .unwrap();

            if !window.is_open() {
                break;
            }
            wait_for_keypress();
        } else {
            // Normal mode - run at full speed
            // Sync with VBlank
            let mut frame_complete = false;
            while !frame_complete {
                let prev_ly = cpu.bus.gpu.ly;
                cpu.step();
                let current_ly = cpu.bus.gpu.ly;

                // Detect rising edge of VBlank (transition to line 144)
                if prev_ly != 144 && current_ly == 144 {
                    frame_complete = true;
                }
            }

            {
                let mut buffer = audio_buffer.lock().unwrap();
                buffer.extend(cpu.bus.apu.buffer.drain(..));
                
                let max_buffer_size = config.sample_rate.0 as usize / 2;
                if buffer.len() > max_buffer_size {
                    let excess = buffer.len() - max_buffer_size;
                    buffer.drain(0..excess);
                }
            }

            let framebuffer = cpu.bus.gpu.render_screen();
            window
                .update_with_buffer(&framebuffer, SCREEN_WIDTH, SCREEN_HEIGHT)
                .unwrap();
        }
    }
}
