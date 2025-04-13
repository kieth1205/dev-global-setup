#!/bin/bash

# Source config files
source "$(dirname "$0")/../config/colors.sh"
source "$(dirname "$0")/../config/messages.sh"

# Function to install containerization tools
install_containerization_tools() {
    if [[ $devops_tools_choices == *"1"* ]]; then
        echo -e "\n${BLUE}Select Containerization Tools:${NC}"
        echo "1. Docker"
        echo "2. Podman"
        echo "3. Buildah"
        echo "4. Skopeo"
        echo "5. LXC"
        echo "6. rkt"
        echo "7. Singularity"
        echo "8. containerd"
        echo "9. CRI-O"
        echo "10. BuildKit"
        read -p "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): " container_choices

        for choice in $(echo $container_choices | tr ',' ' '); do
            case $choice in
                1) # Docker
                    if [[ "$OS" == "macos" ]]; then
                        brew install --cask docker
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y docker.io
                    else
                        choco install docker-desktop -y
                    fi
                    ;;
                2) # Podman
                    if [[ "$OS" == "macos" ]]; then
                        brew install podman
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y podman
                    else
                        choco install podman -y
                    fi
                    ;;
                3) # Buildah
                    if [[ "$OS" == "macos" ]]; then
                        brew install buildah
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y buildah
                    else
                        choco install buildah -y
                    fi
                    ;;
                4) # Skopeo
                    if [[ "$OS" == "macos" ]]; then
                        brew install skopeo
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y skopeo
                    else
                        choco install skopeo -y
                    fi
                    ;;
                5) # LXC
                    if [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y lxc
                    fi
                    ;;
                6) # rkt
                    if [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y rkt
                    fi
                    ;;
                7) # Singularity
                    if [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y singularity
                    fi
                    ;;
                8) # containerd
                    if [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y containerd
                    fi
                    ;;
                9) # CRI-O
                    if [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y cri-o
                    fi
                    ;;
                10) # BuildKit
                    if [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y buildkit
                    fi
                    ;;
            esac
        done
    fi
}

# Function to install orchestration tools
install_orchestration_tools() {
    if [[ $devops_tools_choices == *"2"* ]]; then
        echo -e "\n${BLUE}Select Orchestration Tools:${NC}"
        echo "1. Kubernetes"
        echo "2. Docker Swarm"
        echo "3. Nomad"
        echo "4. Mesos"
        echo "5. OpenShift"
        echo "6. Rancher"
        echo "7. ECS"
        echo "8. GKE"
        echo "9. AKS"
        echo "10. Tanzu"
        read -p "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): " orchestration_choices

        for choice in $(echo $orchestration_choices | tr ',' ' '); do
            case $choice in
                1) # Kubernetes
                    if [[ "$OS" == "macos" ]]; then
                        brew install kubectl
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y kubectl
                    else
                        choco install kubernetes-cli -y
                    fi
                    ;;
                2) # Docker Swarm
                    # Docker Swarm is included with Docker
                    ;;
                3) # Nomad
                    if [[ "$OS" == "macos" ]]; then
                        brew install nomad
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y nomad
                    else
                        choco install nomad -y
                    fi
                    ;;
                4) # Mesos
                    if [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y mesos
                    fi
                    ;;
                5) # OpenShift
                    if [[ "$OS" == "macos" ]]; then
                        brew install openshift-cli
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y openshift-cli
                    else
                        choco install openshift-cli -y
                    fi
                    ;;
                6) # Rancher
                    if [[ "$OS" == "macos" ]]; then
                        brew install rancher-cli
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y rancher-cli
                    else
                        choco install rancher-cli -y
                    fi
                    ;;
                7) # ECS
                    if [[ "$OS" == "macos" ]]; then
                        brew install awscli
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y awscli
                    else
                        choco install awscli -y
                    fi
                    ;;
                8) # GKE
                    if [[ "$OS" == "macos" ]]; then
                        brew install google-cloud-sdk
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y google-cloud-sdk
                    else
                        choco install google-cloud-sdk -y
                    fi
                    ;;
                9) # AKS
                    if [[ "$OS" == "macos" ]]; then
                        brew install azure-cli
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y azure-cli
                    else
                        choco install azure-cli -y
                    fi
                    ;;
                10) # Tanzu
                    if [[ "$OS" == "macos" ]]; then
                        brew install tanzu-cli
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y tanzu-cli
                    else
                        choco install tanzu-cli -y
                    fi
                    ;;
            esac
        done
    fi
}

# Function to install CI/CD tools
install_cicd_tools() {
    if [[ $devops_tools_choices == *"3"* ]]; then
        echo -e "\n${BLUE}Select CI/CD Tools:${NC}"
        echo "1. Jenkins"
        echo "2. GitLab CI"
        echo "3. GitHub Actions"
        echo "4. CircleCI"
        echo "5. Travis CI"
        echo "6. Argo CD"
        echo "7. Flux"
        echo "8. Tekton"
        echo "9. Drone"
        echo "10. Concourse"
        read -p "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): " cicd_choices

        for choice in $(echo $cicd_choices | tr ',' ' '); do
            case $choice in
                1) # Jenkins
                    if [[ "$OS" == "macos" ]]; then
                        brew install jenkins
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y jenkins
                    else
                        choco install jenkins -y
                    fi
                    ;;
                2) # GitLab CI
                    # GitLab CI is included with GitLab
                    ;;
                3) # GitHub Actions
                    # GitHub Actions is included with GitHub
                    ;;
                4) # CircleCI
                    if [[ "$OS" == "macos" ]]; then
                        brew install circleci
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y circleci
                    else
                        choco install circleci -y
                    fi
                    ;;
                5) # Travis CI
                    if [[ "$OS" == "macos" ]]; then
                        brew install travis
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y travis
                    else
                        choco install travis -y
                    fi
                    ;;
                6) # Argo CD
                    if [[ "$OS" == "macos" ]]; then
                        brew install argocd
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y argocd
                    else
                        choco install argocd -y
                    fi
                    ;;
                7) # Flux
                    if [[ "$OS" == "macos" ]]; then
                        brew install fluxcd
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y fluxcd
                    else
                        choco install fluxcd -y
                    fi
                    ;;
                8) # Tekton
                    if [[ "$OS" == "macos" ]]; then
                        brew install tektoncd
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y tektoncd
                    else
                        choco install tektoncd -y
                    fi
                    ;;
                9) # Drone
                    if [[ "$OS" == "macos" ]]; then
                        brew install drone
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y drone
                    else
                        choco install drone -y
                    fi
                    ;;
                10) # Concourse
                    if [[ "$OS" == "macos" ]]; then
                        brew install concourse
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y concourse
                    else
                        choco install concourse -y
                    fi
                    ;;
            esac
        done
    fi
} 