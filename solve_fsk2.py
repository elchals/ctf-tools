#!/usr/bin/env python3
"""
FM Hunting CTF - 2-FSK Beacon Demodulator v2
Better baud rate detection and clock recovery
"""

import numpy as np
from scipy import signal
from scipy.io import wavfile
import struct

def load_iq_data(filename):
    """Load IQ data as int16 pairs"""
    with open(filename, 'rb') as f:
        raw_data = f.read()
    
    n_samples = len(raw_data) // 4
    int16_data = np.frombuffer(raw_data[:n_samples*4], dtype=np.int16)
    i_data = int16_data[0::2].astype(np.float32)
    q_data = int16_data[1::2].astype(np.float32)
    
    # Normalize
    max_val = max(np.abs(i_data).max(), np.abs(q_data).max())
    i_data /= max_val
    q_data /= max_val
    
    return i_data + 1j * q_data

def fm_demodulate(iq_data):
    """FM demodulation"""
    # Method 1: Phase derivative
    phase = np.angle(iq_data)
    phase_unwrapped = np.unwrap(phase)
    freq = np.diff(phase_unwrapped)
    
    return freq

def estimate_baud_rate(demod_signal, sample_rate=48000):
    """Estimate baud rate using autocorrelation"""
    # Look at zero crossings
    threshold = np.median(demod_signal)
    binary = (demod_signal > threshold).astype(int)
    
    # Find run lengths
    changes = np.where(np.diff(binary) != 0)[0]
    run_lengths = np.diff(changes)
    
    if len(run_lengths) < 10:
        return None, None
    
    # Filter out noise (very short runs)
    run_lengths = run_lengths[run_lengths > 2]
    
    if len(run_lengths) < 10:
        return None, None
    
    # Find the most common short run length (likely one bit)
    min_run = np.min(run_lengths)
    
    # Look at histogram of run lengths
    hist, bin_edges = np.histogram(run_lengths, bins=50)
    
    # Find peaks in histogram (common bit periods)
    peak_indices = np.argsort(hist)[-5:]
    common_lengths = (bin_edges[peak_indices] + bin_edges[peak_indices + 1]) / 2
    
    print(f"[*] Run length analysis:")
    print(f"    Min run: {min_run}")
    print(f"    Common run lengths: {sorted(common_lengths)}")
    
    # The smallest common run is likely one symbol
    samples_per_symbol = int(np.min(common_lengths))
    if samples_per_symbol < 2:
        # Try using median of smallest runs
        samples_per_symbol = int(np.median(run_lengths[run_lengths < np.percentile(run_lengths, 30)]))
    
    baud_rate = sample_rate / samples_per_symbol
    
    print(f"    Estimated samples per symbol: {samples_per_symbol}")
    print(f"    Estimated baud rate: {baud_rate:.1f}")
    
    return baud_rate, samples_per_symbol

def decode_fsk_with_clock_recovery(demod_signal, samples_per_symbol, sample_rate=48000):
    """Decode FSK with simple clock recovery"""
    threshold = np.median(demod_signal)
    
    # Try different baud rates around the estimate
    best_bits = None
    best_score = 0
    
    for sps in [samples_per_symbol - 2, samples_per_symbol - 1, samples_per_symbol, 
                samples_per_symbol + 1, samples_per_symbol + 2]:
        if sps < 2:
            continue
            
        for offset in range(int(sps)):
            bits = []
            pos = offset + sps / 2
            
            while int(pos) < len(demod_signal):
                sample = demod_signal[int(pos)]
                bit = 1 if sample > threshold else 0
                bits.append(bit)
                pos += sps
            
            # Score based on how many valid ASCII characters we get
            if len(bits) > 80:
                test_bytes = bits_to_bytes(bits[:1000])
                score = sum(1 for b in test_bytes if 32 <= b < 127 or b in [10, 13])
                
                if score > best_score:
                    best_score = score
                    best_bits = bits
                    print(f"    SPS={sps}, offset={offset}, score={score}")
    
    return best_bits

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

def find_preamble_and_sync(bits):
    """Look for common preambles"""
    bit_str = ''.join(map(str, bits))
    
    # Common preambles
    preambles = [
        '10101010',  # 0xAA
        '01010101',  # 0x55
        '11110000',  # 0xF0
        '00001111',  # 0x0F
        '01111110',  # 0x7E HDLC flag
    ]
    
    for preamble in preambles:
        pos = bit_str.find(preamble * 4)  # Look for repeated preamble
        if pos != -1:
            print(f"[*] Found preamble {preamble} at bit {pos}")
            return pos, preamble
    
    return None, None

def try_uart_decode(bits, baud_rate):
    """Try UART decoding (start bit, 8 data bits, optional parity, stop bit)"""
    print(f"\n[*] Trying UART decode...")
    
    # Look for start bits (0 -> data -> 1)
    bit_str = ''.join(map(str, bits))
    
    # Simple UART: 8N1 (start bit 0, 8 data bits, stop bit 1)
    decoded_bytes = []
    i = 0
    
    while i < len(bits) - 10:
        # Look for start bit (transition from 1 to 0)
        if bits[i] == 0 and (i == 0 or bits[i-1] == 1):
            # Extract 8 data bits
            data_bits = bits[i+1:i+9]
            stop_bit = bits[i+9] if i+9 < len(bits) else 1
            
            if stop_bit == 1 and len(data_bits) == 8:
                # LSB first for UART
                byte_val = sum(b << j for j, b in enumerate(data_bits))
                decoded_bytes.append(byte_val)
                i += 10
                continue
        i += 1
    
    if decoded_bytes:
        result = bytes(decoded_bytes)
        printable = ''.join(chr(b) if 32 <= b < 127 else '.' for b in decoded_bytes)
        print(f"[*] UART decoded {len(decoded_bytes)} bytes: {printable[:200]}")
        return result
    
    return None

def search_for_flag(data):
    """Search for flag pattern in various encodings"""
    if isinstance(data, bytes):
        # Direct search
        if b'flag{' in data.lower() or b'ctf{' in data.lower() or b'htb{' in data.lower():
            return data
        
        # Search for printable strings
        printable = b''
        for b in data:
            if 32 <= b < 127:
                printable += bytes([b])
            else:
                if len(printable) > 10:
                    print(f"[*] Printable string: {printable.decode('ascii', errors='ignore')}")
                printable = b''

def analyze_spectrum(demod_signal, sample_rate=48000):
    """Analyze the spectrum of the demodulated signal"""
    from scipy.fft import fft, fftfreq
    
    N = len(demod_signal)
    yf = fft(demod_signal)
    xf = fftfreq(N, 1/sample_rate)
    
    # Get positive frequencies
    positive_mask = xf > 0
    xf_pos = xf[positive_mask]
    yf_pos = np.abs(yf[positive_mask])
    
    # Find dominant frequencies
    peak_indices = np.argsort(yf_pos)[-10:]
    
    print(f"\n[*] Top frequencies in demodulated signal:")
    for idx in peak_indices:
        print(f"    {xf_pos[idx]:.1f} Hz: {yf_pos[idx]:.1f}")
    
    return xf_pos[peak_indices[-1]]

def main():
    sample_rate = 48000
    
    # Load captured data
    print("[*] Loading IQ data...")
    iq_data = load_iq_data('/tmp/iq_raw.bin')
    print(f"[*] Loaded {len(iq_data)} samples ({len(iq_data)/sample_rate:.2f} seconds)")
    
    # FM demodulate
    print("\n[*] FM demodulating...")
    demod = fm_demodulate(iq_data)
    
    # Apply low-pass filter to clean up the signal
    nyq = sample_rate / 2
    cutoff = 10000  # Hz
    b, a = signal.butter(4, cutoff/nyq, btype='low')
    demod_filtered = signal.filtfilt(b, a, demod)
    
    print(f"[*] Demodulated signal stats:")
    print(f"    Min: {demod_filtered.min():.4f}")
    print(f"    Max: {demod_filtered.max():.4f}")
    print(f"    Mean: {demod_filtered.mean():.4f}")
    print(f"    Std: {demod_filtered.std():.4f}")
    
    # Analyze spectrum for baud rate hints
    dominant_freq = analyze_spectrum(demod_filtered, sample_rate)
    
    # Try common baud rates
    common_bauds = [300, 600, 1200, 2400, 4800, 9600]
    
    print("\n" + "="*60)
    print("[*] Trying common baud rates...")
    print("="*60)
    
    for baud in common_bauds:
        sps = int(sample_rate / baud)
        print(f"\n[*] Trying baud rate {baud} (samples per symbol: {sps})")
        
        threshold = np.median(demod_filtered)
        
        # Try different offsets
        for offset in range(0, sps, max(1, sps//4)):
            bits = []
            pos = offset + sps // 2
            
            while int(pos) < len(demod_filtered):
                sample = demod_filtered[int(pos)]
                bit = 1 if sample > threshold else 0
                bits.append(bit)
                pos += sps
            
            # Try both bit orders and inversion
            for invert in [False, True]:
                test_bits = [1-b for b in bits] if invert else bits
                
                for msb_first in [True, False]:
                    data = bits_to_bytes(test_bits, msb_first=msb_first)
                    
                    # Check for flag patterns
                    lower_data = data.lower()
                    for pattern in [b'flag', b'ctf{', b'htb{', b'FLAG']:
                        if pattern in lower_data:
                            idx = lower_data.find(pattern)
                            print(f"\n[!!!] FOUND FLAG at baud={baud}, offset={offset}, invert={invert}, msb={msb_first}")
                            print(f"[!!!] Data around flag: {data[max(0,idx-20):idx+100]}")
                    
                    # Check for readable ASCII
                    printable_count = sum(1 for b in data[:200] if 32 <= b < 127)
                    if printable_count > 150:
                        printable = ''.join(chr(b) if 32 <= b < 127 else '.' for b in data[:500])
                        print(f"    [{baud}] offset={offset}, inv={invert}, msb={msb_first}: {printable[:100]}")
    
    # Try UART decode with estimated timing
    print("\n" + "="*60)
    print("[*] Trying UART decode with various timings...")
    print("="*60)
    
    threshold = np.median(demod_filtered)
    binary_signal = (demod_filtered > threshold).astype(int)
    
    for baud in common_bauds:
        sps = sample_rate / baud
        result = try_uart_decode_with_timing(binary_signal, sps)
        if result:
            lower = result.lower()
            if b'flag' in lower or b'ctf' in lower:
                print(f"[!!!] FOUND FLAG with UART at baud {baud}")
                print(f"[!!!] {result}")

def try_uart_decode_with_timing(binary_signal, samples_per_bit):
    """UART decode with specific timing"""
    decoded = []
    i = 0
    
    while i < len(binary_signal) - int(samples_per_bit * 10):
        # Look for start bit (high to low transition)
        if binary_signal[i] == 0 and (i == 0 or binary_signal[i-1] == 1):
            # Sample in middle of each bit
            byte_val = 0
            valid = True
            
            for bit_num in range(8):
                sample_pos = int(i + samples_per_bit * (1.5 + bit_num))
                if sample_pos >= len(binary_signal):
                    valid = False
                    break
                bit = binary_signal[sample_pos]
                byte_val |= (bit << bit_num)  # LSB first
            
            # Check stop bit
            stop_pos = int(i + samples_per_bit * 9.5)
            if stop_pos < len(binary_signal) and binary_signal[stop_pos] == 1 and valid:
                decoded.append(byte_val)
                i = int(i + samples_per_bit * 10)
                continue
        
        i += 1
    
    if decoded:
        result = bytes(decoded)
        printable = ''.join(chr(b) if 32 <= b < 127 else '.' for b in decoded[:200])
        if sum(1 for b in decoded[:100] if 32 <= b < 127) > 50:
            print(f"[*] UART decoded {len(decoded)} bytes: {printable}")
        return result
    
    return None

if __name__ == "__main__":
    main()
