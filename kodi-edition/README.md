# Ruvbox - Automated RÚV Appliance

*[Smelltu hér fyrir íslensku (Icelandic)](README.is.md)*

Ruvbox is a lightweight Kodi (LibreELEC) setup designed to turn a Raspberry Pi into a dedicated "appliance" that automatically plays the [RÚV](https://www.ruv.is/) (Icelandic National Broadcasting Service) live stream on boot. 

It is perfect for seniors or anyone who wants a TV to simply turn on and play RÚV without the need to navigate through complex menus or apps.

## Features
*   **Zero-Click Operation:** Starts the RÚV live stream automatically as soon as Kodi finishes booting.
*   **Resilient Streaming:** Uses `inputstream.adaptive` to smoothly handle HLS streaming and automatically adjust video quality based on network conditions.
*   **Connection Retry Logic:** Built-in Python service waits for network connectivity before attempting to play, and safely retries if the stream fails to load initially.
*   **Optimized Buffering:** Includes custom `advancedsettings.xml` to enhance video caching and prevent stuttering on unstable Wi-Fi.

## Directory Structure
*   `src/service.autoplay/` - The custom Kodi Python add-on that handles the boot automation.
*   `config/ruv_live.strm` - The Kodi stream file pointing to the RÚV HLS feed.
*   `config/advancedsettings_kodi20.xml` - Cache optimizations for Kodi v17-v20.

## Installation Instructions

1.  **Install LibreELEC:** Flash LibreELEC onto a Raspberry Pi SD card using the [Raspberry Pi Imager](https://www.raspberrypi.com/software/) or the [LibreELEC USB-SD Creator](https://libreelec.tv/downloads/).
2.  **Enable SSH/Samba:** During the initial LibreELEC setup wizard, ensure SSH or Samba sharing is enabled so you can transfer files to the Pi.
3.  **Transfer Files:**
    *   Copy `config/ruv_live.strm` to the `/storage/` directory on your Raspberry Pi.
    *   Copy the `src/service.autoplay` folder to the `/storage/.kodi/addons/` directory.
    *   *(Optional)* If you are on Kodi v17-v20, rename `config/advancedsettings_kodi20.xml` to `advancedsettings.xml` and place it in `/storage/.kodi/userdata/`. *(Note: For Kodi v21 Omega, configure caching via the Kodi GUI in Settings > Services > Caching instead).*
4.  **Reboot:** Restart the Raspberry Pi. The `service.autoplay` add-on will load automatically, wait for the network, and launch the RÚV stream!

## License
Open source and provided as-is for the community.
