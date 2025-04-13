#!/bin/bash

# Linux deployment script using cURL
set -e

# Create temporary directory
TEMP_DIR=$(mktemp -d)

# Function to cleanup on exit
cleanup() {
    rm -rf "$TEMP_DIR"
}

# Set up trap for cleanup
trap cleanup EXIT

# Function to get repository info
get_repo_info() {
    if [ -n "$GITHUB_REPOSITORY" ]; then
        echo "$GITHUB_REPOSITORY"
    else
        # Try to get repo info from git if available
        if command -v git &> /dev/null; then
            git config --get remote.origin.url | sed 's/.*github.com[:/]//;s/\.git$//'
        else
            echo "kieth1205/dev-global-setup"  # fallback to default
        fi
    fi
}

REPO=$(get_repo_info)
INSTALLER_URL="https://raw.githubusercontent.com/$REPO/main/src/installers/linux_installer.sh"

# Check if running in CI environment
if [ "$CI" == "true" ]; then
    echo "Running in CI environment, skipping root check"
    echo "Downloading installer from: $INSTALLER_URL"
    # Download and execute the main setup script
    if ! curl -sSL "$INSTALLER_URL" -o "$TEMP_DIR/setup.sh"; then
        echo "Error: Failed to download installer script"
        exit 1
    fi
    chmod +x "$TEMP_DIR/setup.sh"
    # Execute the setup script
    "$TEMP_DIR/setup.sh"
else
    # Check if running as root
    if [ "$EUID" -ne 0 ]; then 
        echo "Please run this script as root or with sudo"
        exit 1
    fi
    echo "Downloading installer from: $INSTALLER_URL"
    # Download and execute the main setup script
    if ! curl -sSL "$INSTALLER_URL" -o "$TEMP_DIR/setup.sh"; then
        echo "Error: Failed to download installer script"
        exit 1
    fi
    chmod +x "$TEMP_DIR/setup.sh"
    # Execute the setup script
    "$TEMP_DIR/setup.sh"
fi 