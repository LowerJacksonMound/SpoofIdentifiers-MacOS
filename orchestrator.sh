#!/bin/bash

# Display menu
echo "Select which identifiers you want to spoof by entering their numbers separated by commas:"
echo "1. MAC Address"
echo "2. Serial Number"
echo "3. Hardware UUID"
echo "4. UUID for Boot Volume"
echo "5. SMBIOS Data"
echo "6. Bluetooth Identifier"
echo "7. Hardware Model Identifier"

# Read user input
read -p "Enter your choices (e.g., 1,3,5): " choices

# Split input into an array
IFS=',' read -r -a selected_options <<< "$choices"

# Function to execute a spoofing script
run_script() {
  script_name=$1
  if [ -f "$script_name" ]; then
    echo "Running $script_name..."
    bash "$script_name"
  else
    echo "Error: Script $script_name not found!"
  fi
}

# Loop through selected options and execute the corresponding script
for choice in "${selected_options[@]}"; do
  case $choice in
    1)
      run_script "./spoof_mac_address.sh"
      ;;
    2)
      run_script "./spoof_serial_number.sh"
      ;;
    3)
      run_script "./spoof_hardware_uuid.sh"
      ;;
    4)
      run_script "./spoof_boot_volume_uuid.sh"
      ;;
    5)
      run_script "./spoof_smbios_data.sh"
      ;;
    6)
      run_script "./spoof_bluetooth_identifier.sh"
      ;;
    7)
      run_script "./spoof_hardware_model_identifier.sh"
      ;;
    *)
      echo "Invalid choice: $choice. Skipping..."
      ;;
  esac
done

echo "Selected spoofing tasks completed!"
