#!/usr/bin/env python3
"""
FM Hunting CTF - 2-FSK Beacon Demodulator
Connects to server, captures IQ data at 48kHz, demodulates 2-FSK
"""

import socket
import numpy as np
from scipy import signal
import struct
import sys

def capture_iq_data(host, port, duration_seconds=10):
    """Capture raw IQ data from the server"""
    sample_rate = 48000
    # IQ data is typically complex float32 (8 bytes per sample) or int16 pairs (4 bytes)
    # Let's capture enough data
    
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(15)
    
    try:
        print(f"[*] Connecting to {host}:{port}...")
        sock.connect((host, port))
        print("[*] Connected! Capturing data...")
        
        data = b''
        target_bytes = sample_rate * duration_seconds * 4  # Assume 2 bytes I + 2 bytes Q per sample
        
        while len(data) < target_bytes:
            chunk = sock.recv(65536)
            if not chunk:
                break
            data += chunk
            if len(data) % 100000 < 65536:
                print(f"[*] Captured {len(data)} bytes...")
        
        print(f"[+] Total captured: {len(data)} bytes")
        return data
        
    finally:
        sock.close()

def analyze_data_format(data):
    """Try to determine the data format"""
    print(f"\n[*] Analyzing data format...")
    print(f"[*] First 64 bytes (hex): {data[:64].hex()}")
    print(f"[*] Data length: {len(data)} bytes")
    
    # Try different interpretations
    # 1. Complex float32 (8 bytes per sample)
    try:
        n_samples = len(data) // 8
        complex_f32 = np.frombuffer(data[:n_samples*8], dtype=np.complex64)
        print(f"[*] As complex64: {n_samples} samples, range: {complex_f32.real.min():.4f} to {complex_f32.real.max():.4f}")
    except:
        pass
    
    # 2. Int16 IQ pairs (4 bytes per sample)
    try:
        n_samples = len(data) // 4
        int16_data = np.frombuffer(data[:n_samples*4], dtype=np.int16)
        i_data = int16_data[0::2]
        q_data = int16_data[1::2]
        print(f"[*] As int16 IQ: {n_samples} samples, I range: {i_data.min()} to {i_data.max()}, Q range: {q_data.min()} to {q_data.max()}")
    except:
        pass
    
    # 3. Float32 IQ pairs (8 bytes per sample)
    try:
        n_samples = len(data) // 8
        float32_data = np.frombuffer(data[:n_samples*8], dtype=np.float32)
        i_data = float32_data[0::2]
        q_data = float32_data[1::2]
        print(f"[*] As float32 IQ: {n_samples} samples, I range: {i_data.min():.4f} to {i_data.max():.4f}")
    except:
        pass
    
    # 4. Unsigned int8 pairs (2 bytes per sample) - common for RTL-SDR
    try:
        n_samples = len(data) // 2
        uint8_data = np.frombuffer(data[:n_samples*2], dtype=np.uint8)
        i_data = uint8_data[0::2].astype(np.float32) - 127.5
        q_data = uint8_data[1::2].astype(np.float32) - 127.5
        print(f"[*] As uint8 IQ (RTL-SDR style): {n_samples} samples, I range: {i_data.min():.1f} to {i_data.max():.1f}")
    except:
        pass

def parse_iq_data(data, format_type='int16'):
    """Parse IQ data into complex samples"""
    if format_type == 'int16':
        n_samples = len(data) // 4
        int16_data = np.frombuffer(data[:n_samples*4], dtype=np.int16)
        i_data = int16_data[0::2].astype(np.float32)
        q_data = int16_data[1::2].astype(np.float32)
        return i_data + 1j * q_data
    elif format_type == 'uint8':
        n_samples = len(data) // 2
        uint8_data = np.frombuffer(data[:n_samples*2], dtype=np.uint8)
        i_data = uint8_data[0::2].astype(np.float32) - 127.5
        q_data = uint8_data[1::2].astype(np.float32) - 127.5
        return i_data + 1j * q_data
    elif format_type == 'float32':
        n_samples = len(data) // 8
        float32_data = np.frombuffer(data[:n_samples*8], dtype=np.float32)
        i_data = float32_data[0::2]
        q_data = float32_data[1::2]
        return i_data + 1j * q_data
    elif format_type == 'complex64':
        n_samples = len(data) // 8
        return np.frombuffer(data[:n_samples*8], dtype=np.complex64)

def fm_demodulate(iq_data, sample_rate=48000):
    """FM demodulation using differentiation of phase"""
    # Calculate instantaneous phase
    phase = np.angle(iq_data)
    
    # Unwrap phase to avoid discontinuities
    phase_unwrapped = np.unwrap(phase)
    
    # Differentiate to get frequency
    freq = np.diff(phase_unwrapped)
    
    # Normalize
    freq = freq / np.pi
    
    return freq

def decode_2fsk(demod_signal, sample_rate=48000, baud_rate=None):
    """Decode 2-FSK signal to bits"""
    
    # Try to detect the baud rate by looking at transitions
    # First, convert to binary based on threshold
    threshold = np.median(demod_signal)
    binary_signal = (demod_signal > threshold).astype(int)
    
    # Find transitions
    transitions = np.where(np.diff(binary_signal) != 0)[0]
    
    if len(transitions) > 10:
        # Calculate average samples between transitions
        intervals = np.diff(transitions)
        common_interval = np.median(intervals)
        estimated_baud = sample_rate / common_interval
        print(f"[*] Estimated baud rate: {estimated_baud:.1f} baud")
        print(f"[*] Samples per symbol: {common_interval:.1f}")
        
        if baud_rate is None:
            # Use a common baud rate close to estimated
            common_rates = [300, 600, 1200, 2400, 4800, 9600, 19200]
            baud_rate = min(common_rates, key=lambda x: abs(x - estimated_baud))
            print(f"[*] Using baud rate: {baud_rate}")
    
    if baud_rate is None:
        baud_rate = 1200  # Default
    
    samples_per_bit = sample_rate / baud_rate
    
    # Sample at the middle of each bit
    bits = []
    pos = samples_per_bit / 2
    
    while int(pos) < len(binary_signal):
        bit = binary_signal[int(pos)]
        bits.append(bit)
        pos += samples_per_bit
    
    return bits, baud_rate

def bits_to_bytes(bits, msb_first=True):
    """Convert bits to bytes"""
    bytes_out = []
    for i in range(0, len(bits) - 7, 8):
        byte_bits = bits[i:i+8]
        if msb_first:
            byte_val = sum(b << (7 - j) for j, b in enumerate(byte_bits))
        else:
            byte_val = sum(b << j for j, b in enumerate(byte_bits))
        bytes_out.append(byte_val)
    return bytes(bytes_out)

def try_decode_message(bits):
    """Try different decoding approaches"""
    print(f"\n[*] Total bits: {len(bits)}")
    print(f"[*] First 100 bits: {''.join(map(str, bits[:100]))}")
    
    # Try MSB first
    msg_msb = bits_to_bytes(bits, msb_first=True)
    print(f"\n[*] MSB first (raw): {msg_msb[:100]}")
    try:
        decoded_msb = msg_msb.decode('ascii', errors='ignore')
        printable_msb = ''.join(c if 32 <= ord(c) < 127 else '.' for c in decoded_msb)
        print(f"[*] MSB first (ASCII): {printable_msb[:200]}")
    except:
        pass
    
    # Try LSB first
    msg_lsb = bits_to_bytes(bits, msb_first=False)
    print(f"\n[*] LSB first (raw): {msg_lsb[:100]}")
    try:
        decoded_lsb = msg_lsb.decode('ascii', errors='ignore')
        printable_lsb = ''.join(c if 32 <= ord(c) < 127 else '.' for c in decoded_lsb)
        print(f"[*] LSB first (ASCII): {printable_lsb[:200]}")
    except:
        pass
    
    # Try inverted bits
    inverted_bits = [1 - b for b in bits]
    msg_inv_msb = bits_to_bytes(inverted_bits, msb_first=True)
    try:
        decoded_inv = msg_inv_msb.decode('ascii', errors='ignore')
        printable_inv = ''.join(c if 32 <= ord(c) < 127 else '.' for c in decoded_inv)
        print(f"[*] Inverted MSB (ASCII): {printable_inv[:200]}")
    except:
        pass
    
    msg_inv_lsb = bits_to_bytes(inverted_bits, msb_first=False)
    try:
        decoded_inv_lsb = msg_inv_lsb.decode('ascii', errors='ignore')
        printable_inv_lsb = ''.join(c if 32 <= ord(c) < 127 else '.' for c in decoded_inv_lsb)
        print(f"[*] Inverted LSB (ASCII): {printable_inv_lsb[:200]}")
    except:
        pass
    
    return msg_msb, msg_lsb

def main():
    host = "65.109.194.34"
    port = 7356
    
    # Capture data
    raw_data = capture_iq_data(host, port, duration_seconds=15)
    
    if len(raw_data) < 1000:
        print("[-] Not enough data captured!")
        return
    
    # Save raw data for analysis
    with open('/tmp/iq_raw.bin', 'wb') as f:
        f.write(raw_data)
    print(f"[+] Saved raw data to /tmp/iq_raw.bin")
    
    # Analyze format
    analyze_data_format(raw_data)
    
    # Try different data formats
    for fmt in ['int16', 'uint8', 'float32', 'complex64']:
        print(f"\n{'='*60}")
        print(f"[*] Trying format: {fmt}")
        print('='*60)
        
        try:
            iq_data = parse_iq_data(raw_data, fmt)
            print(f"[*] Parsed {len(iq_data)} samples")
            
            # FM demodulate
            demod = fm_demodulate(iq_data)
            print(f"[*] Demodulated signal range: {demod.min():.4f} to {demod.max():.4f}")
            
            # Decode FSK
            bits, baud = decode_2fsk(demod)
            
            # Try to decode
            try_decode_message(bits)
            
        except Exception as e:
            print(f"[-] Error with format {fmt}: {e}")
            import traceback
            traceback.print_exc()

if __name__ == "__main__":
    main()
