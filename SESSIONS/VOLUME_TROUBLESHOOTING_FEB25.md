# HiFiBerry Beocreate Volume Troubleshooting - February 25, 2026

**Date:** February 25, 2026  
**Time:** 20:24 - 20:50 CET  
**System:** Raspberry Pi 3B + Beocreate 4-Channel Amplifier (ADAU1451 DSP)  
**OS:** Debian 13.3 (Trixie) 64-bit  
**Issue:** 90% UI volume setting produces very low actual output

---

## Session Overview

**Continuation of Feb 24 volume optimization work.** System was rebooted between sessions, causing mixer settings drift and exposing a critical DSP profile mismatch issue.

---

## Key Findings

### 1. ALSA Mixer Settings Drift ⚠️

**Problem:** After system reboot, ALSA state file had reverted to old settings

| Control | After Feb 24 | After Reboot | Current (Fixed) |
|---------|--------------|--------------|-----------------|
| DSPVolume | 255 [100%] | 207 [81%] | 255 [100%] ✅ |
| Softvol | 255 [100%] | 255 [100%] | 255 [100%] ✅ |

**Root Cause:** ALSA state was not persisted properly despite `alsactl store` being called

**Resolution Applied:**
```bash
amixer -c 0 sset DSPVolume 255
sudo alsactl store
# Verified in /var/lib/alsa/asound.state: value.0 255, value.1 255 ✅
```

### 2. ALSA State Persistence Configuration

**Issue Discovered:** System uptime only 12 minutes at start of Feb 25 session
- Recent reboot caused mixer reset from stored state
- Factory default or previous state (207) loaded instead of Feb 24 optimization (255)

**Verification:**
```
Boot logs (Feb 25 20:26:30):
- config-volume[3505]: INFO: Physical card volume 81%
- Volume was 81% when system started, was then restored to 100% manually
```

**Current Status:** ✅ State should persist across reboot with current setting

---

### 3. DSP Profile Checksum Mismatch 🔴

**Critical Issue Identified:**

SigmaTCP server logs show:
```
WARNING:root:MD5 checksum mismatch: 
  - XML file MD5:   97C9C5A88582888D111259BF70D6D79E
  - DSP hardware:   0B3162182BC95A2E99FF3A8912C60E35
```

**Meaning:** 
- Stored profile: `Beocreate Universal v11` (beocreate-universal-11.xml)
- Running on DSP: **Different profile** (SHA-1: 11AB4A5AE7A8A7D6E7062B492A6320932D8DD717)

**Impact:** Unknown volume limiting or gain constraints from wrong profile

**File Status:**
- `/var/lib/hifiberry/dspprogram.xml`: Valid XML, 399 lines, 240KB
- Profile metadata confirmed: Beocreate Universal v11, 48kHz, beocreate-4ca-mk1

---

### 4. Hardware Detection ✅

**I2C Hardware Identification:**
```
i2cdetect -y 1:
60: 60  ← Beocreate board identified at 0x60 ✅
```

**Audio Device:**
```
card 0: snd_rpi_hifiberry_dac - RPi-simple (HifiBerry DAC) ✅
```

**DSP Communication:**
```
SigmaTCP server: Running, listening on 8086/TCP and 13141/REST ✅
```

---

### 5. Physical Hardware Verification 

**Jumpers Checked:**
- Jumper 5 (Output Voltage Limiter): **NOT installed** ✅
- Jumper 4 (Mute circuit): **In correct position** ✅
- Both indicate hardware is not constraining output

**Conclusion:** Volume issue is software/DSP profile related, not physical

---

## System State Snapshot

### Boot Configuration
**File:** `/boot/firmware/config.txt`
```
dtparam=audio=off
dtoverlay=hifiberry-dac
dtparam=i2c_arm=on
dtparam=spi=on
```
✅ **Correct for Beocreate**

### ALSA Mixer State (Current)
```
DSPVolume:  255 [100%] [-0.95dB]
Softvol:    255 [100%] [-0.95dB]
```
✅ **Both maximized**

### Audio Services Status
```
✅ audiocontrol.service    - active (running since Feb 24 22:35)
✅ sigmatcpserver.service  - active (running, DSP communication OK)
✓ I2C bus /dev/i2c-1       - active
✓ SPI bus /sys/class/spi_master/spi0 - active
```

### Current DSP State
```
ASRC Lock Status:        00 01 07 FF ✅ (DSP locked to audio stream)
Profile Running:         Unknown (checksum mismatch)
Profile in Storage:      Beocreate Universal v11
Volume Control Register: 106 (storable)
Volume Limit Register:   74 (Limit Pi)
```

---

## Root Cause Analysis

**Why is volume still low despite all software maxed?**

1. ✅ **Software layers:** All at 100%
2. ✅ **Hardware identification:** Correct (Beocreate at 0x60)
3. ✅ **Physical jumpers:** Not limiting output
4. ❌ **DSP profile:** **MISMATCH** - Different profile loaded than stored
   - This is the most likely cause of volume constraint
   - Profile mismatch prevents proper initialization or applies different gain settings

---

## Actions Not Completed

**DSP Profile Reload Attempted:**
- Tried: `sudo dsptoolkit install-profile https://github.com/.../beocreate-universal-11.xml`
- Result: **Timeout/no internet access** - profile installation did not complete
- Status: **Halted per user request**

---

## Next Steps (Research Required)

1. **Resolve DSP profile mismatch**
   - Determine which profile is currently loaded
   - Either reload correct profile OR identify why different profile is active
   - Requires profile reload capability (either local copy or internet access)

2. **Verify volume improvement** after profile sync
   - Test actual output level with profile fix
   - Confirm if 100% software volume translates to expected physical output

3. **Establish profile persistence**
   - Store correct profile to EEPROM
   - Verify profile survives reboot

---

## Session Summary

| Task | Status | Notes |
|------|--------|-------|
| Mixer state validation | ✅ Complete | DSPVolume restored to 100% and persisted |
| ALSA state persistence | ✅ Complete | Settings saved to `/var/lib/alsa/asound.state` |
| Hardware detection | ✅ Complete | I2C, SPI, audio device all verified |
| Jumper configuration | ✅ Complete | No hardware limiting jumpers engaged |
| DSP profile analysis | ✅ Identified | Checksum mismatch found, profile mismatch confirmed |
| DSP profile reload | ⏸️ Halted | Timeout on profile installation, awaiting further action |
| Volume verification | ⏳ Pending | Blocked by DSP profile resolution |

---

## Files Modified

- `/var/lib/alsa/asound.state` - Updated DSPVolume to 255 (from 207)

## Files Checked (Read-Only)

- `/var/lib/hifiberry/dspprogram.xml` - Valid, correct profile metadata
- `/boot/firmware/config.txt` - Correct for Beocreate
- `/etc/audiocontrol/audiocontrol.json` - Volume service configured for auto-detection
- `/etc/mpd.conf` - Using DSPVolume mixer control ✅
- System logs: `/var/log/syslog`, `journalctl` outputs

