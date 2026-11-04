# Lenovo ThinkPad T530 macOS Sequoia 15 & Tahoe 26 EFI

This repository contains the OpenCore and CLOVER EFI configuration files required to run **macOS Sequoia 15.8.2 and macOS Tahoe 26.7.2 natively on a Lenovo ThinkPad T530**.

## 💻 Hardware Configuration

| Component | Specification & Hackintosh Notes |
| :--- | :--- |
| **Laptop Model** | Lenovo ThinkPad T530 |
| **Processor (CPU)** | Intel Core 3rd Generation (Ivy Bridge - Core i5-3380M) |
| **Chipset** | Intel QM77 Express Mobile PCH |
| **Graphics (GPU)** | Intel HD Graphics 4000 *(Requires OCLP root patching)* |
| **Discrete GPU** | Nvidia NVS 5400M *(No need to disable in BIOS; just set OS detection to disabled)* |
| **Wi-Fi Chip** | Intel Centrino Ultimate-N 6300 |
| **Bluetooth** | Broadcom Bluetooth 4.0 module |
| **LAN (Ethernet)** | Intel 82579LM Gigabit Network Connection |
| **Bootloader** | OpenCore v1.0.7 |

## ⚙️ What Works & What Doesn't

> ⚠️ **Note:** Running macOS Sequoia and Tahoe on Ivy Bridge hardware requires specific root patching via OpenCore Legacy Patcher (OCLP) for graphics acceleration to function, as Apple dropped native support for this architecture.

### Working
* Graphics acceleration and Metal support on Intel HD 4000 using OCLP
* Native Wi-Fi support
* Native boot via OpenCore
* Audio and internal microphone
* Bluetooth
* Battery status indicator
* USB Ports (3.0 and 2.0)
* Ethernet port
* Keyboard, TrackPad, and TrackPoint

### Requires Post-Install Patching
* **Graphics:** Intel HD 4000 graphics acceleration requires OpenCore Legacy Patcher (OCLP) root volume patches.

## 🚀 Getting Started

1. **Standard BIOS Adjustments:** Set your SATA Controller to `AHCI`, disable `Secure Boot` and the `Security Chip`, and set the Boot Mode to `UEFI Only` (or `Both` with CSM enabled/disabled depending on configuration).
2. **Virtualization Settings:** Enable Intel VT-d (Virtualization Technology for Directed I/O) to successfully enable AppleVTD functionalities.
3. **Generate SMBIOS:** Before attempting to boot, use [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) to generate a unique Serial Number, Board Serial, and SmUUID for your config.
4. **Installation:** Setup a vanilla macOS Sequoia or Tahoe installer USB media, copy this repository's EFI folder structure directly into your USB drive's EFI partition, and boot.
5. **Post-Installation Patches:** Download the latest official release of [OpenCore Legacy Patcher](https://github.com/dortania/OpenCore-Legacy-Patcher/releases) to apply the necessary volume root patches for graphics acceleration.
*(Note: Only use the official Dortania releases, as non-standard builds may trigger network, graphics, or audio stability issues).*

## Optional and not needed to unlock bios from EFI version 1.1.0.
1. **BIOS Downgrade:** Downgrade your BIOS to **v2.60**. This specific version is required for the `1vyrain` exploit to function.
2. **Apply 1vyrain Patch:** Use the 1vyrain LiveUSB image (Revision 5):
   * [1vyrain GitHub Repository](https://github.com/n4ru/1vyrain)
   * [Alternative Revision 5 Mirror](https://drive.google.com/file/d/1yusq98ja6NmI4G4txKVueFqY_ZEwaZvO/view)
3. **Flash the Image:** Use [balenaEtcher](https://github.com/balena-io/etcher/releases) to flash the 1vyrain ISO image onto a USB flash drive.
4. **Advanced BIOS Tweaks:** Once unlocked with 1vyrain, disable Intel MSR `0xE2` (CFG Lock) and adjust the Intel HD graphics configuration settings inside **Advanced > System Agent (SA) Configuration > Graphics Configuration**:
   * **GTT Size:** 2 MB
   * **Aperture Size:** 512 MB
   * **DVMT Pre-Allocated:** 128 MB
   * **DVMT Total Gfx Mem:** MAX
   * **IGD Configuration:**
     * **Connector Type:** eDP A
     * **Bit Rate:** 24 bit
   
   *(Note: If you are unable to unlock the BIOS, you must enable `AppleCpuPmCfgLock` inside `Kernel > Quirks` in your config.plist).*
   
<img width="1920" height="1080" alt="Screenshot 2026-11-04 at 00 26 24" src="https://github.com/user-attachments/assets/bba4de75-c149-436c-b61d-3cfd3c57cc27" />
<img width="1920" height="1080" alt="Screenshot 2026-11-04 at 00 26 11" src="https://github.com/user-attachments/assets/d3fcbf13-f2a0-465a-9577-8bd83e0dcf64" />
<img width="1920" height="1080" alt="Screenshot 2026-11-04 at 00 25 37" src="https://github.com/user-attachments/assets/34afaa09-67ee-4d03-9df4-bdeee4b4a04d" />

<img width="1920" height="1080" alt="Screenshot 2026-11-04 at 01 56 51" src="https://github.com/user-attachments/assets/f0a68856-54c8-41b7-b49c-182bebe600ee" />
<img width="1920" height="1080" alt="Screenshot 2026-11-04 at 01 56 24" src="https://github.com/user-attachments/assets/8599f438-8d3f-4269-8fa1-b78f067d8343" />
<img width="1920" height="1080" alt="Screenshot 2026-11-04 at 01 53 27" src="https://github.com/user-attachments/assets/b50c1ac2-3dad-4e30-9c9d-a36994c1a62d" />

## 🤝 Credits
* [@Acidanthera](https://github.com) for OpenCore and core ecosystem kexts.
* [@corpnewt](https://github.com/corpnewt) for indispensable tools like `SSDTTime`, `GenSMBIOS`, and `ProperTree`.
* [@Dortania](https://github.com/dortania) for the definitive OpenCore Install Guide and public repository support.
* [@USBToolBox](https://github.com) for the robust USB mapping tools and kext arrays.
* The **OpenCore Legacy Patcher Team** for engineering macOS Sequoia and Tahoe usability on legacy architectures.
* [@laobamac](https://github.com) for optimized Wi-Fi and audio kext parameters.
