#!/bin/bash
# spoof_serial_number.sh
FAKE_SERIAL="C02ZZZZZZZZZ" # Replace with generated value
sudo nvram SystemSerialNumber="$FAKE_SERIAL"
echo "Serial Number spoofed to $FAKE_SERIAL"
