#!/bin/bash

# Source config files
source "$(dirname "$0")/../config/colors.sh"
source "$(dirname "$0")/../config/messages.sh"

# Function to display OS selection menu
show_os_menu() {
    echo -e "${BLUE}$SELECT_OS${NC}"
    echo "$OS_MACOS"
    echo "$OS_LINUX"
    echo "$OS_WINDOWS"
    read -p "Enter your choice (1-3) / Nhập lựa chọn (1-3): " os_choice

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
            echo "$INVALID_CHOICE"
            exit 1
            ;;
    esac
} 