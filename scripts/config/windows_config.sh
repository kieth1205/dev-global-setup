#!/bin/bash

# Windows specific configuration
export WINDOWS_VERSION=$(cmd.exe /c ver)
export WINDOWS_ARCH=$(uname -m)

# Chocolatey configuration
export CHOCOLATEY_HOME="$HOME/AppData/Local/chocolatey"
export CHOCOLATEY_BIN="$CHOCOLATEY_HOME/bin"
export PATH="$CHOCOLATEY_BIN:$PATH"

# Java configuration
export JAVA_HOME="$ProgramFiles/Java/jdk-17"
export PATH="$JAVA_HOME/bin:$PATH"

# Node.js configuration
export NODE_VERSION="18"
export NPM_CONFIG_PREFIX="$HOME/AppData/Roaming/npm"
export PATH="$NPM_CONFIG_PREFIX:$PATH"

# Python configuration
export PYTHON_VERSION="3.11"
export PYTHONPATH="$HOME/AppData/Local/Programs/Python/Python$PYTHON_VERSION:$PYTHONPATH"
export PATH="$HOME/AppData/Local/Programs/Python/Python$PYTHON_VERSION:$PATH"

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
export ANDROID_HOME="$HOME/AppData/Local/Android/Sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

# Visual Studio configuration
export VS_INSTALL_DIR="$ProgramFiles/Microsoft Visual Studio/2022/Community"
export MSBUILD_PATH="$VS_INSTALL_DIR/MSBuild/Current/Bin"
export PATH="$MSBUILD_PATH:$PATH"

# Git configuration
export GIT_HOME="$ProgramFiles/Git"
export PATH="$GIT_HOME/bin:$PATH"

# Export all variables
export WINDOWS_VERSION
export WINDOWS_ARCH
export CHOCOLATEY_HOME
export CHOCOLATEY_BIN
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
export VS_INSTALL_DIR
export MSBUILD_PATH
export GIT_HOME 