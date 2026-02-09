#!/bin/bash

# Qwen3-Coder-Next Model Setup Script
# Documentation: https://unsloth.ai/docs/models/qwen3-coder-next
# Model cache location: ~/.cache/huggingface

# Colors for output
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${CYAN}================================${NC}"
echo -e "${CYAN}Qwen3-Coder-Next Model Setup${NC}"
echo -e "${CYAN}================================${NC}"
echo ""

# Step 1: Install pipx (Python package installer in isolated environments)
echo -e "${YELLOW}[Step 1/3] Installing pipx...${NC}"
echo "pipx allows you to install Python CLI tools in isolated environments"
echo ""

# Check if pipx is already installed
if ! command -v pipx &> /dev/null; then
    echo -e "${YELLOW}pipx not found. Installing via pip...${NC}"
    python3 -m pip install --user pipx
    python3 -m pipx ensurepath
    echo -e "${GREEN}pipx installed. You may need to restart your terminal or source your shell profile.${NC}"
else
    echo -e "${GREEN}pipx is already installed.${NC}"
fi
echo ""

# Step 2: Install huggingface_hub CLI
echo -e "${YELLOW}[Step 2/3] Installing huggingface_hub CLI...${NC}"
echo "This provides the 'hf' command for downloading models from Hugging Face"
echo ""

pip install -U huggingface_hub

echo ""

# Step 3: Download the model
echo -e "${YELLOW}[Step 3/3] Downloading Qwen3-Coder-Next-GGUF model...${NC}"
echo -e "${CYAN}Model: unsloth/Qwen3-Coder-Next-GGUF (UD-Q4_K_XL quantization)${NC}"
echo -e "${CYAN}Download location: ./unsloth/Qwen3-Coder-Next-GGUF${NC}"
echo -e "${YELLOW}This is approximately 46GB and may take some time...${NC}"
echo ""

hf download unsloth/Qwen3-Coder-Next-GGUF \
    --local-dir unsloth/Qwen3-Coder-Next-GGUF \
    --include "*UD-Q4_K_XL*"

echo ""
echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}Setup Complete!${NC}"
echo -e "${GREEN}================================${NC}"
echo ""
echo -e "${CYAN}Model downloaded to: ./unsloth/Qwen3-Coder-Next-GGUF${NC}"
echo -e "${CYAN}Next step: Run 'docker compose up -d' to start the server${NC}"
