#!/bin/bash

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