#!/bin/bash

# Source configuration
source "$(dirname "$0")/config.sh"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Icons
INFO_ICON="ℹ️"
SUCCESS_ICON="✅"
WARNING_ICON="⚠️"
ERROR_ICON="❌"
QUESTION_ICON="❓"
SETUP_ICON="🛠️"
LANGUAGE_ICON="🌐"
OS_ICON="💻"
DEV_ICON="🚀"
TOOL_ICON="🔧"
INSTALL_ICON="📦"
CONFIG_ICON="⚙️"
TEST_ICON="🧪"
DEBUG_ICON="🔍"
SECURITY_ICON="🔒"
DATABASE_ICON="🗄️"
CONTAINER_ICON="📦"
MONITOR_ICON="📊"
CI_CD_ICON="🔄"
DOCS_ICON="📚"
OTHER_ICON="📌"

# Progress bar function
progress_bar() {
    local duration=$1
    local steps=$2
    local step=0
    local width=50
    local percent=0
    
    echo -ne "\r${BLUE}[${NC}"
    for ((i=0; i<width; i++)); do
        echo -ne " "
    done
    echo -ne "${BLUE}]${NC} ${percent}%"
    
    for ((step=1; step<=steps; step++)); do
        sleep $((duration/steps))
        percent=$((step*100/steps))
        filled=$((width*step/steps))
        empty=$((width-filled))
        
        echo -ne "\r${BLUE}[${NC}"
        for ((i=0; i<filled; i++)); do
            echo -ne "${GREEN}█${NC}"
        done
        for ((i=0; i<empty; i++)); do
            echo -ne " "
        done
        echo -ne "${BLUE}]${NC} ${percent}%"
    done
    echo
}

# Print header
print_header() {
    echo -e "\n${BLUE}==========================================${NC}"
    echo -e "${BLUE}${SETUP_ICON} Global Development Environment Setup${NC}"
    echo -e "${BLUE}==========================================${NC}\n"
}

# Print section
print_section() {
    echo -e "\n${BLUE}${1}${NC}"
    echo -e "${BLUE}------------------------------------------${NC}"
}

# Print success message
print_success() {
    echo -e "${GREEN}${SUCCESS_ICON} ${1}${NC}"
}

# Print warning message
print_warning() {
    echo -e "${YELLOW}${WARNING_ICON} ${1}${NC}"
}

# Print error message
print_error() {
    echo -e "${RED}${ERROR_ICON} ${1}${NC}"
}

# Print info message
print_info() {
    echo -e "${BLUE}${INFO_ICON} ${1}${NC}"
}

# Print question
print_question() {
    echo -e "${YELLOW}${QUESTION_ICON} ${1}${NC}"
}

# Check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Install package with progress bar
install_package() {
    local package_name=$1
    local install_command=$2
    local duration=$3
    local steps=$4
    
    print_section "Installing ${package_name} / Cài đặt ${package_name}"
    print_info "This may take a few minutes... / Quá trình này có thể mất vài phút..."
    
    # Run installation in background
    eval "$install_command" &
    local pid=$!
    
    # Show progress bar
    progress_bar $duration $steps
    
    # Wait for installation to complete
    wait $pid
    
    if [ $? -eq 0 ]; then
        print_success "${package_name} installed successfully! / ${package_name} đã được cài đặt thành công!"
    else
        print_error "Failed to install ${package_name} / Không thể cài đặt ${package_name}"
    fi
}

# Check system requirements
check_requirements() {
    print_section "Checking System Requirements / Kiểm tra yêu cầu hệ thống"
    
    # Check OS
    case "$(uname -s)" in
        Darwin)
            print_success "Operating System: macOS"
            ;;
        Linux)
            print_success "Operating System: Linux"
            ;;
        MINGW*|MSYS*|CYGWIN*)
            print_success "Operating System: Windows"
            ;;
        *)
            print_error "Unsupported operating system / Hệ điều hành không được hỗ trợ"
            exit 1
            ;;
    esac
    
    # Check available disk space
    local available_space=$(df -m . | awk 'NR==2 {print $4}')
    
    if [ "$available_space" -lt "$MIN_DISK_SPACE" ]; then
        print_warning "Low disk space. At least ${MIN_DISK_SPACE}MB is recommended. / Dung lượng đĩa thấp. Khuyến nghị ít nhất ${MIN_DISK_SPACE}MB."
    else
        print_success "Sufficient disk space available / Đủ dung lượng đĩa"
    fi
    
    # Check memory
    local total_memory=$(free -m | awk '/^Mem:/{print $2}')
    if [ "$total_memory" -lt "$MIN_MEMORY" ]; then
        print_warning "Low memory. At least ${MIN_MEMORY}MB is recommended. / Bộ nhớ thấp. Khuyến nghị ít nhất ${MIN_MEMORY}MB."
    else
        print_success "Sufficient memory available / Đủ bộ nhớ"
    fi
    
    # Check CPU cores
    local cpu_cores=$(nproc)
    if [ "$cpu_cores" -lt "$MIN_CPU_CORES" ]; then
        print_warning "Low CPU cores. At least ${MIN_CPU_CORES} cores are recommended. / Số lõi CPU thấp. Khuyến nghị ít nhất ${MIN_CPU_CORES} lõi."
    else
        print_success "Sufficient CPU cores available / Đủ số lõi CPU"
    fi
    
    # Check internet connection
    if ping -c 1 google.com &> /dev/null; then
        print_success "Internet connection available / Có kết nối internet"
    else
        print_error "No internet connection / Không có kết nối internet"
        exit 1
    fi
}

# Check GitHub repository
check_github_repo() {
    print_section "Checking GitHub Repository / Kiểm tra kho lưu trữ GitHub"
    
    # Check if repository exists
    local response=$(curl -s "${GITHUB_API_URL}/repos/${GITHUB_REPO_OWNER}/${GITHUB_REPO_NAME}")
    if [[ "$response" == *"Not Found"* ]]; then
        print_error "Repository not found / Không tìm thấy kho lưu trữ"
        exit 1
    else
        print_success "Repository found / Đã tìm thấy kho lưu trữ"
    fi
    
    # Check if branch exists
    local response=$(curl -s "${GITHUB_API_URL}/repos/${GITHUB_REPO_OWNER}/${GITHUB_REPO_NAME}/branches/${GITHUB_BRANCH}")
    if [[ "$response" == *"Not Found"* ]]; then
        print_error "Branch not found / Không tìm thấy nhánh"
        exit 1
    else
        print_success "Branch found / Đã tìm thấy nhánh"
    fi
}

# Export functions
export -f progress_bar
export -f print_header
export -f print_section
export -f print_success
export -f print_warning
export -f print_error
export -f print_info
export -f print_question
export -f command_exists
export -f install_package
export -f check_requirements
export -f check_github_repo 