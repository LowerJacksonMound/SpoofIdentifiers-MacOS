#!/bin/bash
# spoof_bluetooth_identifier.sh
BLUETOOTH_INTERFACE="en1" # Change if different
NEW_BLUETOOTH_MAC=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
sudo ifconfig $BLUETOOTH_INTERFACE ether $NEW_BLUETOOTH_MAC
echo "Bluetooth MAC changed to $NEW_BLUETOOTH_MAC"
