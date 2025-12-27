#!/usr/bin/env python3
"""
FM Hunting CTF - Better FSK decoder with XOR key
"""

import socket
import numpy as np
from scipy import signal

def capture_data(host, port, duration=20):
    """Capture raw data from server"""
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(30)
    
    try:
        print(f"[*] Connecting to {host}:{port}...")
        sock.connect((host, port))
        print("[*] Connected!")
        
        data = b''
        # 48000 samples/sec * 2 bytes/sample * 2 channels = 192000 bytes/sec
        # But might be mono: 48000 * 2 = 96000 bytes/sec
        target = 48000 * 4 * duration  # Assume IQ int16
        
        while len(data) < target:
            chunk = sock.recv(65536)
            if not chunk:
                break
            data += chunk
            if len(data) % 200000 < 65536:
                print(f"[*] Captured {len(data)} bytes...")
        
        return data
    finally:
        sock.close()

def xor_decrypt(data, key):
    """XOR decrypt"""
    key_bytes = key.encode() if isinstance(key, str) else key
    result = bytearray()
    for i, b in enumerate(data):
        result.append(b ^ key_bytes[i % len(key_bytes)])
    return bytes(result)

def bits_to_bytes(bits, msb_first=True):
    bytes_out = []
    for i in range(0, len(bits) - 7, 8):
        byte_bits = bits[i:i+8]
        if msb_first:
            byte_val = sum(b << (7 - j) for j, b in enumerate(byte_bits))
        else:
            byte_val = sum(b << j for j, b in enumerate(byte_bits))
        bytes_out.append(byte_val)
    return bytes(bytes_out)

def fsk_demod_zero_crossing(audio, sample_rate):
    """FSK demodulation using zero crossing detection"""
    # Find zero crossings
    crossings = np.where(np.diff(np.signbit(audio)))[0]
    
    if len(crossings) < 10:
        return None
    
    # Calculate instantaneous frequency at each crossing
    inst_freq = np.zeros(len(audio))
    
    for i in range(len(crossings) - 1):
        period = (crossings[i+1] - crossings[i]) * 2  # Full period
        freq = sample_rate / period
        inst_freq[crossings[i]:crossings[i+1]] = freq
    
    return inst_freq

def search_flag(data, key):
    """Search for ASIS flag in data"""
    # Try raw
    if b'ASIS{' in data:
        idx = data.find(b'ASIS{')
        end = data.find(b'}', idx)
        if end != -1:
            return data[idx:end+1]
    
    # Try XOR decrypted
    decrypted = xor_decrypt(data, key)
    if b'ASIS{' in decrypted:
        idx = decrypted.find(b'ASIS{')
        end = decrypted.find(b'}', idx)
        if end != -1:
            return decrypted[idx:end+1]
    
    return None

def decode_fsk(demod_signal, sample_rate, key):
    """Try to decode FSK signal"""
    
    # Determine threshold
    threshold = np.median(demod_signal)
    
    # Common baud rates
    bauds = [45.45, 50, 75, 100, 110, 150, 200, 300, 600, 1200, 2400, 4800]
    
    for baud in bauds:
        sps = sample_rate / baud
        if sps < 2:
            continue
        
        for offset in range(0, int(sps), max(1, int(sps)//8)):
            bits = []
            pos = offset + sps / 2
            
            while int(pos) < len(demod_signal):
                bits.append(1 if demod_signal[int(pos)] > threshold else 0)
                pos += sps
            
            if len(bits) < 50:
                continue
            
            for inv in [False, True]:
                test_bits = [1-b for b in bits] if inv else bits
                
                for msb in [True, False]:
                    data = bits_to_bytes(test_bits, msb)
                    flag = search_flag(data, key)
                    if flag:
                        print(f"\n[!!!] FOUND! Baud={baud}, inv={inv}, msb={msb}")
                        return flag
                    
                    # Try bit shifts
                    for sh in range(1, 8):
                        data = bits_to_bytes(test_bits[sh:], msb)
                        flag = search_flag(data, key)
                        if flag:
                            print(f"\n[!!!] FOUND! Baud={baud}, shift={sh}")
                            return flag
    
    return None

def main():
    host = "65.109.194.34"
    port = 7356
    key = "0lymp1c"
    sample_rate = 48000
    
    # Capture fresh data
    print("[*] Capturing fresh data...")
    raw_data = capture_data(host, port, duration=30)
    print(f"[+] Captured {len(raw_data)} bytes")
    
    # Save it
    with open('/tmp/iq_fresh.bin', 'wb') as f:
        f.write(raw_data)
    
    # First check if flag is in raw data (XOR'd or not)
    print("\n[*] Checking raw data...")
    flag = search_flag(raw_data, key)
    if flag:
        print(f"[!!!] FLAG IN RAW DATA: {flag}")
        return
    
    # Try different data interpretations
    print("\n[*] Trying different data formats...")
    
    # 1. IQ int16 pairs
    print("\n[*] Format: IQ int16 pairs")
    n = len(raw_data) // 4
    iq_int16 = np.frombuffer(raw_data[:n*4], dtype=np.int16)
    i_data = iq_int16[0::2].astype(np.float32)
    q_data = iq_int16[1::2].astype(np.float32)
    iq_complex = i_data + 1j * q_data
    
    # FM demod
    phase = np.unwrap(np.angle(iq_complex))
    freq = np.diff(phase)
    
    print(f"    Demod range: {freq.min():.4f} to {freq.max():.4f}")
    
    flag = decode_fsk(freq, sample_rate, key)
    if flag:
        print(f"[!!!] FLAG: {flag}")
        return
    
    # 2. Mono int16
    print("\n[*] Format: Mono int16")
    mono = np.frombuffer(raw_data, dtype=np.int16).astype(np.float32)
    
    # Zero-crossing based demod
    freq_zc = fsk_demod_zero_crossing(mono, sample_rate)
    if freq_zc is not None:
        print(f"    ZC freq range: {freq_zc.min():.0f} to {freq_zc.max():.0f}")
        flag = decode_fsk(freq_zc, sample_rate, key)
        if flag:
            print(f"[!!!] FLAG: {flag}")
            return
    
    # Hilbert-based demod
    from scipy.signal import hilbert
    analytic = hilbert(mono)
    phase_mono = np.unwrap(np.angle(analytic))
    freq_mono = np.diff(phase_mono)
    
    flag = decode_fsk(freq_mono, sample_rate, key)
    if flag:
        print(f"[!!!] FLAG: {flag}")
        return
    
    # 3. Try float32 IQ
    print("\n[*] Format: Float32 IQ")
    n = len(raw_data) // 8
    if n > 0:
        f32 = np.frombuffer(raw_data[:n*8], dtype=np.float32)
        if not np.any(np.isnan(f32)) and not np.any(np.isinf(f32)):
            i_f32 = f32[0::2]
            q_f32 = f32[1::2]
            iq_f32 = i_f32 + 1j * q_f32
            
            phase_f32 = np.unwrap(np.angle(iq_f32))
            freq_f32 = np.diff(phase_f32)
            
            flag = decode_fsk(freq_f32, sample_rate, key)
            if flag:
                print(f"[!!!] FLAG: {flag}")
                return
    
    print("\n[-] Flag not found with standard FSK decoding")
    print("[*] Dumping some decoded samples for analysis...")
    
    # Show some potentially decoded bytes
    threshold = np.median(freq)
    for baud in [300, 1200]:
        sps = sample_rate / baud
        bits = []
        pos = sps / 2
        while int(pos) < len(freq):
            bits.append(1 if freq[int(pos)] > threshold else 0)
            pos += sps
        
        data = bits_to_bytes(bits, True)
        decrypted = xor_decrypt(data, key)
        
        printable = ''.join(chr(b) if 32 <= b < 127 else '.' for b in decrypted[:200])
        print(f"\n[*] Baud {baud}, XOR decrypted: {printable}")
        
        printable_raw = ''.join(chr(b) if 32 <= b < 127 else '.' for b in data[:200])
        print(f"[*] Baud {baud}, raw: {printable_raw}")

if __name__ == "__main__":
    main()
