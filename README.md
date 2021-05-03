# 10900K - Z490 Aorus Master Hackintosh

<b>OpenCore Version:</b> 0.6.8

<b>macOS Version:</b> Big Sur 11.3

## Specification

| Specification       | Details                                              |
| ------------------- | ---------------------------------------------------- |
| Motherboard         | Gigabyte Z490 AORUS MASTER (rev. 1.0)                |
| Processor           | Intel Core i9-10900K                                 |
| Integrated Graphics | Intel UHD Graphics 630                               |
| Discrete Graphics   | NVIDIA GeForce RTX 3090                              |
| RAM                 | Corsair Vengeance RGB PRO 64GB (2x32GB) DDR4-3200MHz |
| SSD                 | Samsung 970 Evo Plus 1TB M.2 NVMe                    |
| HDD                 | Western Digital Black 4TB 7200rpm                    |
| Sound Card          | Realtek ALC1220-VB                                   |
| Wireless Card       | Intel Wi-Fi 6 AX201                                  |
| Ethernet Card       | Intel I225-V                                         |
| Power Supply        | ASUS ROG STRIX 1000W (80 Plus Gold/Full Modular)     |
| CPU Cooler          | Deepcool Assassin III                                |
| Case                | Mastercase H500P Mesh White ARGB                     |
| Monitor             | ASUS ProArt PA278QV 27" IPS 2K 75Hz                  |

## Functional Status

| Function / Hardware  | Status            |
| -------------------- | ----------------- |
| IGPU Acceleration    | Working           |
| CPU Power Management | Working           |
| USB 3.x              | Working           |
| USB 2.0              | Working           |
| Audio                | Working           |
| HDMI Display Output  | Working           |
| HDMI Audio           | Working           |
| Built-in WiFi        | Partially Working |
| Built-in Bluetooth   | Working           |
| Sleep                | Working           |

## Instructions

#### Create USB installer

- Follow this [guide](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html#generate-a-new-serial) to generate a new serial number and put that in `src/smbios.txt` (see `smbios-sample.txt`)
- Run `./download.sh` to download necessary kernel extensions
- Run `./build.sh` to build EFI folder
- Follow this [guide](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/mac-install.html#downloading-macos-modern-os) to create a USB with macOS installer. Use the `EFI` folder in `build`.

#### Enable HiDPI

Use [one-key-hidpi](https://github.com/xzhih/one-key-hidpi) (3000x2000 Display).
