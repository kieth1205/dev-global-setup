#!/bin/bash

# Source configuration and utilities
source "$(dirname "$0")/../config/config.sh"
source "$(dirname "$0")/../utils/utils.sh"

# Initialize setup
initialize_setup() {
    log "INFO" "Initializing setup..."
    
    # Create necessary directories
    mkdir -p "$CONFIG_DIR" "$LOG_DIR" "$BACKUP_DIR"
    
    # Check system requirements
    check_requirements
    
    # Set up logging
    touch "$LOG_FILE"
    log "INFO" "Log file created: $LOG_FILE"
}

# Language selection
select_language() {
    print_header
    print_section "Language Selection / Lựa chọn ngôn ngữ"
    echo "1. English"
    echo "2. Tiếng Việt"
    echo "0. ${ERROR_ICON} Exit / Thoát"
    
    while true; do
        read -p "$(print_question "Enter your choice (0-2) / Nhập lựa chọn (0-2): ")" lang_choice
        
        case $lang_choice in
            1) setup_english; break ;;
            2) setup_vietnamese; break ;;
            0) exit 0 ;;
            *) print_error "$INVALID_CHOICE" ;;
        esac
    done
}

# OS-specific setup
setup_os() {
    print_header
    print_section "$SELECT_OS"
    echo "$OS_MACOS"
    echo "$OS_LINUX"
    echo "$OS_WINDOWS"
    
    while true; do
        read -p "$(print_question "Enter your choice (1-3): ")" os_choice
        
        case $os_choice in
            1) setup_macos; break ;;
            2) setup_linux; break ;;
            3) setup_windows; break ;;
            *) print_error "$INVALID_CHOICE" ;;
        esac
    done
}

# Development type selection
select_dev_type() {
    print_header
    print_section "$SELECT_DEV_TYPE"
    echo "$DEV_TYPE_WEB"
    echo "$DEV_TYPE_MOBILE"
    echo "$DEV_TYPE_BACKEND"
    echo "$DEV_TYPE_DEVOPS"
    echo "$DEV_TYPE_DATA"
    echo "$DEV_TYPE_GAME"
    echo "$DEV_TYPE_EMBEDDED"
    
    while true; do
        read -p "$(print_question "Enter your choice (1-7): ")" dev_choice
        
        case $dev_choice in
            1) setup_web_dev; break ;;
            2) setup_mobile_dev; break ;;
            3) setup_backend_dev; break ;;
            4) setup_devops; break ;;
            5) setup_data_science; break ;;
            6) setup_game_dev; break ;;
            7) setup_embedded; break ;;
            *) print_error "$INVALID_CHOICE" ;;
        esac
    done
}

# Main setup function
main() {
    # Initialize setup
    initialize_setup
    
    # Select language
    select_language
    
    # Select OS
    setup_os
    
    # Select development type
    select_dev_type
    
    # Install selected components
    install_components
    
    # Complete setup
    complete_setup
}

# Start setup
main 