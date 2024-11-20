#!/bin/bash
# spoof_hardware_uuid.sh
FAKE_UUID=$(uuidgen)
sudo nvram system-id="$FAKE_UUID"
echo "Hardware UUID spoofed to $FAKE_UUID"
