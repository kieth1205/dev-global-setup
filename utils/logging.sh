#!/bin/bash

# Logging configuration
LOG_DIR="$HOME/.dev-setup/logs"
LOG_FILE="$LOG_DIR/setup_$(date +%Y%m%d_%H%M%S).log"

# Create log directory if it doesn't exist
mkdir -p "$LOG_DIR"

# Function to initialize logging
setup_logging() {
    # Create log file
    touch "$LOG_FILE"
    
    # Redirect stdout and stderr to log file
    exec 1> >(tee -a "$LOG_FILE")
    exec 2>&1
    
    # Log script start
    log_info "Script started at $(date)"
    log_info "Operating System: $(uname -s)"
    log_info "Architecture: $(uname -m)"
    log_info "User: $(whoami)"
}

# Function to log info messages
log_info() {
    echo "[INFO] $(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Function to log warning messages
log_warning() {
    echo "[WARNING] $(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Function to log error messages
log_error() {
    echo "[ERROR] $(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Function to log success messages
log_success() {
    echo "[SUCCESS] $(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Function to log command execution
log_command() {
    echo "[COMMAND] $(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Function to log command output
log_output() {
    echo "[OUTPUT] $(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Function to log command error
log_error_output() {
    echo "[ERROR OUTPUT] $(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Function to log script end
log_script_end() {
    log_info "Script ended at $(date)"
    log_info "Total execution time: $SECONDS seconds"
}

# Export functions
export -f setup_logging
export -f log_info
export -f log_warning
export -f log_error
export -f log_success
export -f log_command
export -f log_output
export -f log_error_output
export -f log_script_end 