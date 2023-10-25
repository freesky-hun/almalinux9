#!/bin/bash

# Check if the script is running with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run with root privileges."
  exit 1
fi

# List available drives
echo "Available drives:"
fdisk -l

# Prompt the user to select a drive
read -p "Enter the drive you want to partition (e.g., /dev/sdX): " drive

# Start fdisk for the selected drive
fdisk "$drive"

echo "Partitioning completed for $drive."
