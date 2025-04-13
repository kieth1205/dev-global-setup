#!/bin/bash

# Source config files
source "$(dirname "$0")/../config/colors.sh"
source "$(dirname "$0")/../config/messages.sh"

# Function to display development type selection menu
show_dev_type_menu() {
    echo -e "\n${BLUE}$SELECT_DEV_TYPE${NC}"
    echo "$DEV_TYPE_WEB"
    echo "$DEV_TYPE_MOBILE"
    echo "$DEV_TYPE_BACKEND"
    echo "$DEV_TYPE_DEVOPS"
    echo "$DEV_TYPE_DATA"
    echo "$DEV_TYPE_GAME"
    echo "$DEV_TYPE_EMBEDDED"
    read -p "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): " dev_type_choices
} 