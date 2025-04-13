#!/bin/bash

# Source test utilities
source "$(dirname "$0")/test_utils.sh"

# Test logging functions
test_logging() {
    echo "Testing logging functions..."
    
    # Test INFO level
    log "INFO" "Test info message"
    assert_file_contains "$LOG_FILE" "Test info message"
    
    # Test WARN level
    log "WARN" "Test warning message"
    assert_file_contains "$LOG_FILE" "Test warning message"
    
    # Test ERROR level
    log "ERROR" "Test error message"
    assert_file_contains "$LOG_FILE" "Test error message"
    
    # Test DEBUG level
    LOG_LEVEL="DEBUG"
    log "DEBUG" "Test debug message"
    assert_file_contains "$LOG_FILE" "Test debug message"
}

# Test system check functions
test_system_checks() {
    echo "Testing system check functions..."
    
    # Test OS detection
    check_requirements
    assert_not_empty "$OS"
    
    # Test memory check
    local mem_total=$(free -m | awk '/^Mem:/{print $2}')
    if [ "$mem_total" -lt 2048 ]; then
        assert_file_contains "$LOG_FILE" "Low memory detected"
    fi
    
    # Test disk space check
    local disk_space=$(df -h / | awk 'NR==2 {print $4}')
    if [ "${disk_space%G}" -lt 10 ]; then
        assert_file_contains "$LOG_FILE" "Low disk space detected"
    fi
}

# Test security functions
test_security() {
    echo "Testing security functions..."
    
    # Create test file and signature
    echo "test" > test_file
    gpg --detach-sign test_file
    
    # Test signature verification
    assert_success verify_signature "test_file" "test_file.sig"
    
    # Cleanup
    rm test_file test_file.sig
}

# Test installation functions
test_installation() {
    echo "Testing installation functions..."
    
    # Test successful installation
    assert_success install_package "test" "true" 5 1
    
    # Test failed installation
    assert_failure install_package "test" "false" 5 1
}

# Test backup and restore functions
test_backup_restore() {
    echo "Testing backup and restore functions..."
    
    # Create test file
    echo "test" > test_file
    
    # Test backup
    assert_success create_backup "test_file"
    assert_file_exists "$BACKUP_DIR/backup_*_test_file"
    
    # Test restore
    local backup_file=$(ls -t "$BACKUP_DIR" | head -1)
    assert_success restore_backup "$backup_file" "test_file.restored"
    assert_file_exists "test_file.restored"
    
    # Cleanup
    rm test_file test_file.restored
    rm "$BACKUP_DIR/$backup_file"
}

# Test UI functions
test_ui() {
    echo "Testing UI functions..."
    
    # Test header
    local header_output=$(print_header)
    assert_contains "$header_output" "Global Development Environment Setup"
    
    # Test section
    local section_output=$(print_section "Test Section")
    assert_contains "$section_output" "Test Section"
    
    # Test question
    local question_output=$(print_question "Test Question")
    assert_contains "$question_output" "Test Question"
    
    # Test success
    local success_output=$(print_success "Test Success")
    assert_contains "$success_output" "Test Success"
    
    # Test error
    local error_output=$(print_error "Test Error")
    assert_contains "$error_output" "Test Error"
    
    # Test warning
    local warning_output=$(print_warning "Test Warning")
    assert_contains "$warning_output" "Test Warning"
}

# Test validation functions
test_validation() {
    echo "Testing validation functions..."
    
    # Test input validation
    assert_success validate_input "test" "^[a-z]+$"
    assert_failure validate_input "123" "^[a-z]+$"
    
    # Test path validation
    touch test_path
    assert_success validate_path "test_path"
    assert_failure validate_path "nonexistent_path"
    rm test_path
}

# Test cleanup functions
test_cleanup() {
    echo "Testing cleanup functions..."
    
    # Create temporary files
    touch /tmp/dev-setup-test1 /tmp/dev-setup-test2
    
    # Test cleanup
    cleanup
    assert_file_not_exists "/tmp/dev-setup-test1"
    assert_file_not_exists "/tmp/dev-setup-test2"
}

# Test error handling
test_error_handling() {
    echo "Testing error handling..."
    
    # Test error handling
    local error_output=$(handle_error 1 "Test Error" 2>&1)
    assert_contains "$error_output" "Test Error"
    assert_file_contains "$LOG_FILE" "Test Error"
}

# Main test function
main() {
    # Initialize test environment
    initialize_test_env
    
    # Run tests
    test_logging
    test_system_checks
    test_security
    test_installation
    test_backup_restore
    test_ui
    test_validation
    test_cleanup
    test_error_handling
    
    # Cleanup test environment
    cleanup_test_env
    
    # Print test results
    print_test_results
}

# Run tests
main 