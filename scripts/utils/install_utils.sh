#!/bin/bash

# Source config files
source "$(dirname "$0")/../config/colors.sh"
source "$(dirname "$0")/../config/messages.sh"

# Function to install Homebrew
install_homebrew() {
    if ! command -v brew &> /dev/null; then
        echo -e "${YELLOW}Installing Homebrew...${NC}"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
}

# Function to install Zsh and Oh My Zsh
install_zsh() {
    if ! command -v zsh &> /dev/null; then
        echo -e "${YELLOW}$INSTALLING_ZSH${NC}"
        brew install zsh
    fi

    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo -e "${YELLOW}$INSTALLING_OHMYZSH${NC}"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
}

# Function to install Zsh plugins
install_zsh_plugins() {
    echo -e "${YELLOW}$INSTALLING_PLUGINS${NC}"
    # Install zsh-autosuggestions
    if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    fi

    # Install zsh-syntax-highlighting
    if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    fi
}

# Function to install Node.js and pnpm
install_node() {
    if ! command -v node &> /dev/null; then
        echo -e "${YELLOW}$INSTALLING_NODE${NC}"
        brew install node
    fi

    if ! command -v pnpm &> /dev/null; then
        echo -e "${YELLOW}$INSTALLING_PNPM${NC}"
        npm install -g pnpm
    fi
}

# Function to install Watchman
install_watchman() {
    if ! command -v watchman &> /dev/null; then
        echo -e "${YELLOW}$INSTALLING_WATCHMAN${NC}"
        brew install watchman
    fi
}

# Function to install CocoaPods
install_cocoapods() {
    if ! command -v pod &> /dev/null; then
        echo -e "${YELLOW}$INSTALLING_COCOAPODS${NC}"
        brew install cocoapods
    fi
}

# Function to install JDK
install_jdk() {
    if ! command -v java &> /dev/null; then
        echo -e "${YELLOW}$INSTALLING_JDK${NC}"
        brew install openjdk@17
        sudo ln -sfn /usr/local/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
        echo 'export JAVA_HOME=$(/usr/libexec/java_home -v17)' >> ~/.zshrc
        echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshrc
        source ~/.zshrc
    fi
}

# Function to install Xcode Command Line Tools
install_xcode_tools() {
    if ! xcode-select -p &> /dev/null; then
        echo -e "${YELLOW}$INSTALLING_XCODE${NC}"
        xcode-select --install
    fi
} 