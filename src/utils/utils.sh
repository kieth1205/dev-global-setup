#!/bin/bash

# Source configuration
source "$(dirname "$0")/../config/config.sh"

# Logging functions
log() {
    local level=$1
    local message=$2
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    
    case $level in
        "DEBUG")
            if [ "$LOG_LEVEL" = "DEBUG" ]; then
                echo -e "${BLUE}[DEBUG] $timestamp - $message${NC}"
            fi
            ;;
        "INFO")
            echo -e "${GREEN}[INFO] $timestamp - $message${NC}"
            ;;
        "WARN")
            echo -e "${YELLOW}[WARN] $timestamp - $message${NC}"
            ;;
        "ERROR")
            echo -e "${RED}[ERROR] $timestamp - $message${NC}"
            ;;
    esac
    
    echo "[$level] $timestamp - $message" >> "$LOG_FILE"
}

# System check functions
check_requirements() {
    log "INFO" "Checking system requirements..."
    
    # Check OS
    case "$(uname -s)" in
        Darwin*)  OS="macos" ;;
        Linux*)   OS="linux" ;;
        MINGW*)   OS="windows" ;;
        *)        log "ERROR" "Unsupported OS"; exit 1 ;;
    esac
    
    # Check memory
    local mem_total=$(free -m | awk '/^Mem:/{print $2}')
    if [ "$mem_total" -lt 2048 ]; then
        log "WARN" "Low memory detected. Recommended minimum is 2GB."
    fi
    
    # Check disk space
    local disk_space=$(df -h / | awk 'NR==2 {print $4}')
    if [ "${disk_space%G}" -lt 10 ]; then
        log "WARN" "Low disk space detected. Recommended minimum is 10GB free."
    fi
}

# Security functions
verify_signature() {
    local file=$1
    local sig_file=$2
    
    if [ "$VERIFY_SIGNATURES" = true ]; then
        if ! gpg --verify "$sig_file" "$file" 2>/dev/null; then
            log "ERROR" "Signature verification failed for $file"
            return 1
        fi
    fi
    return 0
}

# Installation functions
install_package() {
    local name=$1
    local command=$2
    local timeout=$3
    local retries=$4
    
    log "INFO" "Installing $name..."
    
    for ((i=1; i<=retries; i++)); do
        if timeout $timeout bash -c "$command"; then
            log "INFO" "Successfully installed $name"
            return 0
        else
            log "WARN" "Attempt $i failed to install $name"
            if [ $i -lt $retries ]; then
                sleep 5
            fi
        fi
    done
    
    log "ERROR" "Failed to install $name after $retries attempts"
    return 1
}

# Backup and restore functions
create_backup() {
    local target=$1
    local backup_name="backup_$(date +%Y%m%d_%H%M%S)_$(basename $target)"
    
    log "INFO" "Creating backup of $target..."
    
    if [ -d "$target" ]; then
        tar -czf "$BACKUP_DIR/$backup_name.tar.gz" "$target"
    else
        cp "$target" "$BACKUP_DIR/$backup_name"
    fi
    
    if [ $? -eq 0 ]; then
        log "INFO" "Backup created successfully: $backup_name"
        return 0
    else
        log "ERROR" "Failed to create backup of $target"
        return 1
    fi
}

restore_backup() {
    local backup_name=$1
    local target=$2
    
    log "INFO" "Restoring backup $backup_name to $target..."
    
    if [ -f "$BACKUP_DIR/$backup_name.tar.gz" ]; then
        tar -xzf "$BACKUP_DIR/$backup_name.tar.gz" -C "$(dirname $target)"
    else
        cp "$BACKUP_DIR/$backup_name" "$target"
    fi
    
    if [ $? -eq 0 ]; then
        log "INFO" "Backup restored successfully"
        return 0
    else
        log "ERROR" "Failed to restore backup"
        return 1
    fi
}

# UI functions
print_header() {
    clear
    echo -e "${BLUE}==========================================${NC}"
    echo -e "${BLUE}  Global Development Environment Setup    ${NC}"
    echo -e "${BLUE}==========================================${NC}"
    echo
}

print_section() {
    echo -e "${YELLOW}$1${NC}"
    echo
}

print_question() {
    echo -e "${BLUE}$1${NC}"
}

print_success() {
    echo -e "${GREEN}$1${NC}"
}

print_error() {
    echo -e "${RED}$1${NC}"
}

print_warning() {
    echo -e "${YELLOW}$1${NC}"
}

# Progress bar
show_progress() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Validation functions
validate_input() {
    local input=$1
    local pattern=$2
    
    if [[ $input =~ $pattern ]]; then
        return 0
    else
        return 1
    fi
}

validate_path() {
    local path=$1
    
    if [ -e "$path" ]; then
        return 0
    else
        return 1
    fi
}

# Cleanup functions
cleanup() {
    log "INFO" "Cleaning up temporary files..."
    rm -rf /tmp/dev-setup-*
}

# Error handling
handle_error() {
    local error_code=$1
    local error_message=$2
    
    log "ERROR" "Error $error_code: $error_message"
    cleanup
    exit $error_code
}

# Setup completion
complete_setup() {
    log "INFO" "Setup completed successfully"
    print_success "${SUCCESS_ICON} Setup completed successfully!"
    cleanup
    exit 0
} 