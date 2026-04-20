# Ruvbox - VLC Kiosk Edition

*[Smelltu hér fyrir íslensku (Icelandic)](README.is.md)*

This is the **ultra-resilient, read-only** version of the RÚV appliance. 
Instead of using a complex media center like Kodi, this setup uses Raspberry Pi OS Lite and VLC to create a true, unbreakable "dumb TV".

## Why this version?
*   **No UI to break:** There are no menus. It boots straight into the fullscreen stream.
*   **Immune to power cuts:** By enabling OverlayFS, the SD card becomes read-only. You can unplug it from the wall 10,000 times and it will never corrupt.
*   **Lightweight:** Runs on a minimal operating system without a desktop environment, saving memory and booting faster.

## Hardware Requirements
*   Raspberry Pi (3, 4, or 5)
*   MicroSD Card

## Installation

### 1. Flash Raspberry Pi OS Lite
Use the [Raspberry Pi Imager](https://www.raspberrypi.com/software/) to flash **Raspberry Pi OS Lite (64-bit)** (found under *Raspberry Pi OS (other)*). 
*Before writing*, click the gear icon (OS Customisation) and:
*   Set a username (e.g., `pi`) and password.
*   Configure your Wi-Fi settings.
*   Enable SSH.

### 2. Copy the files
Turn on the Raspberry Pi and use SCP/SFTP (like FileZilla or WinSCP) to copy this entire `pi3b-VLC` folder into the home directory of the Pi (e.g., `/home/pi/pi3b-VLC`).

### 3. Run the installer
SSH into the Raspberry Pi and run:
```bash
cd pi3b-VLC
sudo ./install.sh
```
The script will install VLC, configure the automatic boot service, and start the stream.

### 4. Harden the system (Crucial!)
To make it an unbreakable appliance, you must make the file system read-only so you can safely pull the power plug:
1. Run `sudo raspi-config`
2. Navigate to **Advanced Options** (or **Performance Options** on newer versions) -> **Overlay File System**.
3. Select **Yes** to enable the overlay, and **Yes** to make the boot partition read-only.
4. Reboot.

*Note: If you ever need to update the system or change the script, you must run `sudo raspi-config` and disable the Overlay File System first, make your changes, and then re-enable it.*
