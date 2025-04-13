#!/bin/bash

# macOS deployment script using cURL
set -e

# Create temporary directory
TEMP_DIR=$(mktemp -d)

# Function to cleanup on exit
cleanup() {
    rm -rf "$TEMP_DIR"
}

# Set up trap for cleanup
trap cleanup EXIT

# Download and execute the main setup script
curl -sSL "https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/src/installers/macos_installer.sh" -o "$TEMP_DIR/setup.sh"
chmod +x "$TEMP_DIR/setup.sh"

# Execute the setup script
"$TEMP_DIR/setup.sh" 