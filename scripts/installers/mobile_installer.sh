#!/bin/bash

# Source config files
source "$(dirname "$0")/../config/colors.sh"
source "$(dirname "$0")/../config/messages.sh"

# Function to install mobile development tools
install_mobile_tools() {
    echo -e "\n${YELLOW}$INSTALLING_MOBILE${NC}"
    for choice in $(echo $mobile_choices | tr ',' ' '); do
        case $choice in
            1) # React Native CLI
                pnpm add -g react-native-cli
                ;;
            2) # Flutter
                if [[ "$OS" == "macos" ]]; then
                    brew install --cask flutter
                elif [[ "$OS" == "linux" ]]; then
                    sudo snap install flutter --classic
                else
                    choco install flutter -y
                fi
                ;;
            3) # Expo CLI
                pnpm add -g expo-cli
                ;;
            4) # Firebase CLI
                pnpm add -g firebase-tools
                ;;
            5) # Ionic CLI
                pnpm add -g @ionic/cli
                ;;
        esac
    done
}

# Function to install cross-platform frameworks
install_cross_platform_frameworks() {
    if [[ $mobile_tools_choices == *"1"* ]]; then
        echo -e "\n${BLUE}Select Cross-Platform Frameworks:${NC}"
        echo "1. React Native"
        echo "2. Flutter"
        echo "3. Ionic"
        echo "4. Xamarin"
        echo "5. NativeScript"
        echo "6. Capacitor"
        echo "7. Cordova"
        echo "8. Expo"
        echo "9. Kotlin Multiplatform"
        echo "10. Unity"
        read -p "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): " cross_platform_choices

        for choice in $(echo $cross_platform_choices | tr ',' ' '); do
            case $choice in
                1) # React Native
                    pnpm add -g react-native-cli
                    ;;
                2) # Flutter
                    if [[ "$OS" == "macos" ]]; then
                        brew install --cask flutter
                    elif [[ "$OS" == "linux" ]]; then
                        sudo snap install flutter --classic
                    else
                        choco install flutter -y
                    fi
                    ;;
                3) # Ionic
                    pnpm add -g @ionic/cli
                    ;;
                4) # Xamarin
                    if [[ "$OS" == "macos" ]]; then
                        brew install --cask xamarin-studio
                    elif [[ "$OS" == "windows" ]]; then
                        choco install xamarin -y
                    fi
                    ;;
                5) # NativeScript
                    pnpm add -g nativescript
                    ;;
                6) # Capacitor
                    pnpm add -g @capacitor/cli
                    ;;
                7) # Cordova
                    pnpm add -g cordova
                    ;;
                8) # Expo
                    pnpm add -g expo-cli
                    ;;
                9) # Kotlin Multiplatform
                    # Kotlin is installed with JDK
                    ;;
                10) # Unity
                    if [[ "$OS" == "macos" ]]; then
                        brew install --cask unity
                    elif [[ "$OS" == "windows" ]]; then
                        choco install unity -y
                    fi
                    ;;
            esac
        done
    fi
}

# Function to install native development tools
install_native_tools() {
    if [[ $mobile_tools_choices == *"2"* ]]; then
        echo -e "\n${BLUE}Select Native Development Tools:${NC}"
        echo "1. Android Studio"
        echo "2. Xcode"
        echo "3. Kotlin"
        echo "4. Swift"
        echo "5. Java"
        echo "6. Objective-C"
        echo "7. Gradle"
        echo "8. CocoaPods"
        echo "9. Android SDK"
        echo "10. iOS SDK"
        read -p "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): " native_choices

        for choice in $(echo $native_choices | tr ',' ' '); do
            case $choice in
                1) # Android Studio
                    if [[ "$OS" == "macos" ]]; then
                        brew install --cask android-studio
                    elif [[ "$OS" == "linux" ]]; then
                        sudo snap install android-studio --classic
                    else
                        choco install androidstudio -y
                    fi
                    ;;
                2) # Xcode
                    if [[ "$OS" == "macos" ]]; then
                        xcode-select --install
                    fi
                    ;;
                3) # Kotlin
                    # Kotlin is installed with JDK
                    ;;
                4) # Swift
                    # Swift is installed with Xcode
                    ;;
                5) # Java
                    # Java is installed with JDK
                    ;;
                6) # Objective-C
                    # Objective-C is installed with Xcode
                    ;;
                7) # Gradle
                    if [[ "$OS" == "macos" ]]; then
                        brew install gradle
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y gradle
                    else
                        choco install gradle -y
                    fi
                    ;;
                8) # CocoaPods
                    if [[ "$OS" == "macos" ]]; then
                        brew install cocoapods
                    fi
                    ;;
                9) # Android SDK
                    # Android SDK is installed with Android Studio
                    ;;
                10) # iOS SDK
                    # iOS SDK is installed with Xcode
                    ;;
            esac
        done
    fi
} 