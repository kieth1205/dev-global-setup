#!/bin/bash

# Source configuration and utilities
source "$(dirname "$0")/../config/config.sh"
source "$(dirname "$0")/../utils/utils.sh"

# macOS specific setup
setup_macos() {
    log "INFO" "Starting macOS setup..."
    
    # Check if running on macOS
    if [ "$(uname)" != "Darwin" ]; then
        handle_error 1 "This script can only be run on macOS"
    fi
    
    # Install Homebrew
    install_homebrew
    
    # Install basic tools
    install_basic_tools
    
    # Install development tools
    install_dev_tools
    
    # Configure system settings
    configure_system
}

# Install Homebrew
install_homebrew() {
    log "INFO" "Installing Homebrew..."
    
    if ! command_exists brew; then
        # Download installation script
        local brew_script="/tmp/brew_install.sh"
        curl -fsSL "$HOMEBREW_INSTALL_URL" -o "$brew_script"
        
        # Verify script signature
        if ! verify_signature "$brew_script" "${brew_script}.sig"; then
            handle_error 2 "Failed to verify Homebrew installation script"
        fi
        
        # Install Homebrew
        if ! install_package "Homebrew" "/bin/bash -c \"\$(cat $brew_script)\"" 30 3; then
            handle_error 3 "Failed to install Homebrew"
        fi
        
        # Configure shell
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
        eval "$(/opt/homebrew/bin/brew shellenv)"
        
        # Cleanup
        rm "$brew_script"
    else
        log "INFO" "Homebrew is already installed"
    fi
}

# Install basic tools
install_basic_tools() {
    log "INFO" "Installing basic tools..."
    
    # Install Git
    if ! command_exists git; then
        install_package "Git" "brew install git" 15 3
    fi
    
    # Install Zsh
    if ! command_exists zsh; then
        install_package "Zsh" "brew install zsh" 15 3
    fi
    
    # Install Oh My Zsh
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        install_package "Oh My Zsh" "sh -c \"\$(curl -fsSL $OH_MY_ZSH_INSTALL_URL)\"" 20 3
    fi
    
    # Install Zsh plugins
    install_zsh_plugins
}

# Install Zsh plugins
install_zsh_plugins() {
    log "INFO" "Installing Zsh plugins..."
    
    # zsh-autosuggestions
    if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
        install_package "zsh-autosuggestions" \
            "git clone $ZSH_AUTOSUGGESTIONS_URL ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" \
            10 3
    fi
    
    # zsh-syntax-highlighting
    if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
        install_package "zsh-syntax-highlighting" \
            "git clone $ZSH_SYNTAX_HIGHLIGHTING_URL ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" \
            10 3
    fi
}

# Install development tools
install_dev_tools() {
    log "INFO" "Installing development tools..."
    
    # Install Node.js
    if ! command_exists node; then
        install_package "Node.js" "brew install node@$NODE_VERSION" 20 3
    fi
    
    # Install Python
    if ! command_exists python3; then
        install_package "Python" "brew install python@$PYTHON_VERSION" 20 3
    fi
    
    # Install Java
    if ! command_exists java; then
        install_package "Java" "brew install openjdk@$JAVA_VERSION" 20 3
    fi
    
    # Install Go
    if ! command_exists go; then
        install_package "Go" "brew install go@$GO_VERSION" 20 3
    fi
    
    # Install Rust
    if ! command_exists rustc; then
        install_package "Rust" "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y" 30 3
    fi
}

# Configure system settings
configure_system() {
    log "INFO" "Configuring system settings..."
    
    # Increase file descriptor limits
    sudo launchctl limit maxfiles 65536 200000
    
    # Configure macOS settings
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock autohide-delay -float 0
    defaults write com.apple.dock autohide-time-modifier -float 0.5
    defaults write com.apple.finder AppleShowAllFiles -bool true
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
    
    # Restart affected applications
    killall Dock Finder
}

# Export functions
export -f setup_macos
export -f install_homebrew
export -f install_basic_tools
export -f install_zsh_plugins
export -f install_dev_tools
export -f configure_system 