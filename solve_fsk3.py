#!/usr/bin/env python3
"""
FM Hunting CTF - 2-FSK Beacon Demodulator v3
Searching for ASIS{ flag
"""

import numpy as np
from scipy import signal
import struct

def load_iq_data(filename):
    """Load IQ data as int16 pairs"""
    with open(filename, 'rb') as f:
        raw_data = f.read()
    
    n_samples = len(raw_data) // 4
    int16_data = np.frombuffer(raw_data[:n_samples*4], dtype=np.int16)
    i_data = int16_data[0::2].astype(np.float32)
    q_data = int16_data[1::2].astype(np.float32)
    
    return i_data + 1j * q_data

def fm_demodulate(iq_data):
    """FM demodulation"""
    phase = np.angle(iq_data)
    phase_unwrapped = np.unwrap(phase)
    freq = np.diff(phase_unwrapped)
    return freq

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

def search_all_configs(demod, sample_rate=48000):
    """Try all configurations to find ASIS{"""
    
    # Baud rates to try
    baud_rates = [50, 75, 100, 150, 200, 300, 450, 600, 900, 1200, 1800, 2400, 4800, 9600]
    
    # Also try fractional baud rates
    for base in [300, 600, 1200, 2400]:
        for mult in [0.8, 0.9, 1.0, 1.1, 1.2]:
            br = int(base * mult)
            if br not in baud_rates:
                baud_rates.append(br)
    
    baud_rates = sorted(set(baud_rates))
    
    threshold = np.median(demod)
    
    found_flags = []
    
    for baud in baud_rates:
        sps = sample_rate / baud
        if sps < 1:
            continue
            
        # Try different offsets
        offsets_to_try = range(0, max(1, int(sps)), max(1, int(sps)//8))
        
        for offset in offsets_to_try:
            bits = []
            pos = offset + sps / 2
            
            while int(pos) < len(demod):
                sample = demod[int(pos)]
                bit = 1 if sample > threshold else 0
                bits.append(bit)
                pos += sps
            
            if len(bits) < 100:
                continue
            
            # Try all combinations
            for invert in [False, True]:
                test_bits = [1-b for b in bits] if invert else bits
                
                for msb_first in [True, False]:
                    data = bits_to_bytes(test_bits, msb_first=msb_first)
                    
                    # Search for ASIS
                    if b'ASIS' in data or b'asis' in data.lower():
                        idx = data.lower().find(b'asis')
                        context = data[max(0,idx-10):idx+100]
                        print(f"\n[!!!] FOUND ASIS at baud={baud}, offset={offset}, invert={invert}, msb={msb_first}")
                        print(f"[!!!] Context: {context}")
                        found_flags.append((baud, offset, invert, msb_first, data[idx:idx+100]))
                    
                    # Also try shifted by 1-7 bits
                    for shift in range(1, 8):
                        shifted_bits = test_bits[shift:]
                        if len(shifted_bits) > 100:
                            data_shifted = bits_to_bytes(shifted_bits, msb_first=msb_first)
                            if b'ASIS' in data_shifted or b'asis' in data_shifted.lower():
                                idx = data_shifted.lower().find(b'asis')
                                context = data_shifted[max(0,idx-10):idx+100]
                                print(f"\n[!!!] FOUND ASIS at baud={baud}, offset={offset}, shift={shift}, invert={invert}, msb={msb_first}")
                                print(f"[!!!] Context: {context}")
                                found_flags.append((baud, offset, invert, msb_first, data_shifted[idx:idx+100]))
    
    return found_flags

def main():
    sample_rate = 48000
    
    print("[*] Loading IQ data...")
    iq_data = load_iq_data('/tmp/iq_raw.bin')
    print(f"[*] Loaded {len(iq_data)} samples")
    
    print("\n[*] FM demodulating...")
    demod = fm_demodulate(iq_data)
    
    # Try with and without filtering
    print("\n[*] Searching without filter...")
    flags = search_all_configs(demod, sample_rate)
    
    if not flags:
        print("\n[*] Trying with low-pass filter...")
        nyq = sample_rate / 2
        for cutoff in [2000, 5000, 10000, 15000]:
            print(f"\n[*] Trying cutoff {cutoff} Hz...")
            b, a = signal.butter(4, cutoff/nyq, btype='low')
            demod_filtered = signal.filtfilt(b, a, demod)
            flags = search_all_configs(demod_filtered, sample_rate)
            if flags:
                break
    
    if not flags:
        # Maybe it's not FM but direct FSK
        print("\n[*] Trying direct frequency detection...")
        
        # Calculate instantaneous frequency differently
        # Using product of sample and conjugate of previous sample
        product = iq_data[1:] * np.conj(iq_data[:-1])
        freq = np.angle(product)
        
        print("[*] Searching with product frequency detection...")
        flags = search_all_configs(freq, sample_rate)
    
    if flags:
        print("\n" + "="*60)
        print("[+] FLAGS FOUND:")
        for f in flags:
            print(f"    {f}")
    else:
        print("\n[-] No ASIS flag found with standard methods")
        print("[*] Let's analyze the signal more carefully...")
        
        # Print some statistics
        print(f"\n[*] Demod signal stats:")
        print(f"    Shape: {demod.shape}")
        print(f"    Min: {demod.min():.6f}")
        print(f"    Max: {demod.max():.6f}")
        print(f"    Mean: {demod.mean():.6f}")
        
        # Save demodulated signal for external analysis
        np.save('/tmp/demod.npy', demod)
        print(f"[*] Saved demodulated signal to /tmp/demod.npy")

if __name__ == "__main__":
    main()
