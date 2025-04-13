#!/bin/bash

# Source config files
source "$(dirname "$0")/../config/colors.sh"
source "$(dirname "$0")/../config/messages.sh"

# Function to display language selection menu
show_language_menu() {
    echo -e "${BLUE}$SELECT_LANG${NC}"
    echo "$LANG_EN"
    echo "$LANG_VI"
    read -p "Enter your choice (1-2) / Nhập lựa chọn (1-2): " lang_choice

    case $lang_choice in
        1)
            # English messages
            SELECT_OS="Select your operating system:"
            OS_MACOS="1. macOS"
            OS_LINUX="2. Linux"
            OS_WINDOWS="3. Windows"
            INVALID_CHOICE="Invalid choice"
            START_SETUP="Starting development environment setup..."
            SELECT_DEV_TYPE="Select development type:"
            DEV_TYPE_WEB="1. Web Development"
            DEV_TYPE_MOBILE="2. Mobile Development"
            DEV_TYPE_BACKEND="3. Backend Development"
            DEV_TYPE_DEVOPS="4. DevOps"
            DEV_TYPE_DATA="5. Data Science & AI"
            DEV_TYPE_GAME="6. Game Development"
            DEV_TYPE_EMBEDDED="7. Embedded Systems"
            ;;
        2)
            # Vietnamese messages
            SELECT_OS="Chọn hệ điều hành của bạn:"
            OS_MACOS="1. macOS"
            OS_LINUX="2. Linux"
            OS_WINDOWS="3. Windows"
            INVALID_CHOICE="Lựa chọn không hợp lệ"
            START_SETUP="Bắt đầu cài đặt môi trường phát triển..."
            SELECT_DEV_TYPE="Chọn loại phát triển:"
            DEV_TYPE_WEB="1. Phát triển Web"
            DEV_TYPE_MOBILE="2. Phát triển Mobile"
            DEV_TYPE_BACKEND="3. Phát triển Backend"
            DEV_TYPE_DEVOPS="4. DevOps"
            DEV_TYPE_DATA="5. Khoa học dữ liệu & AI"
            DEV_TYPE_GAME="6. Phát triển Game"
            DEV_TYPE_EMBEDDED="7. Hệ thống nhúng"
            ;;
        *)
            echo "$INVALID_CHOICE"
            exit 1
            ;;
    esac
} 