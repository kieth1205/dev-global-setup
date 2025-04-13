#!/bin/bash

# Version information
VERSION="1.0.0"
CONFIG_VERSION="1.0.0"

# Deployment URLs
WINDOWS_IRM_URL="https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/windows_irm.ps1"
MACOS_CURL_URL="https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/macos_curl.sh"
LINUX_CURL_URL="https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/linux_curl.sh"

# URLs and endpoints
HOMEBREW_INSTALL_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
OH_MY_ZSH_INSTALL_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
ZSH_AUTOSUGGESTIONS_URL="https://github.com/zsh-users/zsh-autosuggestions"
ZSH_SYNTAX_HIGHLIGHTING_URL="https://github.com/zsh-users/zsh-syntax-highlighting"

# Package versions
NODE_VERSION="18"
PYTHON_VERSION="3.11"
JAVA_VERSION="17"
GO_VERSION="1.21"
RUST_VERSION="stable"

# Directory paths
INSTALL_DIR="/usr/local"
CONFIG_DIR="$HOME/.config/dev-setup"
LOG_DIR="$HOME/.config/dev-setup/logs"
BACKUP_DIR="$HOME/.config/dev-setup/backups"

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

# Logging configuration
LOG_LEVEL="INFO" # DEBUG, INFO, WARN, ERROR
LOG_FILE="$LOG_DIR/setup_$(date +%Y%m%d_%H%M%S).log"

# Security settings
VERIFY_SIGNATURES=true
ENCRYPT_CONFIG=true
MAX_RETRIES=3
TIMEOUT=300

# Package managers
PACKAGE_MANAGERS=(
    "brew"  # macOS
    "apt"   # Debian/Ubuntu
    "yum"   # RHEL/CentOS
    "pacman" # Arch Linux
    "choco" # Windows
)

# Development types
DEV_TYPES=(
    "web"
    "mobile"
    "backend"
    "devops"
    "data_science"
    "game"
    "embedded"
)

# Programming languages
LANGUAGES=(
    "javascript"
    "python"
    "java"
    "go"
    "rust"
    "c"
    "php"
    "ruby"
    "swift"
    "kotlin"
    "dart"
    "elixir"
    "scala"
    "haskell"
    "clojure"
)

# Development tools
TOOLS=(
    "ide"
    "version_managers"
    "databases"
    "containers"
    "testing"
    "monitoring"
    "security"
    "ci_cd"
    "project_management"
    "documentation"
    "other"
) 