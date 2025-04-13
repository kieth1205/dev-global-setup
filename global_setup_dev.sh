#!/bin/bash

# Source utility functions and configuration
source "$(dirname "$0")/scripts/utils.sh"

# Check GitHub repository
check_github_repo

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Icons
INFO_ICON="ℹ️"
SUCCESS_ICON="✅"
WARNING_ICON="⚠️"
ERROR_ICON="❌"
QUESTION_ICON="❓"
SETUP_ICON="🛠️"
LANGUAGE_ICON="🌐"
OS_ICON="💻"
DEV_ICON="🚀"
TOOL_ICON="🔧"
INSTALL_ICON="📦"
CONFIG_ICON="⚙️"
TEST_ICON="🧪"
DEBUG_ICON="🔍"
SECURITY_ICON="🔒"
DATABASE_ICON="🗄️"
CONTAINER_ICON="📦"
MONITOR_ICON="📊"
CI_CD_ICON="🔄"
DOCS_ICON="📚"
OTHER_ICON="📌"

# Language selection
print_header
print_section "Language Selection / Lựa chọn ngôn ngữ"
echo "1. English"
echo "2. Tiếng Việt"
read -p "$(print_question "Enter your choice (1-2) / Nhập lựa chọn (1-2): ")" lang_choice

# Set language variables
case $lang_choice in
    1)
        # English messages
        SELECT_OS="${OS_ICON} Select your operating system:"
        OS_MACOS="1. ${OS_ICON} macOS"
        OS_LINUX="2. ${OS_ICON} Linux"
        OS_WINDOWS="3. ${OS_ICON} Windows"
        INVALID_CHOICE="${ERROR_ICON} Invalid choice"
        START_SETUP="${SETUP_ICON} Starting development environment setup..."
        SELECT_DEV_TYPE="${DEV_ICON} Select development type:"
        DEV_TYPE_WEB="1. ${DEV_ICON} Web Development"
        DEV_TYPE_MOBILE="2. ${DEV_ICON} Mobile Development"
        DEV_TYPE_BACKEND="3. ${DEV_ICON} Backend Development"
        DEV_TYPE_DEVOPS="4. ${DEV_ICON} DevOps"
        DEV_TYPE_DATA="5. ${DEV_ICON} Data Science & AI"
        DEV_TYPE_GAME="6. ${DEV_ICON} Game Development"
        DEV_TYPE_EMBEDDED="7. ${DEV_ICON} Embedded Systems"
        SELECT_LANG="${LANGUAGE_ICON} Select programming languages:"
        LANG_JS="1. ${LANGUAGE_ICON} JavaScript/TypeScript"
        LANG_PYTHON="2. ${LANGUAGE_ICON} Python"
        LANG_JAVA="3. ${LANGUAGE_ICON} Java"
        LANG_GO="4. ${LANGUAGE_ICON} Go"
        LANG_RUST="5. ${LANGUAGE_ICON} Rust"
        LANG_C="6. ${LANGUAGE_ICON} C/C++"
        LANG_PHP="7. ${LANGUAGE_ICON} PHP"
        LANG_RUBY="8. ${LANGUAGE_ICON} Ruby"
        LANG_SWIFT="9. ${LANGUAGE_ICON} Swift"
        LANG_KOTLIN="10. ${LANGUAGE_ICON} Kotlin"
        LANG_DART="11. ${LANGUAGE_ICON} Dart"
        LANG_ELIXIR="12. ${LANGUAGE_ICON} Elixir"
        LANG_SCALA="13. ${LANGUAGE_ICON} Scala"
        LANG_HASKELL="14. ${LANGUAGE_ICON} Haskell"
        LANG_CLOJURE="15. ${LANGUAGE_ICON} Clojure"
        SELECT_TOOLS="${TOOL_ICON} Select development tools:"
        TOOLS_IDE="1. ${TOOL_ICON} IDEs & Editors"
        TOOLS_VERSION="2. ${TOOL_ICON} Version Managers"
        TOOLS_DATABASE="3. ${DATABASE_ICON} Databases"
        TOOLS_CONTAINER="4. ${CONTAINER_ICON} Container & Orchestration"
        TOOLS_TESTING="5. ${TEST_ICON} Testing Tools"
        TOOLS_MONITORING="6. ${MONITOR_ICON} Monitoring & Logging"
        TOOLS_SECURITY="7. ${SECURITY_ICON} Security Tools"
        TOOLS_CI_CD="8. ${CI_CD_ICON} CI/CD Tools"
        TOOLS_PROJECT="9. ${TOOL_ICON} Project Management"
        TOOLS_DOCS="10. ${DOCS_ICON} Documentation"
        TOOLS_OTHER="11. ${OTHER_ICON} Other Tools"
        ;;
    2)
        # Vietnamese messages
        SELECT_OS="${OS_ICON} Chọn hệ điều hành của bạn:"
        OS_MACOS="1. ${OS_ICON} macOS"
        OS_LINUX="2. ${OS_ICON} Linux"
        OS_WINDOWS="3. ${OS_ICON} Windows"
        INVALID_CHOICE="${ERROR_ICON} Lựa chọn không hợp lệ"
        START_SETUP="${SETUP_ICON} Bắt đầu cài đặt môi trường phát triển..."
        SELECT_DEV_TYPE="${DEV_ICON} Chọn loại phát triển:"
        DEV_TYPE_WEB="1. ${DEV_ICON} Phát triển Web"
        DEV_TYPE_MOBILE="2. ${DEV_ICON} Phát triển Mobile"
        DEV_TYPE_BACKEND="3. ${DEV_ICON} Phát triển Backend"
        DEV_TYPE_DEVOPS="4. ${DEV_ICON} DevOps"
        DEV_TYPE_DATA="5. ${DEV_ICON} Khoa học dữ liệu & AI"
        DEV_TYPE_GAME="6. ${DEV_ICON} Phát triển Game"
        DEV_TYPE_EMBEDDED="7. ${DEV_ICON} Hệ thống nhúng"
        SELECT_LANG="${LANGUAGE_ICON} Chọn ngôn ngữ lập trình:"
        LANG_JS="1. ${LANGUAGE_ICON} JavaScript/TypeScript"
        LANG_PYTHON="2. ${LANGUAGE_ICON} Python"
        LANG_JAVA="3. ${LANGUAGE_ICON} Java"
        LANG_GO="4. ${LANGUAGE_ICON} Go"
        LANG_RUST="5. ${LANGUAGE_ICON} Rust"
        LANG_C="6. ${LANGUAGE_ICON} C/C++"
        LANG_PHP="7. ${LANGUAGE_ICON} PHP"
        LANG_RUBY="8. ${LANGUAGE_ICON} Ruby"
        LANG_SWIFT="9. ${LANGUAGE_ICON} Swift"
        LANG_KOTLIN="10. ${LANGUAGE_ICON} Kotlin"
        LANG_DART="11. ${LANGUAGE_ICON} Dart"
        LANG_ELIXIR="12. ${LANGUAGE_ICON} Elixir"
        LANG_SCALA="13. ${LANGUAGE_ICON} Scala"
        LANG_HASKELL="14. ${LANGUAGE_ICON} Haskell"
        LANG_CLOJURE="15. ${LANGUAGE_ICON} Clojure"
        SELECT_TOOLS="${TOOL_ICON} Chọn công cụ phát triển:"
        TOOLS_IDE="1. ${TOOL_ICON} IDE & Trình soạn thảo"
        TOOLS_VERSION="2. ${TOOL_ICON} Trình quản lý phiên bản"
        TOOLS_DATABASE="3. ${DATABASE_ICON} Cơ sở dữ liệu"
        TOOLS_CONTAINER="4. ${CONTAINER_ICON} Container & Điều phối"
        TOOLS_TESTING="5. ${TEST_ICON} Công cụ kiểm thử"
        TOOLS_MONITORING="6. ${MONITOR_ICON} Giám sát & Ghi log"
        TOOLS_SECURITY="7. ${SECURITY_ICON} Công cụ bảo mật"
        TOOLS_CI_CD="8. ${CI_CD_ICON} Công cụ CI/CD"
        TOOLS_PROJECT="9. ${TOOL_ICON} Quản lý dự án"
        TOOLS_DOCS="10. ${DOCS_ICON} Tài liệu"
        TOOLS_OTHER="11. ${OTHER_ICON} Công cụ khác"
        ;;
    *)
        print_error "Invalid choice / Lựa chọn không hợp lệ"
        exit 1
        ;;
esac

# Check system requirements
check_requirements

# OS selection
print_section "Operating System Selection / Lựa chọn hệ điều hành"
echo "$OS_MACOS"
echo "$OS_LINUX"
echo "$OS_WINDOWS"
read -p "$(print_question "Enter your choice (1-3) / Nhập lựa chọn (1-3): ")" os_choice

# Set OS-specific variables
case $os_choice in
    1)
        OS="macos"
        ;;
    2)
        OS="linux"
        ;;
    3)
        OS="windows"
        ;;
    *)
        print_error "$INVALID_CHOICE"
        exit 1
        ;;
esac

print_info "$START_SETUP"

# Development type selection
print_section "Development Type Selection / Lựa chọn loại phát triển"
echo "$DEV_TYPE_WEB"
echo "$DEV_TYPE_MOBILE"
echo "$DEV_TYPE_BACKEND"
echo "$DEV_TYPE_DEVOPS"
echo "$DEV_TYPE_DATA"
echo "$DEV_TYPE_GAME"
echo "$DEV_TYPE_EMBEDDED"
read -p "$(print_question "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): ")" dev_type_choices

# Programming languages selection
print_section "Programming Languages Selection / Lựa chọn ngôn ngữ lập trình"
echo "$LANG_JS"
echo "$LANG_PYTHON"
echo "$LANG_JAVA"
echo "$LANG_GO"
echo "$LANG_RUST"
echo "$LANG_C"
echo "$LANG_PHP"
echo "$LANG_RUBY"
echo "$LANG_SWIFT"
echo "$LANG_KOTLIN"
echo "$LANG_DART"
echo "$LANG_ELIXIR"
echo "$LANG_SCALA"
echo "$LANG_HASKELL"
echo "$LANG_CLOJURE"
read -p "$(print_question "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): ")" lang_choices

# Development tools selection
print_section "Development Tools Selection / Lựa chọn công cụ phát triển"
echo "$TOOLS_IDE"
echo "$TOOLS_VERSION"
echo "$TOOLS_DATABASE"
echo "$TOOLS_CONTAINER"
echo "$TOOLS_TESTING"
echo "$TOOLS_MONITORING"
echo "$TOOLS_SECURITY"
echo "$TOOLS_CI_CD"
echo "$TOOLS_PROJECT"
echo "$TOOLS_DOCS"
echo "$TOOLS_OTHER"
read -p "$(print_question "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): ")" tools_choices

# OS-specific installations
case $OS in
    "macos")
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
        # Install zsh-autosuggestions
        if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
            install_package "zsh-autosuggestions" "git clone ${ZSH_AUTOSUGGESTIONS_URL} ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" 10 4
        fi

        # Install zsh-syntax-highlighting
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
            install_package "JDK" "brew install openjdk@17" 30 10
            sudo ln -sfn /usr/local/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
            echo 'export JAVA_HOME=$(/usr/libexec/java_home -v17)' >> ~/.zshrc
            echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshrc
            source ~/.zshrc
        fi

        # Install Xcode Command Line Tools
        if ! xcode-select -p &> /dev/null; then
            install_package "Xcode Command Line Tools" "xcode-select --install" 30 10
        fi
        ;;

    "linux")
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
            install_package "JDK" "sudo apt-get install -y openjdk-17-jdk" 30 10
            echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64' >> ~/.zshrc
            echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshrc
            source ~/.zshrc
        fi

        # Install Android dependencies
        print_section "Installing Android dependencies / Cài đặt phụ thuộc Android"
        install_package "Android dependencies" "sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386" 20 8
        ;;

    "windows")
        # Install Chocolatey (Windows package manager)
        if ! command_exists choco; then
            install_package "Chocolatey" "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('${CHOCOLATEY_INSTALL_URL}'))" 30 10
        fi

        # Install Node.js
        if (!(Get-Command node -ErrorAction SilentlyContinue)) {
            install_package "Node.js" "choco install nodejs -y" 20 8
        }

        # Install pnpm
        if (!(Get-Command pnpm -ErrorAction SilentlyContinue)) {
            install_package "pnpm" "npm install -g pnpm" 15 5
        }

        # Install JDK
        if (!(Get-Command java -ErrorAction SilentlyContinue)) {
            install_package "JDK" "choco install openjdk -y" 30 10
        }
        ;;
esac

# IDE/Editor selection
print_section "IDE/Editor Selection / Lựa chọn IDE/Trình soạn thảo"
echo "1. ${TOOL_ICON} VS Code"
echo "2. ${TOOL_ICON} WebStorm"
echo "3. ${TOOL_ICON} Android Studio"
echo "4. ${TOOL_ICON} IntelliJ IDEA"
read -p "$(print_question "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): ")" ide_choices

# Development tools selection
print_section "Development Tools Selection / Lựa chọn công cụ phát triển"
echo "1. ${TOOL_ICON} Docker"
echo "2. ${TOOL_ICON} Postman"
echo "3. ${TOOL_ICON} GitKraken"
if [[ "$OS" == "macos" ]]; then
    echo "4. ${TOOL_ICON} iTerm2"
fi
read -p "$(print_question "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): ")" dev_tool_choices

# Web development tools selection
print_section "Web Development Tools Selection / Lựa chọn công cụ phát triển web"
echo "1. ${DEV_ICON} Vite"
echo "2. ${DEV_ICON} Next.js"
echo "3. ${DEV_ICON} React"
echo "4. ${DEV_ICON} Angular"
echo "5. ${DEV_ICON} Vue"
read -p "$(print_question "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): ")" web_choices

# Mobile development tools selection
print_section "Mobile Development Tools Selection / Lựa chọn công cụ phát triển mobile"
echo "1. ${DEV_ICON} React Native"
echo "2. ${DEV_ICON} Flutter"
echo "3. ${DEV_ICON} Expo"
echo "4. ${DEV_ICON} Firebase"
echo "5. ${DEV_ICON} Ionic"
read -p "$(print_question "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): ")" mobile_choices

print_success "Setup completed! / Cài đặt hoàn tất!"
print_warning "Please restart your terminal to apply changes. / Vui lòng khởi động lại terminal để áp dụng các thay đổi."
print_info "Next steps: / Các bước tiếp theo:"
print_info "Install Android Studio / Cài đặt Android Studio"
if [[ "$OS" == "macos" ]]; then
    print_info "Install Xcode / Cài đặt Xcode"
fi
print_info "Create your first project / Tạo dự án đầu tiên" 