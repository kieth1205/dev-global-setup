#!/bin/bash

# Linux specific configuration
export LINUX_DISTRO=$(lsb_release -si)
export LINUX_VERSION=$(lsb_release -sr)
export LINUX_CODENAME=$(lsb_release -sc)
export LINUX_ARCH=$(uname -m)

# Package manager configuration
case $LINUX_DISTRO in
    "Ubuntu"|"Debian")
        export PKG_MANAGER="apt-get"
        export PKG_INSTALL="sudo apt-get install -y"
        export PKG_UPDATE="sudo apt-get update"
        export PKG_UPGRADE="sudo apt-get upgrade -y"
        ;;
    "Fedora")
        export PKG_MANAGER="dnf"
        export PKG_INSTALL="sudo dnf install -y"
        export PKG_UPDATE="sudo dnf update -y"
        export PKG_UPGRADE="sudo dnf upgrade -y"
        ;;
    "CentOS")
        export PKG_MANAGER="yum"
        export PKG_INSTALL="sudo yum install -y"
        export PKG_UPDATE="sudo yum update -y"
        export PKG_UPGRADE="sudo yum upgrade -y"
        ;;
    "Arch")
        export PKG_MANAGER="pacman"
        export PKG_INSTALL="sudo pacman -S --noconfirm"
        export PKG_UPDATE="sudo pacman -Syu --noconfirm"
        export PKG_UPGRADE="sudo pacman -Syu --noconfirm"
        ;;
    *)
        echo "Unsupported Linux distribution"
        exit 1
        ;;
esac

# Java configuration
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-$LINUX_ARCH"
export PATH=$JAVA_HOME/bin:$PATH

# Node.js configuration
export NODE_VERSION="18"
export NPM_CONFIG_PREFIX="$HOME/.npm-global"
export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"

# Python configuration
export PYTHON_VERSION="3.11"
export PYTHONPATH="$HOME/.local/lib/python$PYTHON_VERSION/site-packages:$PYTHONPATH"
export PATH="$HOME/.local/bin:$PATH"

# Ruby configuration
export RUBY_VERSION="3.2"
export GEM_HOME="$HOME/.gem/ruby/$RUBY_VERSION.0"
export PATH="$GEM_HOME/bin:$PATH"

# Go configuration
export GO_VERSION="1.21"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Rust configuration
export RUST_VERSION="1.75"
export CARGO_HOME="$HOME/.cargo"
export PATH="$CARGO_HOME/bin:$PATH"

# Android configuration
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

# Export all variables
export LINUX_DISTRO
export LINUX_VERSION
export LINUX_CODENAME
export LINUX_ARCH
export PKG_MANAGER
export PKG_INSTALL
export PKG_UPDATE
export PKG_UPGRADE
export JAVA_HOME
export NODE_VERSION
export NPM_CONFIG_PREFIX
export PYTHON_VERSION
export PYTHONPATH
export RUBY_VERSION
export GEM_HOME
export GO_VERSION
export GOPATH
export RUST_VERSION
export CARGO_HOME
export ANDROID_HOME 