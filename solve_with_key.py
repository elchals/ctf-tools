#!/usr/bin/env python3
"""
FM Hunting CTF - Demodulate and decrypt with key "0lymp1c"
"""

import numpy as np
from scipy import signal

def load_iq_data(filename):
    """Load IQ data"""
    with open(filename, 'rb') as f:
        raw_data = f.read()
    
    # Try as int16 IQ pairs
    n_samples = len(raw_data) // 4
    int16_data = np.frombuffer(raw_data[:n_samples*4], dtype=np.int16)
    i_data = int16_data[0::2].astype(np.float32)
    q_data = int16_data[1::2].astype(np.float32)
    
    return i_data + 1j * q_data, raw_data

def xor_decrypt(data, key):
    """XOR decrypt data with key"""
    key_bytes = key.encode() if isinstance(key, str) else key
    result = bytearray()
    for i, b in enumerate(data):
        result.append(b ^ key_bytes[i % len(key_bytes)])
    return bytes(result)

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

def fm_demodulate(iq_data):
    """FM demodulation"""
    phase = np.angle(iq_data)
    phase_unwrapped = np.unwrap(phase)
    freq = np.diff(phase_unwrapped)
    return freq

def try_all_decodes(demod, sample_rate, key):
    """Try all combinations of baud rate, offset, inversion, and bit order"""
    
    baud_rates = [50, 75, 100, 110, 150, 200, 300, 450, 600, 900, 1200, 2400, 4800]
    
    threshold = np.median(demod)
    
    found = []
    
    for baud in baud_rates:
        sps = sample_rate / baud
        if sps < 1:
            continue
        
        for offset in range(0, int(sps), max(1, int(sps)//4)):
            bits = []
            pos = offset + sps / 2
            
            while int(pos) < len(demod):
                sample = demod[int(pos)]
                bit = 1 if sample > threshold else 0
                bits.append(bit)
                pos += sps
            
            if len(bits) < 100:
                continue
            
            for invert in [False, True]:
                test_bits = [1-b for b in bits] if invert else bits
                
                for msb in [True, False]:
                    data = bits_to_bytes(test_bits, msb_first=msb)
                    
                    # Try XOR decrypt
                    decrypted = xor_decrypt(data, key)
                    
                    # Check for ASIS
                    if b'ASIS' in decrypted:
                        idx = decrypted.find(b'ASIS')
                        end_idx = decrypted.find(b'}', idx)
                        if end_idx != -1:
                            flag = decrypted[idx:end_idx+1]
                            print(f"\n[!!!] FOUND FLAG!")
                            print(f"    Baud: {baud}, Offset: {offset}")
                            print(f"    Invert: {invert}, MSB: {msb}")
                            print(f"    FLAG: {flag.decode('ascii', errors='ignore')}")
                            found.append(flag)
                    
                    # Also check raw data (maybe not encrypted)
                    if b'ASIS' in data:
                        idx = data.find(b'ASIS')
                        end_idx = data.find(b'}', idx)
                        if end_idx != -1:
                            flag = data[idx:end_idx+1]
                            print(f"\n[!!!] FOUND FLAG (raw)!")
                            print(f"    FLAG: {flag.decode('ascii', errors='ignore')}")
                            found.append(flag)
                    
                    # Try bit-shifted versions
                    for shift in range(1, 8):
                        shifted_bits = test_bits[shift:]
                        if len(shifted_bits) > 100:
                            data_shifted = bits_to_bytes(shifted_bits, msb_first=msb)
                            decrypted_shifted = xor_decrypt(data_shifted, key)
                            
                            if b'ASIS' in decrypted_shifted:
                                idx = decrypted_shifted.find(b'ASIS')
                                end_idx = decrypted_shifted.find(b'}', idx)
                                if end_idx != -1:
                                    flag = decrypted_shifted[idx:end_idx+1]
                                    print(f"\n[!!!] FOUND FLAG (shifted {shift})!")
                                    print(f"    FLAG: {flag.decode('ascii', errors='ignore')}")
                                    found.append(flag)
    
    return found

def main():
    sample_rate = 48000
    key = "0lymp1c"
    
    print(f"[*] Using key: {key}")
    print("[*] Loading IQ data...")
    
    iq_data, raw_data = load_iq_data('/tmp/iq_raw.bin')
    print(f"[*] Loaded {len(iq_data)} IQ samples")
    
    # First, try XOR on raw data directly
    print("\n[*] Trying XOR on raw data directly...")
    decrypted_raw = xor_decrypt(raw_data, key)
    if b'ASIS' in decrypted_raw:
        idx = decrypted_raw.find(b'ASIS')
        print(f"[!!!] Found in raw XOR: {decrypted_raw[idx:idx+100]}")
    
    # FM demodulate
    print("\n[*] FM demodulating...")
    demod = fm_demodulate(iq_data)
    
    # Try without filter
    print("\n[*] Trying without filter...")
    found = try_all_decodes(demod, sample_rate, key)
    
    if not found:
        # Try with low-pass filter
        print("\n[*] Trying with low-pass filter...")
        nyq = sample_rate / 2
        for cutoff in [1000, 2000, 5000, 10000]:
            print(f"    Cutoff: {cutoff} Hz")
            b, a = signal.butter(4, cutoff/nyq, btype='low')
            demod_filtered = signal.filtfilt(b, a, demod)
            found = try_all_decodes(demod_filtered, sample_rate, key)
            if found:
                break
    
    if not found:
        # Maybe data is mono int16 audio, not IQ
        print("\n[*] Trying as mono int16 audio...")
        mono_data = np.frombuffer(raw_data, dtype=np.int16).astype(np.float32)
        
        # Use Hilbert transform for FM demod
        from scipy.signal import hilbert
        analytic = hilbert(mono_data)
        phase = np.angle(analytic)
        phase_unwrapped = np.unwrap(phase)
        freq = np.diff(phase_unwrapped)
        
        found = try_all_decodes(freq, sample_rate, key)
    
    if not found:
        print("\n[-] No flag found yet, trying more approaches...")
        
        # Try treating I and Q separately as mono audio
        int16_data = np.frombuffer(raw_data, dtype=np.int16)
        i_only = int16_data[0::2].astype(np.float32)
        q_only = int16_data[1::2].astype(np.float32)
        
        for name, data in [("I only", i_only), ("Q only", q_only)]:
            print(f"\n[*] Trying {name}...")
            from scipy.signal import hilbert
            analytic = hilbert(data)
            phase = np.angle(analytic)
            phase_unwrapped = np.unwrap(phase)
            freq = np.diff(phase_unwrapped)
            found = try_all_decodes(freq, sample_rate, key)
            if found:
                break
    
    if found:
        print("\n" + "="*60)
        print("[+] SUCCESS! Found flag(s):")
        for f in found:
            print(f"    {f}")
    else:
        print("\n[-] Flag not found with current methods")

if __name__ == "__main__":
    main()
