#!/bin/bash
# RÚV Kiosk Installer

# Ensure script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this installer as root (sudo ./install.sh)"
  exit 1
fi

echo "Installing VLC and dependencies..."
apt-get update
apt-get install -y vlc curl jq

echo "Making launcher script executable..."
chmod +x ruv-kiosk.sh

# Assuming user is running from their home directory, but let's be safe:
# We will copy the script to /usr/local/bin so it's in a standard place
echo "Installing script to /usr/local/bin/ruv-kiosk.sh..."
cp ruv-kiosk.sh /usr/local/bin/ruv-kiosk.sh

echo "Installing systemd service..."
# We need to update the service file to point to the new location
sed 's|ExecStart=.*|ExecStart=/usr/local/bin/ruv-kiosk.sh|' ruv-kiosk.service > /etc/systemd/system/ruv-kiosk.service

echo "Enabling and starting service..."
systemctl daemon-reload
systemctl enable ruv-kiosk.service
systemctl start ruv-kiosk.service

echo ""
echo "====================================================="
echo "Installation Complete!"
echo "The RÚV stream should be starting now."
echo ""
echo "HARDENING STEP: To make this system completely immune"
echo "to SD card corruption, please run:"
echo "  sudo raspi-config"
echo "Go to 'Performance Options' -> 'Overlay File System'"
echo "and enable it, then reboot."
echo "====================================================="
