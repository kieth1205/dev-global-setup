#!/bin/bash

# Download and source configuration
curl -s -o /tmp/config.sh https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/config.sh
curl -s -o /tmp/utils.sh https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/utils.sh
source /tmp/config.sh
source /tmp/utils.sh

# Set OS-specific variables
OS="windows"
GITHUB_REPO_OWNER="kieth1205"
GITHUB_REPO_NAME="dev-global-setup"
GITHUB_BRANCH="main"

# Check GitHub repository
check_github_repo

# Check system requirements
check_requirements

# Install Chocolatey
if ! command_exists choco; then
    print_section "Installing Chocolatey / Cài đặt Chocolatey"
    print_info "This may take a few minutes... / Quá trình này có thể mất vài phút..."
    progress_bar 20 8
    powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('${CHOCOLATEY_INSTALL_URL}'))"
fi

# Install Node.js
if ! command_exists node; then
    install_package "Node.js" "choco install nodejs -y" 30 10
fi

# Install pnpm
if ! command_exists pnpm; then
    install_package "pnpm" "npm install -g pnpm" 15 5
fi

# Install Watchman
if ! command_exists watchman; then
    install_package "Watchman" "choco install watchman -y" 15 5
fi

# Install JDK
if ! command_exists java; then
    install_package "JDK" "choco install openjdk -y" 30 10
    echo "export JAVA_HOME=C:\Program Files\OpenJDK\jdk-${JAVA_VERSION}" >> ~/.zshrc
    echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshrc
    source ~/.zshrc
fi

print_success "Setup completed! / Cài đặt hoàn tất!"
print_warning "Please restart your terminal to apply changes. / Vui lòng khởi động lại terminal để áp dụng các thay đổi."
print_info "Next steps: / Các bước tiếp theo:"
print_info "Install Android Studio / Cài đặt Android Studio"
print_info "Create your first project / Tạo dự án đầu tiên"

# Clean up
rm -f /tmp/config.sh /tmp/utils.sh 