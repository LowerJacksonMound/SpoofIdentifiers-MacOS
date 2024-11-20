#!/bin/bash

# Check if the backup file exists
if [ ! -f ./backups/original_nvram.plist ]; then
  echo "Error: Backup file not found! Restoration cannot proceed."
  exit 1
fi

# Begin restoration process
echo "Restoring original identifiers..."

# Attempt to clear all NVRAM variables (some might fail due to SIP protection)
sudo nvram -c

# Restore from the backup file
sudo nvram -f ./backups/original_nvram.plist

# Completion message
echo "Restoration complete!"
