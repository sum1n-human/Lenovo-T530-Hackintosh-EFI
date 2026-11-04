# Lenovo ThinkPad T530 macOS 15 and 26 EFI

This repository contains the OpenCore and CLOVER EFI configuration files required to run **macOS Sequoia 15.8.2 and Tahoe 26.7.2 natively on a Lenovo ThinkPad T530**. 

## 💻 Hardware Configuration 

| Component | Specification & Hackintosh Notes |26
| :--- | :--- |
| **Laptop Model** | Lenovo ThinkPad T530 |
| **Processor (CPU)** | Intel Core 3rd Generation (Ivy Bridge - Core i5-3380M) |
| **Chipset** | Intel QM77 Express Mobile PCH |
| **Graphics (GPU)** | Intel HD Graphics 4000 *(Requires OCLP-X root patching)* |
| **Graphics (GPU)** | Nvidia NVS 5400 M (Do not need to disable in bios just set OS detection to disable)*|
| **Wi-Fi Chip** | Intel Centrino Ultimate-N 6300 
| **Bluetooth** | Broadcom Bluetooth 4.0 module
| **LAN (Ethernet)** | Intel 82579LM Gigabit Network Connection
| **Bootloader** | OpenCore v1.0.7 |

## ⚙️ What Works & What Doesn't
> ⚠️ **Note:** Running macOS Sequoia and Tahoe on Ivy Bridge hardware requires specific root patching (via OpenCore Legacy Patcher) for graphics acceleration to work, as Apple dropped native support for this architecture in recent macOS versions. 

### Working
* Graphic acceleration and metal support on intel HD 4000 using OCLP-X
* native WIFI support after OCLP-X root patch 
* Native boot via OpenCore
* Audio and internal microphone
* Bluetooth
* Battery status indicator
* USB Ports (3.0 and 2.0)
* Ethernet port
* Keyboard and TrackPad / TrackPoint

### Requires Post-Install Patching
* **Graphics:** Intel HD 4000 graphics acceleration requires OpenCore Legacy Patcher (OCLP) root patches.
* **Wi-Fi/Bluetooth:** Depends on your specific card; Broadcom or Intel cards will require matching kexts and OCLP root patching.

## 🚀 Getting Started
1. downgrade your bios to v 2.60, you need this version for 1vyrain to work.
2. apply 1vyrain patch: Use 1vyrain image rev 5: https://github.com/n4ru/1vyrain and https://drive.google.com/file/d/1yusq98ja6NmI4G4txKVueFqY_ZEwaZvO/view
    - use belenaetcher to flash ivyrain iso image into pendrive: https://github.com/balena-io/etcher/releases
4. **Bios Settings:** Ensure your BIOS is unlocked with 1virain because we need to disable intel MSR 0xE2 for CFG lock and we also need to adjust intel HD graphics properties inside Advance > System agent (SA) configuration > Graphics configuratopn.
      - GTT Size > 2 mb
      - Aperture Size > 512 mb
      - DVMT Pre-Allocated > 128 mb
      - DVMT Total Gfx Mem > MAX
      - IGD Configuration >
                        - Connector type > eDP A
                        - bit rate > 24 bit
      (note: if you unable to unlock bios then enable > AppleCpuPmCfgLock inside kernel > quirks)
5.  Set SATA Controller to `AHCI`, disable `Secure Boot, Security Chip`, and set Boot Mode to `UEFI Only or Both with CSM Enable or disable`.
6.  Enable Intel VT-d (Virtualization Technology for direct IO) to enable apple VTD.
7. **Generate SMBIOS:** Before booting, use **GenSMBIOS** to generate a unique serial number, Board Serial, and UUID.
     link: https://github.com/corpnewt/GenSMBIOS 
8. **Installation:** Use a standard macOS Sequoia and tahoe vanilla installer, copy this EFI to your USB drive's EFI partition, and boot.
9. **Post-Installation:** Download the latest version of **OpenCore Legacy Patcher** using this link "(https://github.com/dortania/OpenCore-Legacy-Patcher/releases)" to apply the necessary volume root patches for graphics.
    (note: only use dortania version: https://github.com/dortania/OpenCore-Legacy-Patcher/releases as other will cause network and audio issues.)
and 
## 🤝 Credits
* @Acidanthera for OpenCore and essential kexts.
* @corpnewt for SSDTTime, GenSMBIOS, ProperTree.
* @Dortania for the comprehensive OpenCore Install Guide and Kexts.
* @USBToolBox for USB mapping tool and Kext
* The OpenCore Legacy Patcher team for making macOS Sequoia and Tahoe possible on legacy hardware.
* @laobamac for wifi and audio kexts
