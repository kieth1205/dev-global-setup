#!/bin/bash

# Test counters
TEST_COUNT=0
PASS_COUNT=0
FAIL_COUNT=0

# Test environment
TEST_DIR="/tmp/dev-setup-test"
TEST_LOG_FILE="$TEST_DIR/test.log"

# Initialize test environment
initialize_test_env() {
    mkdir -p "$TEST_DIR"
    touch "$TEST_LOG_FILE"
    LOG_FILE="$TEST_LOG_FILE"
    BACKUP_DIR="$TEST_DIR/backups"
    mkdir -p "$BACKUP_DIR"
}

# Cleanup test environment
cleanup_test_env() {
    rm -rf "$TEST_DIR"
}

# Assertion functions
assert_success() {
    ((TEST_COUNT++))
    if "$@"; then
        ((PASS_COUNT++))
        echo "✅ Test $TEST_COUNT passed"
    else
        ((FAIL_COUNT++))
        echo "❌ Test $TEST_COUNT failed: $*"
    fi
}

assert_failure() {
    ((TEST_COUNT++))
    if ! "$@"; then
        ((PASS_COUNT++))
        echo "✅ Test $TEST_COUNT passed"
    else
        ((FAIL_COUNT++))
        echo "❌ Test $TEST_COUNT failed: $*"
    fi
}

assert_contains() {
    ((TEST_COUNT++))
    if [[ "$1" == *"$2"* ]]; then
        ((PASS_COUNT++))
        echo "✅ Test $TEST_COUNT passed"
    else
        ((FAIL_COUNT++))
        echo "❌ Test $TEST_COUNT failed: '$1' does not contain '$2'"
    fi
}

assert_not_contains() {
    ((TEST_COUNT++))
    if [[ "$1" != *"$2"* ]]; then
        ((PASS_COUNT++))
        echo "✅ Test $TEST_COUNT passed"
    else
        ((FAIL_COUNT++))
        echo "❌ Test $TEST_COUNT failed: '$1' contains '$2'"
    fi
}

assert_file_exists() {
    ((TEST_COUNT++))
    if [ -f "$1" ]; then
        ((PASS_COUNT++))
        echo "✅ Test $TEST_COUNT passed"
    else
        ((FAIL_COUNT++))
        echo "❌ Test $TEST_COUNT failed: File '$1' does not exist"
    fi
}

assert_file_not_exists() {
    ((TEST_COUNT++))
    if [ ! -f "$1" ]; then
        ((PASS_COUNT++))
        echo "✅ Test $TEST_COUNT passed"
    else
        ((FAIL_COUNT++))
        echo "❌ Test $TEST_COUNT failed: File '$1' exists"
    fi
}

assert_file_contains() {
    ((TEST_COUNT++))
    if grep -q "$2" "$1"; then
        ((PASS_COUNT++))
        echo "✅ Test $TEST_COUNT passed"
    else
        ((FAIL_COUNT++))
        echo "❌ Test $TEST_COUNT failed: File '$1' does not contain '$2'"
    fi
}

assert_file_not_contains() {
    ((TEST_COUNT++))
    if ! grep -q "$2" "$1"; then
        ((PASS_COUNT++))
        echo "✅ Test $TEST_COUNT passed"
    else
        ((FAIL_COUNT++))
        echo "❌ Test $TEST_COUNT failed: File '$1' contains '$2'"
    fi
}

assert_not_empty() {
    ((TEST_COUNT++))
    if [ -n "$1" ]; then
        ((PASS_COUNT++))
        echo "✅ Test $TEST_COUNT passed"
    else
        ((FAIL_COUNT++))
        echo "❌ Test $TEST_COUNT failed: Variable is empty"
    fi
}

assert_empty() {
    ((TEST_COUNT++))
    if [ -z "$1" ]; then
        ((PASS_COUNT++))
        echo "✅ Test $TEST_COUNT passed"
    else
        ((FAIL_COUNT++))
        echo "❌ Test $TEST_COUNT failed: Variable is not empty"
    fi
}

# Print test results
print_test_results() {
    echo
    echo "Test Results:"
    echo "Total tests: $TEST_COUNT"
    echo "Passed: $PASS_COUNT"
    echo "Failed: $FAIL_COUNT"
    
    if [ $FAIL_COUNT -eq 0 ]; then
        echo "✅ All tests passed!"
        exit 0
    else
        echo "❌ Some tests failed!"
        exit 1
    fi
}

# Export functions
export -f initialize_test_env
export -f cleanup_test_env
export -f assert_success
export -f assert_failure
export -f assert_contains
export -f assert_not_contains
export -f assert_file_exists
export -f assert_file_not_exists
export -f assert_file_contains
export -f assert_file_not_contains
export -f assert_not_empty
export -f assert_empty
export -f print_test_results

# Source utility functions
source "$(dirname "$0")/../scripts/utils.sh"

# Test print functions
test_print_functions() {
    echo "Testing print functions..."
    
    # Test print_header
    print_header
    if [ $? -eq 0 ]; then
        echo "✅ print_header test passed"
    else
        echo "❌ print_header test failed"
    fi
    
    # Test print_section
    print_section "Test Section"
    if [ $? -eq 0 ]; then
        echo "✅ print_section test passed"
    else
        echo "❌ print_section test failed"
    fi
    
    # Test print_success
    print_success "Test Success"
    if [ $? -eq 0 ]; then
        echo "✅ print_success test passed"
    else
        echo "❌ print_success test failed"
    fi
    
    # Test print_warning
    print_warning "Test Warning"
    if [ $? -eq 0 ]; then
        echo "✅ print_warning test passed"
    else
        echo "❌ print_warning test failed"
    fi
    
    # Test print_error
    print_error "Test Error"
    if [ $? -eq 0 ]; then
        echo "✅ print_error test passed"
    else
        echo "❌ print_error test failed"
    fi
    
    # Test print_info
    print_info "Test Info"
    if [ $? -eq 0 ]; then
        echo "✅ print_info test passed"
    else
        echo "❌ print_info test failed"
    fi
    
    # Test print_question
    print_question "Test Question"
    if [ $? -eq 0 ]; then
        echo "✅ print_question test passed"
    else
        echo "❌ print_question test failed"
    fi
}

# Test command_exists function
test_command_exists() {
    echo "Testing command_exists function..."
    
    # Test with existing command
    command_exists ls
    if [ $? -eq 0 ]; then
        echo "✅ command_exists test with existing command passed"
    else
        echo "❌ command_exists test with existing command failed"
    fi
    
    # Test with non-existing command
    command_exists nonexistentcommand
    if [ $? -ne 0 ]; then
        echo "✅ command_exists test with non-existing command passed"
    else
        echo "❌ command_exists test with non-existing command failed"
    fi
}

# Test progress_bar function
test_progress_bar() {
    echo "Testing progress_bar function..."
    progress_bar 5 10
    if [ $? -eq 0 ]; then
        echo "✅ progress_bar test passed"
    else
        echo "❌ progress_bar test failed"
    fi
}

# Run all tests
echo "Starting tests..."
test_print_functions
test_command_exists
test_progress_bar
echo "Tests completed." 