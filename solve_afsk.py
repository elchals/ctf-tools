#!/usr/bin/env python3
"""
FM Hunting CTF - AFSK Demodulator
The signal appears to have mark/space around 900/1100 Hz or similar
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
    
    return i_data, q_data

def afsk_demod_correlation(signal_data, sample_rate, mark_freq, space_freq, baud_rate):
    """Demodulate AFSK using correlation with mark and space tones"""
    samples_per_bit = int(sample_rate / baud_rate)
    
    # Generate reference tones for one bit period
    t = np.arange(samples_per_bit) / sample_rate
    mark_ref = np.sin(2 * np.pi * mark_freq * t)
    space_ref = np.sin(2 * np.pi * space_freq * t)
    
    # Correlate with the signal
    mark_corr = np.correlate(signal_data, mark_ref, mode='valid')
    space_corr = np.correlate(signal_data, space_ref, mode='valid')
    
    # Compare correlations
    diff = np.abs(mark_corr) - np.abs(space_corr)
    
    return diff

def afsk_demod_filter(signal_data, sample_rate, mark_freq, space_freq):
    """Demodulate AFSK using bandpass filters"""
    nyq = sample_rate / 2
    
    # Design bandpass filters for mark and space
    bw = 200  # Bandwidth in Hz
    
    # Mark filter
    low_mark = (mark_freq - bw/2) / nyq
    high_mark = (mark_freq + bw/2) / nyq
    if low_mark > 0 and high_mark < 1:
        b_mark, a_mark = signal.butter(4, [low_mark, high_mark], btype='band')
        mark_filtered = signal.filtfilt(b_mark, a_mark, signal_data)
    else:
        return None
    
    # Space filter
    low_space = (space_freq - bw/2) / nyq
    high_space = (space_freq + bw/2) / nyq
    if low_space > 0 and high_space < 1:
        b_space, a_space = signal.butter(4, [low_space, high_space], btype='band')
        space_filtered = signal.filtfilt(b_space, a_space, signal_data)
    else:
        return None
    
    # Envelope detection
    mark_env = np.abs(signal.hilbert(mark_filtered))
    space_env = np.abs(signal.hilbert(space_filtered))
    
    # Difference
    diff = mark_env - space_env
    
    return diff

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

def decode_bits(demod_signal, sample_rate, baud_rate):
    """Decode bits from demodulated signal"""
    samples_per_bit = sample_rate / baud_rate
    threshold = np.median(demod_signal)
    
    results = []
    
    for start_offset in range(0, int(samples_per_bit), max(1, int(samples_per_bit//4))):
        bits = []
        pos = start_offset + samples_per_bit / 2
        
        while int(pos) < len(demod_signal):
            sample = demod_signal[int(pos)]
            bit = 1 if sample > threshold else 0
            bits.append(bit)
            pos += samples_per_bit
        
        # Try all combinations
        for invert in [False, True]:
            test_bits = [1-b for b in bits] if invert else bits
            
            for msb in [True, False]:
                data = bits_to_bytes(test_bits, msb_first=msb)
                
                if b'ASIS' in data:
                    idx = data.find(b'ASIS')
                    end_idx = data.find(b'}', idx)
                    if end_idx != -1:
                        flag = data[idx:end_idx+1]
                        results.append((baud_rate, start_offset, invert, msb, flag))
                        print(f"\n[!!!] FOUND: {flag}")
    
    return results

def main():
    sample_rate = 48000
    
    print("[*] Loading IQ data...")
    i_data, q_data = load_iq_data('/tmp/iq_raw.bin')
    print(f"[*] Loaded {len(i_data)} samples")
    
    # The IQ data might actually be audio samples
    # Try treating just I channel as audio
    audio_signals = [
        ("I channel", i_data),
        ("Q channel", q_data),
        ("I+Q", i_data + q_data),
        ("Magnitude", np.sqrt(i_data**2 + q_data**2)),
    ]
    
    # Common AFSK frequency pairs
    freq_pairs = [
        (1200, 2200),  # Bell 202
        (980, 1180),   # Common
        (900, 1100),   # Common
        (1000, 1200),  # Common  
        (800, 1200),   # Wide shift
        (1200, 1800),  # 
        (2025, 2225),  # Bell 103
        (1070, 1270),  # Bell 103 originate
    ]
    
    # Also try frequencies we found in spectrum
    freq_pairs.extend([
        (900, 1100),
        (950, 1050),
        (850, 1150),
    ])
    
    baud_rates = [50, 75, 100, 110, 150, 200, 300, 600, 1200]
    
    all_results = []
    
    for sig_name, sig_data in audio_signals:
        print(f"\n{'='*60}")
        print(f"[*] Processing: {sig_name}")
        print('='*60)
        
        # Normalize
        sig_data = sig_data / np.max(np.abs(sig_data))
        
        for mark_freq, space_freq in freq_pairs:
            print(f"\n[*] Trying AFSK {mark_freq}/{space_freq} Hz...")
            
            try:
                demod = afsk_demod_filter(sig_data, sample_rate, mark_freq, space_freq)
                
                if demod is not None:
                    for baud in baud_rates:
                        results = decode_bits(demod, sample_rate, baud)
                        all_results.extend(results)
            except Exception as e:
                print(f"    Error: {e}")
    
    # Also try direct FM demodulation of complex signal
    print(f"\n{'='*60}")
    print("[*] Trying FM demodulation of complex signal")
    print('='*60)
    
    iq = i_data + 1j * q_data
    
    # FM demodulate
    phase = np.angle(iq)
    phase_unwrapped = np.unwrap(phase)
    freq = np.diff(phase_unwrapped)
    
    # The demodulated signal might contain AFSK
    # Try to extract the audio FSK
    for mark_freq, space_freq in freq_pairs:
        print(f"\n[*] Trying AFSK {mark_freq}/{space_freq} Hz on FM demod...")
        
        try:
            # Scale freq to actual Hz
            freq_hz = freq * sample_rate / (2 * np.pi)
            
            # The FM demod output should be the audio
            # Apply AFSK demod
            demod = afsk_demod_filter(freq_hz, sample_rate, mark_freq, space_freq)
            
            if demod is not None:
                for baud in baud_rates:
                    results = decode_bits(demod, sample_rate, baud)
                    all_results.extend(results)
        except Exception as e:
            pass
    
    if all_results:
        print("\n" + "="*60)
        print("[+] ALL FLAGS FOUND:")
        for r in all_results:
            print(f"    {r}")
    else:
        print("\n[-] No flags found with AFSK")
        
        # Let's try a simpler approach - just threshold the magnitude
        print("\n[*] Trying simple magnitude threshold...")
        
        magnitude = np.sqrt(i_data**2 + q_data**2)
        threshold = np.median(magnitude)
        binary = (magnitude > threshold).astype(int)
        
        for baud in baud_rates:
            results = decode_bits_from_binary(binary, sample_rate, baud)
            if results:
                print(f"[+] Found with magnitude threshold, baud={baud}")

def decode_bits_from_binary(binary, sample_rate, baud_rate):
    """Decode from already-binary signal"""
    samples_per_bit = sample_rate / baud_rate
    
    for start_offset in range(0, int(samples_per_bit), max(1, int(samples_per_bit//4))):
        bits = []
        pos = start_offset + samples_per_bit / 2
        
        while int(pos) < len(binary):
            bits.append(binary[int(pos)])
            pos += samples_per_bit
        
        for invert in [False, True]:
            test_bits = [1-b for b in bits] if invert else bits
            
            for msb in [True, False]:
                data = bits_to_bytes(test_bits, msb_first=msb)
                
                if b'ASIS' in data:
                    idx = data.find(b'ASIS')
                    end_idx = data.find(b'}', idx)
                    if end_idx != -1:
                        flag = data[idx:end_idx+1]
                        print(f"\n[!!!] FOUND: {flag}")
                        return True
    return False

if __name__ == "__main__":
    main()
