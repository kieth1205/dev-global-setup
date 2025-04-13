#!/bin/bash

# Download and source configuration
curl -s -o /tmp/config.sh https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/config.sh
curl -s -o /tmp/utils.sh https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/utils.sh
source /tmp/config.sh
source /tmp/utils.sh

# Set OS-specific variables
OS="macos"
GITHUB_REPO_OWNER="kieth1205"
GITHUB_REPO_NAME="dev-global-setup"
GITHUB_BRANCH="main"

# Check GitHub repository
check_github_repo

# Check system requirements
check_requirements

# Install Homebrew
if ! command_exists brew; then
    install_package "Homebrew" "/bin/bash -c \"\$(curl -fsSL ${HOMEBREW_INSTALL_URL})\"" 30 10
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install Zsh and Oh My Zsh
if ! command_exists zsh; then
    install_package "Zsh" "brew install zsh" 15 5
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    install_package "Oh My Zsh" "sh -c \"\$(curl -fsSL ${OH_MY_ZSH_INSTALL_URL})\"" 20 8
fi

# Install Zsh plugins
print_section "Installing Zsh plugins / Cài đặt plugin Zsh"
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    install_package "zsh-autosuggestions" "git clone ${ZSH_AUTOSUGGESTIONS_URL} ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" 10 4
fi

if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    install_package "zsh-syntax-highlighting" "git clone ${ZSH_SYNTAX_HIGHLIGHTING_URL} ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" 10 4
fi

# Install Node.js
if ! command_exists node; then
    install_package "Node.js" "brew install node@${NODE_VERSION}" 20 8
fi

# Install pnpm
if ! command_exists pnpm; then
    install_package "pnpm" "npm install -g pnpm" 15 5
fi

# Install Watchman
if ! command_exists watchman; then
    install_package "Watchman" "brew install watchman" 15 5
fi

# Install CocoaPods
if ! command_exists pod; then
    install_package "CocoaPods" "brew install cocoapods" 20 8
fi

# Install JDK
if ! command_exists java; then
    install_package "JDK" "brew install openjdk@${JAVA_VERSION}" 30 10
    sudo ln -sfn /usr/local/opt/openjdk@${JAVA_VERSION}/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-${JAVA_VERSION}.jdk
    echo "export JAVA_HOME=\$(/usr/libexec/java_home -v${JAVA_VERSION})" >> ~/.zshrc
    echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshrc
    source ~/.zshrc
fi

# Install Xcode Command Line Tools
if ! xcode-select -p &> /dev/null; then
    install_package "Xcode Command Line Tools" "xcode-select --install" 30 10
fi

print_success "Setup completed! / Cài đặt hoàn tất!"
print_warning "Please restart your terminal to apply changes. / Vui lòng khởi động lại terminal để áp dụng các thay đổi."
print_info "Next steps: / Các bước tiếp theo:"
print_info "Install Android Studio / Cài đặt Android Studio"
print_info "Install Xcode / Cài đặt Xcode"
print_info "Create your first project / Tạo dự án đầu tiên"

# Clean up
rm -f /tmp/config.sh /tmp/utils.sh 