#!/bin/bash

# Download and source configuration
curl -s -o /tmp/config.sh https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/config.sh
curl -s -o /tmp/utils.sh https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/utils.sh
source /tmp/config.sh
source /tmp/utils.sh

# Set OS-specific variables
OS="linux"
GITHUB_REPO_OWNER="kieth1205"
GITHUB_REPO_NAME="dev-global-setup"
GITHUB_BRANCH="main"

# Check GitHub repository
check_github_repo

# Check system requirements
check_requirements

# Update package list
print_section "Updating package list / Cập nhật danh sách gói"
print_info "This may take a few minutes... / Quá trình này có thể mất vài phút..."
progress_bar 20 8
sudo apt-get update

# Install Node.js
if ! command_exists node; then
    install_package "Node.js" "curl -fsSL ${NODE_INSTALL_URL} | sudo -E bash - && sudo apt-get install -y nodejs" 30 10
fi

# Install pnpm
if ! command_exists pnpm; then
    install_package "pnpm" "npm install -g pnpm" 15 5
fi

# Install Watchman
if ! command_exists watchman; then
    install_package "Watchman" "sudo apt-get install -y watchman" 15 5
fi

# Install JDK
if ! command_exists java; then
    install_package "JDK" "sudo apt-get install -y openjdk-${JAVA_VERSION}-jdk" 30 10
    echo "export JAVA_HOME=/usr/lib/jvm/java-${JAVA_VERSION}-openjdk-amd64" >> ~/.zshrc
    echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshrc
    source ~/.zshrc
fi

# Install Android dependencies
print_section "Installing Android dependencies / Cài đặt phụ thuộc Android"
install_package "Android dependencies" "sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386" 20 8

print_success "Setup completed! / Cài đặt hoàn tất!"
print_warning "Please restart your terminal to apply changes. / Vui lòng khởi động lại terminal để áp dụng các thay đổi."
print_info "Next steps: / Các bước tiếp theo:"
print_info "Install Android Studio / Cài đặt Android Studio"
print_info "Create your first project / Tạo dự án đầu tiên"

# Clean up
rm -f /tmp/config.sh /tmp/utils.sh 