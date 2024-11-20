#!/bin/bash
# spoof_mac_address.sh
INTERFACE="en0" # Change this if spoofing a different interface
NEW_MAC=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
sudo ifconfig $INTERFACE ether $NEW_MAC
echo "MAC address changed to $NEW_MAC"
