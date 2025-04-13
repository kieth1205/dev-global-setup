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

# Function to get commit SHA
get_commit_sha() {
    if [ -n "$GITHUB_SHA" ]; then
        echo "$GITHUB_SHA"
    else
        # Try to get commit SHA from git if available
        if command -v git &> /dev/null; then
            git rev-parse HEAD
        else
            echo "main"  # fallback to main branch
        fi
    fi
}

REPO=$(get_repo_info)
COMMIT_SHA=$(get_commit_sha)
INSTALLER_URL="https://raw.githubusercontent.com/$REPO/$COMMIT_SHA/src/installers/linux_installer.sh"

# Function to check if URL exists
check_url() {
    local url=$1
    local response_code
    response_code=$(curl -sL -w "%{http_code}" "$url" -o /dev/null)
    if [ "$response_code" -eq 200 ]; then
        return 0
    else
        echo "Error: URL returned HTTP code $response_code"
        echo "Attempted URL: $url"
        return 1
    fi
}

# Check if running in CI environment
if [ "$CI" == "true" ]; then
    echo "Running in CI environment, skipping root check"
    echo "Repository: $REPO"
    echo "Commit SHA: $COMMIT_SHA"
    echo "Checking installer URL: $INSTALLER_URL"
    
    # First check if the URL exists
    if ! check_url "$INSTALLER_URL"; then
        echo "Error: Installer script not found at the specified URL"
        echo "Trying alternative URL with main branch..."
        # Try with main branch as fallback
        INSTALLER_URL="https://raw.githubusercontent.com/$REPO/main/src/installers/linux_installer.sh"
        if ! check_url "$INSTALLER_URL"; then
            echo "Error: Installer script not found at alternative URL either"
            exit 1
        fi
    fi
    
    # Download the script
    echo "Downloading installer..."
    if ! curl -sSL "$INSTALLER_URL" -o "$TEMP_DIR/setup.sh"; then
        echo "Error: Failed to download installer script"
        exit 1
    fi
    
    # Verify the downloaded file
    if [ ! -s "$TEMP_DIR/setup.sh" ]; then
        echo "Error: Downloaded file is empty"
        exit 1
    fi
    
    # Check if the file is a valid shell script
    if ! head -n 1 "$TEMP_DIR/setup.sh" | grep -q "^#!.*bash"; then
        echo "Error: Downloaded file is not a valid shell script"
        exit 1
    fi
    
    chmod +x "$TEMP_DIR/setup.sh"
    echo "Executing installer..."
    "$TEMP_DIR/setup.sh"
else
    # Check if running as root
    if [ "$EUID" -ne 0 ]; then 
        echo "Please run this script as root or with sudo"
        exit 1
    fi
    
    echo "Repository: $REPO"
    echo "Commit SHA: $COMMIT_SHA"
    echo "Checking installer URL: $INSTALLER_URL"
    
    # First check if the URL exists
    if ! check_url "$INSTALLER_URL"; then
        echo "Error: Installer script not found at the specified URL"
        echo "Trying alternative URL with main branch..."
        # Try with main branch as fallback
        INSTALLER_URL="https://raw.githubusercontent.com/$REPO/main/src/installers/linux_installer.sh"
        if ! check_url "$INSTALLER_URL"; then
            echo "Error: Installer script not found at alternative URL either"
            exit 1
        fi
    fi
    
    # Download the script
    echo "Downloading installer..."
    if ! curl -sSL "$INSTALLER_URL" -o "$TEMP_DIR/setup.sh"; then
        echo "Error: Failed to download installer script"
        exit 1
    fi
    
    # Verify the downloaded file
    if [ ! -s "$TEMP_DIR/setup.sh" ]; then
        echo "Error: Downloaded file is empty"
        exit 1
    fi
    
    # Check if the file is a valid shell script
    if ! head -n 1 "$TEMP_DIR/setup.sh" | grep -q "^#!.*bash"; then
        echo "Error: Downloaded file is not a valid shell script"
        exit 1
    fi
    
    chmod +x "$TEMP_DIR/setup.sh"
    echo "Executing installer..."
    "$TEMP_DIR/setup.sh"
fi 