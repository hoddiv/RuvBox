#!/bin/bash
# RÚV Kiosk Launcher
# This script launches VLC in headless mode (cvlc) pointing to the RÚV stream.
# The stream URL is resolved at runtime from RÚV's channel API so the kiosk
# keeps working when the underlying m3u8 URL rotates.

# Wait a moment for audio/video drivers and network to fully initialize
sleep 5

echo "Resolving current RÚV stream URL..."
STREAM_URL=$(curl -fsS https://geo.spilari.ruv.is/channel/ruv | jq -r '.url // empty')
if [ -z "$STREAM_URL" ]; then
  echo "Failed to resolve stream URL, aborting." >&2
  exit 1
fi
echo "Stream URL: $STREAM_URL"

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
