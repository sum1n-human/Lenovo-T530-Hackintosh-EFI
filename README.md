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

BIOS  Settings<img width="3450" height="1957" alt="20261105_075520" src="https://github.com/user-attachments/assets/1f23b6ad-1661-4fa0-a69e-dadef1cdaf79" />
<img width="3399" height="1911" alt="20261105_075426" src="https://github.com/user-attachments/assets/d46d5d57-d711-4d9a-a70b-2724a4b21ce4" />
<img width="3467" height="1962" alt="20261105_075319" src="https://github.com/user-attachments/assets/f3af1175-6ccb-4a9d-8960-7abb5bfc56e6" />
<img width="3351" height="1910" alt="20261105_075201" src="https://github.com/user-attachments/assets/4cc4fd5e-5292-42e0-893a-b7a06183fcc3" />
<img width="3402" height="1882" alt="20261105_075043" src="https://github.com/user-attachments/assets/94677287-fa1c-4b5a-a3e9-8e5a14606e0c" />
<img width="3494" height="1960" alt="20261105_074936" src="https://github.com/user-attachments/assets/e35aeca5-2c43-420d-b7fb-f31535116c89" />
<img width="3459" height="1969" alt="20261105_074835" src="https://github.com/user-attachments/assets/90b92a54-5af3-405b-97d8-4b782c05da8c" />
<img width="3517" height="1959" alt="20261105_074630" src="https://github.com/user-attachments/assets/d3fc04de-5830-49bd-9da2-dceb16ee9a08" />
<img width="3339" height="1827" alt="20261105_074528" src="https://github.com/user-attachments/assets/0b50737d-e0d4-43a8-ae77-15b8272a0760" />
<img width="3509" height="1959" alt="20261105_074408" src="https://github.com/user-attachments/assets/e7279b59-9e2a-4fe9-b0d4-efe17212cbaf" />
<img width="3601" height="1982" alt="20261105_074255" src="https://github.com/user-attachments/assets/c3c50860-c5b8-414b-b72a-e93177af3224" />
<img width="3350" height="1890" alt="20261105_074116" src="https://github.com/user-attachments/assets/2f389aa0-e241-4344-a150-b1798857de77" />
<img width="3503" height="1934" alt="20261105_073937" src="https://github.com/user-attachments/assets/d5b8a818-af0b-43ec-8def-7b625e07d4df" />
<img width="3467" height="1990" alt="20261105_073828" src="https://github.com/user-attachments/assets/797b684c-e49b-43a6-97d4-69f634f75520" />
<img width="3301" height="1848" alt="20261105_073453" src="https://github.com/user-attachments/assets/5f87e983-28d7-4d0d-87a9-83cd7dc825a8" />

<img width="3420" height="2036" alt="20261105_073336" src="https://github.com/user-attachments/assets/82116214-75b4-45b0-8448-5db3437226ec" />


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
