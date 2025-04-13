#!/bin/bash

# Linux deployment script using cURL
set -e

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "Please run this script as root or with sudo"
    exit 1
fi

# Create temporary directory
TEMP_DIR=$(mktemp -d)

# Function to cleanup on exit
cleanup() {
    rm -rf "$TEMP_DIR"
}

# Set up trap for cleanup
trap cleanup EXIT

# Download and execute the main setup script
curl -sSL "https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/src/installers/linux_installer.sh" -o "$TEMP_DIR/setup.sh"
chmod +x "$TEMP_DIR/setup.sh"

# Execute the setup script
"$TEMP_DIR/setup.sh" 