#!/bin/bash

# Source config files
source "$(dirname "$0")/../config/colors.sh"
source "$(dirname "$0")/../config/messages.sh"

# Function to install web development tools
install_web_tools() {
    echo -e "\n${YELLOW}$INSTALLING_WEB${NC}"
    for choice in $(echo $web_choices | tr ',' ' '); do
        case $choice in
            1) # Vite
                pnpm add -g create-vite
                ;;
            2) # Next.js CLI
                pnpm add -g create-next-app
                ;;
            3) # React CLI
                pnpm add -g create-react-app
                ;;
            4) # Angular CLI
                pnpm add -g @angular/cli
                ;;
            5) # Vue CLI
                pnpm add -g @vue/cli
                ;;
        esac
    done
}

# Function to install frontend frameworks
install_frontend_frameworks() {
    if [[ $web_tools_choices == *"1"* ]]; then
        echo -e "\n${BLUE}Select Frontend Frameworks:${NC}"
        echo "1. React"
        echo "2. Vue.js"
        echo "3. Angular"
        echo "4. Svelte"
        echo "5. Next.js"
        echo "6. Nuxt.js"
        echo "7. Gatsby"
        echo "8. Remix"
        echo "9. Astro"
        echo "10. SolidJS"
        read -p "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): " frontend_choices

        for choice in $(echo $frontend_choices | tr ',' ' '); do
            case $choice in
                1) # React
                    pnpm add -g create-react-app
                    ;;
                2) # Vue.js
                    pnpm add -g @vue/cli
                    ;;
                3) # Angular
                    pnpm add -g @angular/cli
                    ;;
                4) # Svelte
                    pnpm add -g create-svelte
                    ;;
                5) # Next.js
                    pnpm add -g create-next-app
                    ;;
                6) # Nuxt.js
                    pnpm add -g create-nuxt-app
                    ;;
                7) # Gatsby
                    pnpm add -g gatsby-cli
                    ;;
                8) # Remix
                    pnpm add -g create-remix
                    ;;
                9) # Astro
                    pnpm add -g create-astro
                    ;;
                10) # SolidJS
                    pnpm add -g create-solid
                    ;;
            esac
        done
    fi
}

# Function to install backend frameworks
install_backend_frameworks() {
    if [[ $web_tools_choices == *"2"* ]]; then
        echo -e "\n${BLUE}Select Backend Frameworks:${NC}"
        echo "1. Express.js"
        echo "2. NestJS"
        echo "3. FastAPI"
        echo "4. Django"
        echo "5. Flask"
        echo "6. Spring Boot"
        echo "7. Laravel"
        echo "8. Ruby on Rails"
        echo "9. Phoenix"
        echo "10. Gin"
        read -p "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): " backend_choices

        for choice in $(echo $backend_choices | tr ',' ' '); do
            case $choice in
                1) # Express.js
                    pnpm add -g express-generator
                    ;;
                2) # NestJS
                    pnpm add -g @nestjs/cli
                    ;;
                3) # FastAPI
                    pip install fastapi uvicorn
                    ;;
                4) # Django
                    pip install django
                    ;;
                5) # Flask
                    pip install flask
                    ;;
                6) # Spring Boot
                    # Spring Boot CLI is installed with JDK
                    ;;
                7) # Laravel
                    composer global require laravel/installer
                    ;;
                8) # Ruby on Rails
                    gem install rails
                    ;;
                9) # Phoenix
                    mix archive.install hex phx_new
                    ;;
                10) # Gin
                    go install github.com/gin-gonic/gin@latest
                    ;;
            esac
        done
    fi
} 