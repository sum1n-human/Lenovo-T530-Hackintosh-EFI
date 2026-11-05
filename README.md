# Lenovo ThinkPad T530 macOS Sequoia 15 & Tahoe 26 EFI

This repository contains the OpenCore and Clover EFI configuration files required to run **macOS Sequoia (15.8.2) and macOS Tahoe (26.7.2) on the Lenovo ThinkPad T530**.

---

## 💻 Hardware Configuration

| Component | Specification & Hackintosh Notes |
| :--- | :--- |
| **Laptop Model** | Lenovo ThinkPad T530 |
| **Processor (CPU)** | Intel Core 3rd Gen Ivy Bridge (e.g., Core i5-3380M) |
| **Chipset** | Intel QM77 Express Mobile PCH |
| **Graphics (GPU)** | Intel HD Graphics 4000 *(Requires OCLP root patching)* |
| **Discrete GPU** | Nvidia NVS 5400M *(Keep enabled in BIOS; set OS detection to disabled)* |
| **Wi-Fi Chip** | Intel Centrino Ultimate-N 6300 |
| **Bluetooth** | Broadcom Bluetooth 4.0 Module |
| **LAN (Ethernet)** | Intel 82579LM Gigabit Network Connection |
| **Bootloader** | OpenCore v1.0.7 |

---

## ⚙️ What Works & What Doesn't

> [!WARNING]
> **Important Architecture Note:** Running macOS Sequoia and Tahoe on legacy Ivy Bridge hardware requires dedicated volume root patching via **OpenCore Legacy Patcher (OCLP)** to bring back native Metal graphics acceleration support.

### Working
* Intel HD 4000 full graphics acceleration & Metal API support via OCLP root patches
* **Native OTA Software Updates** *(Fully functional incremental updates via System Settings)*
* Native Wi-Fi & Ethernet connectivity
* Native OpenCore boot chain execution
* Onboard audio and internal microphone array
* Bluetooth subsystem
* ACPI Battery status indicator
* USB Ports (SuperSpeed 3.0 and HighSpeed 2.0 structures)
* Keyboard, TrackPad, and TrackPoint tracking navigation

### Requires Post-Install Action
* **Graphics Subsystem:** System will be laggy and unaccelerated until OCLP root patches are successfully deployed post-installation.

---

## 🚀 Getting Started

### 1. Required BIOS Settings

Configure your ThinkPad firmware precisely before launching the macOS installer target environment:

* **SATA Controller:** `AHCI`
* **Secure Boot:** `Disabled`
* **Security Chip:** `Disabled`
* **UEFI/Legacy Boot:** `UEFI Only` *(or Both with CSM adjusted to match environment criteria)*
* **Intel VT-d:** `Enabled` *(Crucial to establish valid AppleVTD structures)*
* **Graphics Detection:** Set OS Detection for Discrete Graphics to `Disabled`

#### Firmware Reference Verification Logs

| BIOS Configuration Pane View | Advanced Storage / Security Settings |
| :---: | :---: |
| _[Insert your T530 BIOS Main Page screenshot here]_ | _[Insert your T530 Security/SATA Mode screenshot here]_ |

---

### 2. Base Configuration & Installation Steps

1. **Generate Unique SMBIOS:** Run [GenSMBIOS](https://github.com) to initialize a unique `SerialNumber`, `BoardSerial`, and `SmUUID` string map inside your target `config.plist`.
2. **Deploy EFI Structure:** Format a vanilla macOS Sequoia or Tahoe recovery/install media drive. Copy the repository's `EFI` directory directly into the designated FAT32 EFI partition structure.
3. **Boot and Install:** Target the USB drive via your ThinkPad's boot menu (`F12`), initialize your drive utility framework, and complete the standard macOS installation process.
4. **Deploy OCLP Volume Patches:** Once booted onto the desktop environment, download the official release distribution of [OpenCore Legacy Patcher](https://github.com). Launch the utility and select **Start Root Patching** to deploy the required legacy graphics configuration payloads.

> [!NOTE]
> Rely strictly on validated Dortania releases to bypass potential network, stability, or visual frame artifacts.

---

## 🔄 OTA System Software Updates

This EFI configuration natively supports incremental **Over-The-Air (OTA) System Software Updates** directly via Apple's native update mechanics under `System Settings > General > Software Update`.

### Seamless Update Protocol

1. **Pre-Update Preparation:** Leave OpenCore and all underlying extensions completely stock. You can update your system securely using the native download installer wizard framework without altering the underlying kext layouts.
2. **Post-Update Automatic Restoration:** When an upgrade sequence wraps up, macOS will overwrite your active patch arrays, temporarily breaking your legacy graphics acceleration profile.
3. **Re-Patching Sequence:** Once your device reboots to the updated desk surface, OpenCore Legacy Patcher will recognize the system modifications automatically. Grant administrative launch permissions to re-run the **Root Volume Patching** payload installer, then perform a quick cleanup system restart to fully restore smooth acceleration properties.

---

## 🔓 Advanced Optional Section: Unlocking Hidden BIOS Features

> [!NOTE]
> These modifications are entirely optional and are **not required** to achieve a functional boot condition or clear updates cleanly beginning with EFI release version 1.1.0.

If you choose to bypass restrictions manually (e.g., to natively resolve CFG Lock properties or configure explicit DVMT values without relying on OpenCore configuration quirks), follow this sequence:

1. **BIOS Firmware Control:** Downgrade your parent firmware revision down to stock version **v2.60**. This rollback is required to exploit vulnerability patterns utilized by the `1vyrain` script layer.
2. **Obtain 1vyrain Chain Assets:** Acquire the Revision 5 LiveUSB system environment deployment structure:
   * [1vyrain Upstream Repository Source](https://github.com)
   * [Alternative Revision 5 Image Mirror](https://google.com)
3. **Create Exploitation Media:** Flash the acquired 1vyrain ISO layout matrix down to a spare flash drive utilizing [balenaEtcher](https://github.com).
4. **Firmware Parameter Optimization:** Once you successfully execute the flash utility via `1vyrain`, enter the newly revealed advanced bios setup menu structure. Turn off **Intel MSR 0xE2 (CFG Lock)** and customize the parameters inside `Advanced > System Agent (SA) Configuration > Graphics Configuration`:
   * **GTT Size:** `2 MB`
   * **Aperture Size:** `512 MB`
   * **DVMT Pre-Allocated:** `128 MB`
   * **DVMT Total Gfx Mem:** `MAX`
   * **IGD Configuration Details:**
     * **Connector Type:** `eDP A`
     * **Bit Rate:** `24 bit`

> [!TIP]
> **Configuration Workaround Note:** If you choose to keep your factory hardware completely stock and pass on the advanced 1vyrain flashing process, you must keep the `AppleCpuPmCfgLock` toggle set to `True` within the `Kernel > Quirks` section block inside your target config.plist.

---

## 📸 Screenshots & Proof of Concept

### macOS System Specifications

Below are standard configurations demonstrating functional macOS operating platform targets executing successfully on the T530 target environment.

#### macOS Sequoia 15 Build Details

| About This Mac (Sequoia Detail Panel) | System Overview Overview (Sequoia Matrix) |
| :---: | :---: |
| <img width="480" alt="macOS Sequoia Overview Pane" src="https://github.com" /> | <img width="480" alt="macOS Sequoia Detailed Settings Panel" src="https://github.com" /> |

#### macOS Tahoe 26 Build Details

| About This Mac (Tahoe Core Specifications Panel) | Applications Environment Grid Overview |
| :---: | :---: |
| <img width="480" alt="macOS Tahoe Overview Pane" src="https://github.com" /> | <img width="480" alt="macOS Tahoe Launchpad Application Drawer" src="https://github.com" /> |

---

## 🤝 Credits

* [@Acidanthera](https://github.com) for creating the OpenCore boot loader ecosystem alongside its underlying essential kext modules.
* [@corpnewt](https://github.com) for deploying essential utilities including `SSDTTime`, `GenSMBIOS`, and the `ProperTree` plist interpretation environment.
* [@Dortania](https://github.com) for hosting open documentation paradigms and the primary OpenCore initial configuration blueprint map.
* [@USBToolBox](https://github.com) for engineering scalable hardware port translation maps and filter modules.
* The **OpenCore Legacy Patcher Engineering Team** for making modern versions of macOS accessible on legacy architectures.
* [@laobamac](https://github.com) for contributing optimized audio parameter metrics and custom wireless driver options.
