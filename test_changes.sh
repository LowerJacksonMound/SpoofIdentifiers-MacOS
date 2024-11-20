#!/bin/bash

echo "Testing spoofed identifiers..."

# Function to test and display results
test_identifier() {
  identifier_name=$1
  expected_value=$2
  actual_value=$3

  if [ "$actual_value" = "$expected_value" ]; then
    echo "[SUCCESS] $identifier_name successfully spoofed to: $actual_value"
  else
    echo "[FAILURE] $identifier_name spoofing failed. Current value: $actual_value"
  fi
}

# 1. Test MAC Address
INTERFACE="en0" # Update this if your interface is different
EXPECTED_MAC=$(ifconfig $INTERFACE | grep ether | awk '{print $2}')
echo "Testing MAC Address..."
test_identifier "MAC Address" "$EXPECTED_MAC" "$(ifconfig $INTERFACE | grep ether | awk '{print $2}')"

# 2. Test Serial Number
EXPECTED_SERIAL=$(nvram SystemSerialNumber 2>/dev/null | awk -F' ' '{print $2}')
echo "Testing Serial Number..."
test_identifier "Serial Number" "$EXPECTED_SERIAL" "$(nvram SystemSerialNumber 2>/dev/null | awk -F' ' '{print $2}')"

# 3. Test Hardware UUID
EXPECTED_UUID=$(nvram system-id 2>/dev/null | awk -F' ' '{print $2}')
echo "Testing Hardware UUID..."
test_identifier "Hardware UUID" "$EXPECTED_UUID" "$(nvram system-id 2>/dev/null | awk -F' ' '{print $2}')"

# 4. Test UUID for Boot Volume
BOOT_DISK=$(diskutil info / | grep "Device Identifier" | awk '{print $3}')
EXPECTED_BOOT_UUID=$(diskutil info / | grep "Volume UUID" | awk '{print $3}')
echo "Testing Boot Volume UUID..."
test_identifier "Boot Volume UUID" "$EXPECTED_BOOT_UUID" "$(diskutil info / | grep 'Volume UUID' | awk '{print $3}')"

# 5. Test SMBIOS Data
EXPECTED_PRODUCT_NAME=$(nvram product-name 2>/dev/null | awk -F' ' '{print $2}')
echo "Testing SMBIOS Data..."
test_identifier "SMBIOS Product Name" "$EXPECTED_PRODUCT_NAME" "$(nvram product-name 2>/dev/null | awk -F' ' '{print $2}')"

# 6. Test Bluetooth Identifier
BLUETOOTH_INTERFACE="en1" # Update if Bluetooth uses a different interface
EXPECTED_BLUETOOTH_MAC=$(ifconfig $BLUETOOTH_INTERFACE | grep ether | awk '{print $2}')
echo "Testing Bluetooth Identifier..."
test_identifier "Bluetooth MAC Address" "$EXPECTED_BLUETOOTH_MAC" "$(ifconfig $BLUETOOTH_INTERFACE | grep ether | awk '{print $2}')"

# 7. Test Hardware Model Identifier
EXPECTED_HARDWARE_MODEL=$(nvram product-name 2>/dev/null | awk -F' ' '{print $2}')
echo "Testing Hardware Model Identifier..."
test_identifier "Hardware Model" "$EXPECTED_HARDWARE_MODEL" "$(nvram product-name 2>/dev/null | awk -F' ' '{print $2}')"

echo "Testing complete!"
