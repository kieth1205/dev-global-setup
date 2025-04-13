#!/bin/bash

# macOS specific configuration
export MACOS_VERSION=$(sw_vers -productVersion)
export MACOS_BUILD=$(sw_vers -buildVersion)
export MACOS_ARCH=$(uname -m)

# Homebrew configuration
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export HOMEBREW_SHELLENV_PREFIX="/opt/homebrew"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

# Xcode configuration
export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
export SDKROOT="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk"

# Java configuration
export JAVA_HOME=$(/usr/libexec/java_home -v17)
export PATH=$JAVA_HOME/bin:$PATH

# Node.js configuration
export NODE_VERSION="18"
export NPM_CONFIG_PREFIX="$HOME/.npm-global"
export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"

# Python configuration
export PYTHON_VERSION="3.11"
export PYTHONPATH="$HOME/Library/Python/$PYTHON_VERSION/bin:$PYTHONPATH"
export PATH="$HOME/Library/Python/$PYTHON_VERSION/bin:$PATH"

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
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

# iOS configuration
export IOS_SDK_VERSION="17.2"
export IOS_SIMULATOR_VERSION="17.2"

# Export all variables
export MACOS_VERSION
export MACOS_BUILD
export MACOS_ARCH
export HOMEBREW_PREFIX
export HOMEBREW_CELLAR
export HOMEBREW_REPOSITORY
export HOMEBREW_SHELLENV_PREFIX
export HOMEBREW_NO_ANALYTICS
export HOMEBREW_NO_AUTO_UPDATE
export DEVELOPER_DIR
export SDKROOT
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
export IOS_SDK_VERSION
export IOS_SIMULATOR_VERSION 