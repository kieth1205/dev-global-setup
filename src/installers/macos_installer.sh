#!/bin/bash

# macOS installer script
set -e

echo "Starting macOS installation..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
brew update

# Install basic tools
brew install \
    curl \
    wget \
    git \
    vim \
    tmux \
    htop

# Install development tools
brew install \
    python \
    node \
    npm

echo "macOS installation completed successfully!" 