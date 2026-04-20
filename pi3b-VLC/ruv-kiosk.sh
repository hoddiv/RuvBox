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
# -V drm : Use direct rendering to framebuffer (required for Raspberry Pi OS Lite)

echo "Starting RÚV stream..."
exec cvlc --fullscreen --no-osd --loop --network-caching=5000 -V drm "$STREAM_URL"
