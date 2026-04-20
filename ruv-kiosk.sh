#!/bin/bash
# RÚV Kiosk Launcher
# This script launches VLC in headless mode (cvlc) pointing to the RÚV stream.

STREAM_URL="https://ruvlive.akamaized.net/out/v1/317f60ed57214a39872eacca6fa96f2d/index.m3u8"

# Wait a moment for audio/video drivers to fully initialize
sleep 5

# Launch VLC:
# --fullscreen : Fullscreen mode
# --no-osd : Disable on-screen display (volume bars, titles, etc)
# --loop : Automatically restart the stream if it drops
# --network-caching=5000 : 5 second buffer to prevent stuttering
# Auto-detect the best video output method for maximum compatibility
if [ -n "$DISPLAY" ] || [ -n "$WAYLAND_DISPLAY" ]; then
  # Running in a Desktop Environment (Ubuntu, Pi OS Desktop, etc)
  echo "Desktop environment detected. Starting RÚV stream..."
  exec cvlc --quiet --fullscreen --no-osd --loop --network-caching=5000 --sub-language=is --sub-track=0 "$STREAM_URL"
else
  # Running Headless (Raspberry Pi OS Lite, Server, etc)
  # -V drm : Use direct rendering to framebuffer (best for Pi OS Lite)
  echo "Headless environment detected. Starting RÚV stream via DRM..."
  exec cvlc --quiet --fullscreen --no-osd --loop --network-caching=5000 --sub-language=is --sub-track=0 -V drm "$STREAM_URL"
fi
