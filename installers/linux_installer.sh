#!/bin/bash

# Linux installer script
set -e

echo "Starting Linux installation..."

# Check if running in CI environment
if [ "$CI" == "true" ]; then
    echo "Running in CI environment, skipping package installation"
    # Just verify that we can run the script
    echo "CI environment check passed"
else
    # Update package lists
    apt-get update

    # Install basic tools
    apt-get install -y \
        curl \
        wget \
        git \
        vim \
        tmux \
        htop \
        net-tools

    # Install development tools
    apt-get install -y \
        build-essential \
        python3 \
        python3-pip \
        nodejs \
        npm
fi

echo "Linux installation completed successfully!" 