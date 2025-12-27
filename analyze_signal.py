#!/usr/bin/env python3
"""
Analyze the IQ signal in detail
"""

import numpy as np
from scipy import signal
from scipy.fft import fft, fftfreq

def load_iq_data(filename):
    """Load IQ data as int16 pairs"""
    with open(filename, 'rb') as f:
        raw_data = f.read()
    
    n_samples = len(raw_data) // 4
    int16_data = np.frombuffer(raw_data[:n_samples*4], dtype=np.int16)
    i_data = int16_data[0::2].astype(np.float32)
    q_data = int16_data[1::2].astype(np.float32)
    
    return i_data + 1j * q_data

def analyze_spectrum(iq_data, sample_rate=48000):
    """Analyze the spectrum"""
    N = len(iq_data)
    yf = fft(iq_data)
    xf = fftfreq(N, 1/sample_rate)
    
    # Get magnitude
    mag = np.abs(yf)
    
    # Find peaks
    peak_indices = np.argsort(mag)[-20:]
    
    print("\n[*] Top 20 frequencies:")
    for idx in sorted(peak_indices, key=lambda x: mag[x], reverse=True):
        if mag[idx] > mag.max() * 0.01:  # Only significant peaks
            print(f"    {xf[idx]:8.1f} Hz: {mag[idx]:.0f}")
    
    return xf, mag

def analyze_instantaneous_freq(iq_data, sample_rate=48000):
    """Analyze instantaneous frequency"""
    # Calculate instantaneous frequency
    phase = np.angle(iq_data)
    phase_unwrapped = np.unwrap(phase)
    inst_freq = np.diff(phase_unwrapped) * sample_rate / (2 * np.pi)
    
    print(f"\n[*] Instantaneous frequency stats:")
    print(f"    Min: {inst_freq.min():.1f} Hz")
    print(f"    Max: {inst_freq.max():.1f} Hz")
    print(f"    Mean: {inst_freq.mean():.1f} Hz")
    print(f"    Std: {inst_freq.std():.1f} Hz")
    
    # Histogram of frequencies
    hist, bin_edges = np.histogram(inst_freq, bins=100)
    peak_bins = np.argsort(hist)[-5:]
    
    print(f"\n[*] Most common frequency ranges:")
    for idx in peak_bins:
        center = (bin_edges[idx] + bin_edges[idx+1]) / 2
        print(f"    {center:.1f} Hz: {hist[idx]} samples")
    
    return inst_freq

def try_fsk_decode(inst_freq, sample_rate=48000):
    """Try to decode FSK based on frequency analysis"""
    
    # Find the two main frequencies (mark and space)
    hist, bin_edges = np.histogram(inst_freq, bins=200)
    
    # Find two main peaks
    from scipy.signal import find_peaks
    peaks, _ = find_peaks(hist, height=hist.max()*0.1, distance=10)
    
    if len(peaks) >= 2:
        freq1 = (bin_edges[peaks[0]] + bin_edges[peaks[0]+1]) / 2
        freq2 = (bin_edges[peaks[-1]] + bin_edges[peaks[-1]+1]) / 2
        
        print(f"\n[*] Detected FSK frequencies:")
        print(f"    Mark:  {freq1:.1f} Hz")
        print(f"    Space: {freq2:.1f} Hz")
        print(f"    Shift: {abs(freq2-freq1):.1f} Hz")
        
        # Threshold between the two frequencies
        threshold = (freq1 + freq2) / 2
        
        # Convert to binary
        binary = (inst_freq > threshold).astype(int)
        
        return binary, threshold
    
    return None, None

def decode_with_various_bauds(binary, sample_rate=48000):
    """Try decoding with various baud rates"""
    
    # Find run lengths to estimate baud rate
    changes = np.where(np.diff(binary) != 0)[0]
    run_lengths = np.diff(changes)
    
    if len(run_lengths) > 10:
        # Get the minimum run length (should be ~1 symbol period)
        min_runs = run_lengths[run_lengths > 1]  # Filter out single-sample glitches
        if len(min_runs) > 0:
            min_period = np.percentile(min_runs, 10)
            est_baud = sample_rate / min_period
            print(f"\n[*] Estimated baud rate from run lengths: {est_baud:.1f}")
    
    # Try various baud rates
    bauds_to_try = [100, 150, 200, 300, 450, 600, 900, 1200, 1800, 2400, 4800]
    
    for baud in bauds_to_try:
        sps = sample_rate / baud
        
        # Sample at center of each bit
        for start_offset in range(0, int(sps), max(1, int(sps//4))):
            bits = []
            pos = start_offset + sps/2
            
            while int(pos) < len(binary):
                bits.append(binary[int(pos)])
                pos += sps
            
            # Try different decodings
            for invert in [False, True]:
                test_bits = [1-b for b in bits] if invert else bits
                
                for msb in [True, False]:
                    # Convert to bytes
                    data = bits_to_bytes(test_bits, msb_first=msb)
                    
                    if b'ASIS' in data:
                        idx = data.find(b'ASIS')
                        print(f"\n[!!!] FOUND FLAG!")
                        print(f"    Baud: {baud}")
                        print(f"    Offset: {start_offset}")
                        print(f"    Invert: {invert}")
                        print(f"    MSB first: {msb}")
                        # Find the end of flag
                        end_idx = data.find(b'}', idx)
                        if end_idx != -1:
                            flag = data[idx:end_idx+1]
                            print(f"    FLAG: {flag.decode('ascii', errors='ignore')}")
                        else:
                            print(f"    Data: {data[idx:idx+100]}")
                        return data
    
    return None

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

def main():
    sample_rate = 48000
    
    print("[*] Loading IQ data...")
    iq_data = load_iq_data('/tmp/iq_raw.bin')
    print(f"[*] Loaded {len(iq_data)} samples ({len(iq_data)/sample_rate:.2f} seconds)")
    
    # Analyze spectrum
    print("\n" + "="*60)
    print("[*] Spectrum Analysis")
    print("="*60)
    xf, mag = analyze_spectrum(iq_data, sample_rate)
    
    # Analyze instantaneous frequency
    print("\n" + "="*60)
    print("[*] Instantaneous Frequency Analysis")
    print("="*60)
    inst_freq = analyze_instantaneous_freq(iq_data, sample_rate)
    
    # Try FSK decode
    print("\n" + "="*60)
    print("[*] FSK Decoding")
    print("="*60)
    binary, threshold = try_fsk_decode(inst_freq, sample_rate)
    
    if binary is not None:
        print(f"\n[*] Binary signal generated, threshold={threshold:.1f}")
        print(f"[*] Total binary samples: {len(binary)}")
        
        # Try to decode
        result = decode_with_various_bauds(binary, sample_rate)
        
        if result is None:
            # Save for manual analysis
            np.save('/tmp/binary_signal.npy', binary)
            np.save('/tmp/inst_freq.npy', inst_freq)
            print("\n[*] Saved signals for manual analysis")
            
            # Print first few hundred bits
            print(f"\n[*] First 500 binary values: {''.join(map(str, binary[:500]))}")

if __name__ == "__main__":
    main()
