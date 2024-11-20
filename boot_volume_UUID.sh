#!/bin/bash
# spoof_boot_volume_uuid.sh
DISK="disk1s1" # Replace with your boot disk
FAKE_UUID=$(uuidgen)
sudo diskutil unmountDisk force /dev/$DISK
sudo diskutil renameVolume $DISK "SpoofedVolume-$FAKE_UUID"
echo "Boot Volume UUID spoofed to $FAKE_UUID"
