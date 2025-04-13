#!/bin/bash

# Linux installer script
set -e

echo "Starting Linux installation..."

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

echo "Linux installation completed successfully!" 