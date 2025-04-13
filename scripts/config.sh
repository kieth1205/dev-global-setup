#!/bin/bash

# GitHub configuration
GITHUB_RAW_URL="https://raw.githubusercontent.com"
GITHUB_API_URL="https://api.github.com"
GITHUB_REPO_OWNER="your-username"
GITHUB_REPO_NAME="dev-global-setup"
GITHUB_BRANCH="main"

# URLs for installation scripts
HOMEBREW_INSTALL_URL="${GITHUB_RAW_URL}/Homebrew/install/HEAD/install.sh"
OH_MY_ZSH_INSTALL_URL="${GITHUB_RAW_URL}/ohmyzsh/ohmyzsh/master/tools/install.sh"
NODE_INSTALL_URL="${GITHUB_RAW_URL}/nodesource/distributions/master/install_script.sh"
CHOCOLATEY_INSTALL_URL="${GITHUB_RAW_URL}/chocolatey/choco/master/install.ps1"

# Plugin URLs
ZSH_AUTOSUGGESTIONS_URL="https://github.com/zsh-users/zsh-autosuggestions"
ZSH_SYNTAX_HIGHLIGHTING_URL="https://github.com/zsh-users/zsh-syntax-highlighting"

# Package versions
NODE_VERSION="18"
JAVA_VERSION="17"
PYTHON_VERSION="3.11"
RUBY_VERSION="3.2"
GO_VERSION="1.21"
RUST_VERSION="1.75"

# System requirements
MIN_DISK_SPACE=5000  # 5GB in MB
MIN_MEMORY=4000     # 4GB in MB
MIN_CPU_CORES=2

# Export variables
export GITHUB_RAW_URL
export GITHUB_API_URL
export GITHUB_REPO_OWNER
export GITHUB_REPO_NAME
export GITHUB_BRANCH
export HOMEBREW_INSTALL_URL
export OH_MY_ZSH_INSTALL_URL
export NODE_INSTALL_URL
export CHOCOLATEY_INSTALL_URL
export ZSH_AUTOSUGGESTIONS_URL
export ZSH_SYNTAX_HIGHLIGHTING_URL
export NODE_VERSION
export JAVA_VERSION
export PYTHON_VERSION
export RUBY_VERSION
export GO_VERSION
export RUST_VERSION
export MIN_DISK_SPACE
export MIN_MEMORY
export MIN_CPU_CORES 