#!/bin/bash

# Rollback configuration
ROLLBACK_DIR="$HOME/.dev-setup/rollback"
ROLLBACK_FILE="$ROLLBACK_DIR/rollback_$(date +%Y%m%d_%H%M%S).sh"

# Create rollback directory if it doesn't exist
mkdir -p "$ROLLBACK_DIR"

# Function to initialize rollback
setup_rollback() {
    # Create rollback file
    touch "$ROLLBACK_FILE"
    chmod +x "$ROLLBACK_FILE"
    
    # Add shebang and header
    echo "#!/bin/bash" > "$ROLLBACK_FILE"
    echo "# Rollback script generated at $(date)" >> "$ROLLBACK_FILE"
    echo "# This script will undo the changes made during installation" >> "$ROLLBACK_FILE"
    echo "" >> "$ROLLBACK_FILE"
}

# Function to add a rollback step
add_rollback_step() {
    local step=$1
    local command=$2
    
    echo "# Rollback step: $step" >> "$ROLLBACK_FILE"
    echo "$command" >> "$ROLLBACK_FILE"
    echo "" >> "$ROLLBACK_FILE"
}

# Function to execute rollback
execute_rollback() {
    if [ -f "$ROLLBACK_FILE" ]; then
        log_warning "Executing rollback..."
        bash "$ROLLBACK_FILE"
        if [ $? -eq 0 ]; then
            log_success "Rollback completed successfully"
        else
            log_error "Rollback failed"
        fi
    else
        log_warning "No rollback file found"
    fi
}

# Function to rollback package installation
rollback_package() {
    local package=$1
    local os=$2
    
    case $os in
        "macos")
            add_rollback_step "Uninstall $package" "brew uninstall $package"
            ;;
        "linux")
            case $LINUX_DISTRO in
                "Ubuntu"|"Debian")
                    add_rollback_step "Uninstall $package" "sudo apt-get remove -y $package"
                    ;;
                "Fedora")
                    add_rollback_step "Uninstall $package" "sudo dnf remove -y $package"
                    ;;
                "CentOS")
                    add_rollback_step "Uninstall $package" "sudo yum remove -y $package"
                    ;;
                "Arch")
                    add_rollback_step "Uninstall $package" "sudo pacman -R --noconfirm $package"
                    ;;
            esac
            ;;
        "windows")
            add_rollback_step "Uninstall $package" "choco uninstall $package -y"
            ;;
    esac
}

# Function to rollback configuration changes
rollback_config() {
    local config_file=$1
    local backup_file="$config_file.bak"
    
    if [ -f "$backup_file" ]; then
        add_rollback_step "Restore $config_file" "mv $backup_file $config_file"
    fi
}

# Function to rollback environment variables
rollback_env() {
    local env_file=$1
    local backup_file="$env_file.bak"
    
    if [ -f "$backup_file" ]; then
        add_rollback_step "Restore $env_file" "mv $backup_file $env_file"
    fi
}

# Function to rollback directory creation
rollback_directory() {
    local directory=$1
    
    if [ -d "$directory" ]; then
        add_rollback_step "Remove $directory" "rm -rf $directory"
    fi
}

# Export functions
export -f setup_rollback
export -f add_rollback_step
export -f execute_rollback
export -f rollback_package
export -f rollback_config
export -f rollback_env
export -f rollback_directory 