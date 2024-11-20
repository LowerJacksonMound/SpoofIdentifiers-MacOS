#!/bin/bash
# spoof_smbios_data.sh
FAKE_MODEL="MacBookPro16,1" # Replace with fake model
FAKE_SERIAL="C02YYYYYYYYY"  # Replace with fake serial
FAKE_BOARD_ID="Mac-XXXXX"   # Replace with fake board ID
sudo nvram "SMBIOS.system-id=$FAKE_SERIAL"
sudo nvram "SMBIOS.product-name=$FAKE_MODEL"
echo "SMBIOS data spoofed: Model=$FAKE_MODEL, Serial=$FAKE_SERIAL"
