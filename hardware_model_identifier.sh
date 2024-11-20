#!/bin/bash
# spoof_hardware_model_identifier.sh
FAKE_MODEL="MacBookPro17,1"
sudo nvram product-name="$FAKE_MODEL"
echo "Hardware Model spoofed to $FAKE_MODEL"
