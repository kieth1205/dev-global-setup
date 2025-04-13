#!/bin/bash

# Source config files
source "$(dirname "$0")/../config/colors.sh"
source "$(dirname "$0")/../config/messages.sh"

# Function to install data science tools
install_data_science_tools() {
    if [[ $dev_type_choices == *"5"* ]]; then
        echo -e "\n${BLUE}Select Data Science Tools:${NC}"
        echo "1. Python Libraries"
        echo "2. R"
        echo "3. Jupyter"
        echo "4. TensorFlow"
        echo "5. PyTorch"
        echo "6. Scikit-learn"
        echo "7. Pandas"
        echo "8. NumPy"
        echo "9. Matplotlib"
        echo "10. Seaborn"
        read -p "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): " data_science_choices

        for choice in $(echo $data_science_choices | tr ',' ' '); do
            case $choice in
                1) # Python Libraries
                    pip install numpy pandas matplotlib seaborn scikit-learn tensorflow pytorch jupyter
                    ;;
                2) # R
                    if [[ "$OS" == "macos" ]]; then
                        brew install r
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y r-base
                    else
                        choco install r -y
                    fi
                    ;;
                3) # Jupyter
                    pip install jupyter
                    ;;
                4) # TensorFlow
                    pip install tensorflow
                    ;;
                5) # PyTorch
                    pip install torch
                    ;;
                6) # Scikit-learn
                    pip install scikit-learn
                    ;;
                7) # Pandas
                    pip install pandas
                    ;;
                8) # NumPy
                    pip install numpy
                    ;;
                9) # Matplotlib
                    pip install matplotlib
                    ;;
                10) # Seaborn
                    pip install seaborn
                    ;;
            esac
        done
    fi
}

# Function to install machine learning tools
install_ml_tools() {
    if [[ $data_science_choices == *"1"* ]]; then
        echo -e "\n${BLUE}Select Machine Learning Tools:${NC}"
        echo "1. TensorFlow"
        echo "2. PyTorch"
        echo "3. Scikit-learn"
        echo "4. Keras"
        echo "5. XGBoost"
        echo "6. LightGBM"
        echo "7. CatBoost"
        echo "8. FastAI"
        echo "9. Hugging Face"
        echo "10. ONNX"
        read -p "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): " ml_choices

        for choice in $(echo $ml_choices | tr ',' ' '); do
            case $choice in
                1) # TensorFlow
                    pip install tensorflow
                    ;;
                2) # PyTorch
                    pip install torch
                    ;;
                3) # Scikit-learn
                    pip install scikit-learn
                    ;;
                4) # Keras
                    pip install keras
                    ;;
                5) # XGBoost
                    pip install xgboost
                    ;;
                6) # LightGBM
                    pip install lightgbm
                    ;;
                7) # CatBoost
                    pip install catboost
                    ;;
                8) # FastAI
                    pip install fastai
                    ;;
                9) # Hugging Face
                    pip install transformers
                    ;;
                10) # ONNX
                    pip install onnx
                    ;;
            esac
        done
    fi
}

# Function to install data visualization tools
install_visualization_tools() {
    if [[ $data_science_choices == *"2"* ]]; then
        echo -e "\n${BLUE}Select Data Visualization Tools:${NC}"
        echo "1. Matplotlib"
        echo "2. Seaborn"
        echo "3. Plotly"
        echo "4. Bokeh"
        echo "5. Altair"
        echo "6. D3.js"
        echo "7. Tableau"
        echo "8. Power BI"
        echo "9. Grafana"
        echo "10. Kibana"
        read -p "Enter your choices (comma-separated) / Nhập lựa chọn (phân cách bằng dấu phẩy): " visualization_choices

        for choice in $(echo $visualization_choices | tr ',' ' '); do
            case $choice in
                1) # Matplotlib
                    pip install matplotlib
                    ;;
                2) # Seaborn
                    pip install seaborn
                    ;;
                3) # Plotly
                    pip install plotly
                    ;;
                4) # Bokeh
                    pip install bokeh
                    ;;
                5) # Altair
                    pip install altair
                    ;;
                6) # D3.js
                    npm install -g d3
                    ;;
                7) # Tableau
                    if [[ "$OS" == "macos" ]]; then
                        brew install --cask tableau
                    elif [[ "$OS" == "windows" ]]; then
                        choco install tableau -y
                    fi
                    ;;
                8) # Power BI
                    if [[ "$OS" == "windows" ]]; then
                        choco install powerbi -y
                    fi
                    ;;
                9) # Grafana
                    if [[ "$OS" == "macos" ]]; then
                        brew install grafana
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y grafana
                    else
                        choco install grafana -y
                    fi
                    ;;
                10) # Kibana
                    if [[ "$OS" == "macos" ]]; then
                        brew install kibana
                    elif [[ "$OS" == "linux" ]]; then
                        sudo apt-get install -y kibana
                    else
                        choco install kibana -y
                    fi
                    ;;
            esac
        done
    fi
} 