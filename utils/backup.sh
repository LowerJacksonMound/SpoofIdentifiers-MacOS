#!/bin/bash

# Ensure the backups directory exists
mkdir -p ./backups

# Backup NVRAM variables
sudo nvram -p > ./backups/original_nvram.plist

# Backup MAC address
ifconfig en0 | grep ether > ./backups/original_mac.txt

# Backup UUID information
diskutil info / | grep UUID > ./backups/original_uuids.txt

# Completion message
echo "Backup complete!"
