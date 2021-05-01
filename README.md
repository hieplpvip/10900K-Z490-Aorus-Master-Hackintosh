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

| Function / Hardware      | Status                                                     |
| ------------------------ | ---------------------------------------------------------- |
| iGPU UHD630 Acceleration | Working                                                    |
| CPU Power Management     | Working                                                    |
| Laptop Keyboard          | Working                                                    |
| Laptop Trackpad          | Working                                                    |
| Laptop Headphones Jack   | Partially working                                          |
| Built-in Speakers        | Partially working                                          |
| Built-in Mic             | Not tested                                                 |
| Hotkeys for audio        | Not tested                                                 |
| USB 3.x                  | Working                                                    |
| USB 2.0                  | Working                                                    |
| Fingerprint Sensor       | Not working                                                |
| SD Card Slot             | Not working                                                |
| Screen brightness        | Working, hotkeys fn+S/fn+B to decrease/increase brightness |
| Built-in WiFi            | Working                                                    |
| Built-in Bluetooth       | Not tested                                                 |
| Dell USB3.1 dock         | Not tested                                                 |
| Built-in webcam          | Working                                                    |
| Sleep                    | Not working                                                |

## Instructions

#### Create USB installer

- Follow this [guide](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html#generate-a-new-serial) to generate a new serial number and put that in `src/smbios.txt` (see `smbios-sample.txt`)
- Run `./download.sh` to download necessary kernel extensions
- Run `./build.sh` to build EFI folder
- Follow this [guide](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/mac-install.html#downloading-macos-modern-os) to create a USB with macOS installer. Use the `EFI` folder in `build`.

#### BIOS Settings

- Disable Secure boot

#### Unlock CFG

- Set `ShowPicker` to `true` and `Timeout` to a positive integer.
- Boot from the USB. Select `modGRUBShell` at OpenCore boot menu.
- Enter the following commands:

```
setup_var CpuSetup 0x3e 0x0
setup_var CpuSetup 0xda 0x0
exit
```

- Restart and install macOS.

#### Disable Sleep

Sadly, sleep doesn't work on macOS due to BIOS error. To disable sleep permanently in macOS, run this command in Terminal:

```shell
sudo pmset -a sleep 0; sudo pmset -a hibernatemode 0; sudo pmset -a disablesleep 1;
```

This way, sleep can be stay enabled on BIOS settings so other OS can still use it.

#### Enable HiDPI

Use [one-key-hidpi](https://github.com/xzhih/one-key-hidpi) (3000x2000 Display).

#### Brightness Hotkeys

The BRT6 patch used by previous Dell XPS models isn't working on the XPS 9500. However, fn+S and fn+B hotkeys are functioning in place of the original fn+F6 and fn+F7.

## Notes

- This can also run Catalina, but since `download.sh` downloads Big Sur version of `AirportItlwm`. If you use Catalina, you need to manually download Catalina version.

## Credits

- https://github.com/zachs78/MacOS-XPS-9500-OpenCore/
- https://github.com/BenDevelopment/MacOS-XPS-9500-2020-OpenCore
