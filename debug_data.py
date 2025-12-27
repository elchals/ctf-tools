#!/usr/bin/env python3
"""
Debug the raw data format
"""

import numpy as np

def main():
    with open('/tmp/iq_raw.bin', 'rb') as f:
        raw_data = f.read()
    
    print(f"[*] Total bytes: {len(raw_data)}")
    print(f"[*] First 100 bytes hex: {raw_data[:100].hex()}")
    
    # Try different interpretations
    print("\n" + "="*60)
    print("[*] Trying as signed 16-bit little endian (pairs)")
    int16_le = np.frombuffer(raw_data[:1000], dtype='<i2')
    print(f"    Values: {int16_le[:20]}")
    print(f"    Range: {int16_le.min()} to {int16_le.max()}")
    
    print("\n" + "="*60)
    print("[*] Trying as signed 16-bit big endian (pairs)")
    int16_be = np.frombuffer(raw_data[:1000], dtype='>i2')
    print(f"    Values: {int16_be[:20]}")
    print(f"    Range: {int16_be.min()} to {int16_be.max()}")
    
    print("\n" + "="*60)
    print("[*] Trying as unsigned 8-bit")
    uint8 = np.frombuffer(raw_data[:1000], dtype=np.uint8)
    print(f"    Values: {uint8[:40]}")
    print(f"    Range: {uint8.min()} to {uint8.max()}")
    
    print("\n" + "="*60)
    print("[*] Trying as float32 little endian")
    float32_le = np.frombuffer(raw_data[:1000], dtype='<f4')
    print(f"    Values: {float32_le[:10]}")
    print(f"    Range: {float32_le.min()} to {float32_le.max()}")
    
    print("\n" + "="*60)
    print("[*] Trying as single int16 channel (mono audio)")
    int16_mono = np.frombuffer(raw_data, dtype='<i2')
    print(f"    Total samples: {len(int16_mono)}")
    print(f"    Duration at 48kHz: {len(int16_mono)/48000:.2f} seconds")
    print(f"    Values: {int16_mono[:20]}")
    print(f"    Range: {int16_mono.min()} to {int16_mono.max()}")
    
    # If it's mono audio, try FSK decode directly
    print("\n" + "="*60)
    print("[*] Treating as mono int16 audio at 48kHz")
    
    audio = int16_mono.astype(np.float32)
    audio = audio / np.max(np.abs(audio))  # Normalize
    
    # Calculate instantaneous frequency
    # Using Hilbert transform to get analytic signal
    from scipy.signal import hilbert
    analytic = hilbert(audio)
    phase = np.angle(analytic)
    phase_unwrapped = np.unwrap(phase)
    inst_freq = np.diff(phase_unwrapped) * 48000 / (2 * np.pi)
    
    print(f"    Inst freq range: {inst_freq.min():.1f} to {inst_freq.max():.1f} Hz")
    print(f"    Inst freq mean: {inst_freq.mean():.1f} Hz")
    print(f"    Inst freq std: {inst_freq.std():.1f} Hz")
    
    # Histogram to find FSK frequencies
    hist, bin_edges = np.histogram(inst_freq, bins=100, range=(-5000, 5000))
    
    print("\n[*] Frequency histogram peaks:")
    top_indices = np.argsort(hist)[-10:]
    for idx in top_indices:
        center = (bin_edges[idx] + bin_edges[idx+1]) / 2
        print(f"    {center:.0f} Hz: {hist[idx]} samples")
    
    # Try simple zero-crossing based FSK
    print("\n" + "="*60)
    print("[*] Zero-crossing analysis")
    
    # Find zero crossings
    zero_crossings = np.where(np.diff(np.signbit(audio)))[0]
    print(f"    Total zero crossings: {len(zero_crossings)}")
    
    if len(zero_crossings) > 10:
        intervals = np.diff(zero_crossings)
        frequencies = 48000 / (2 * intervals)  # Half period per crossing
        
        print(f"    Frequency range from crossings: {frequencies.min():.0f} to {frequencies.max():.0f} Hz")
        
        # Histogram of frequencies
        hist, bin_edges = np.histogram(frequencies, bins=50, range=(0, 3000))
        top_indices = np.argsort(hist)[-5:]
        print("\n    Most common frequencies:")
        for idx in top_indices:
            center = (bin_edges[idx] + bin_edges[idx+1]) / 2
            print(f"        {center:.0f} Hz: {hist[idx]} occurrences")

if __name__ == "__main__":
    main()
