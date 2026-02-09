# Qwen3-Coder-Next Model Setup Script
# Documentation: https://unsloth.ai/docs/models/qwen3-coder-next
# Model cache location: /home/mortgage/.cache/huggingface

Write-Host "================================" -ForegroundColor Cyan
Write-Host "Qwen3-Coder-Next Model Setup" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Install pipx (Python package installer in isolated environments)
Write-Host "[Step 1/3] Installing pipx..." -ForegroundColor Yellow
Write-Host "pipx allows you to install Python CLI tools in isolated environments"
Write-Host ""

# Check if pipx is already installed
if (!(Get-Command pipx -ErrorAction SilentlyContinue)) {
    Write-Host "pipx not found. Installing via pip..." -ForegroundColor Yellow
    python3 -m pip install --user pipx
    python3 -m pipx ensurepath
    Write-Host "Please restart your terminal or run: refreshenv" -ForegroundColor Green
} else {
    Write-Host "pipx is already installed." -ForegroundColor Green
}
Write-Host ""

# Step 2: Install huggingface_hub CLI
Write-Host "[Step 2/3] Installing huggingface_hub CLI..." -ForegroundColor Yellow
Write-Host "This provides the 'hf' command for downloading models from Hugging Face"
Write-Host ""

pip install -U huggingface_hub

Write-Host ""

# Step 3: Download the model
Write-Host "[Step 3/3] Downloading Qwen3-Coder-Next-GGUF model..." -ForegroundColor Yellow
Write-Host "Model: unsloth/Qwen3-Coder-Next-GGUF (UD-Q4_K_XL quantization)" -ForegroundColor Cyan
Write-Host "Download location: ./unsloth/Qwen3-Coder-Next-GGUF" -ForegroundColor Cyan
Write-Host "This is approximately 46GB and may take some time..." -ForegroundColor Yellow
Write-Host ""

hf download unsloth/Qwen3-Coder-Next-GGUF `
    --local-dir unsloth/Qwen3-Coder-Next-GGUF `
    --include "*UD-Q4_K_XL*"

Write-Host ""
Write-Host "================================" -ForegroundColor Green
Write-Host "Setup Complete!" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green
Write-Host ""
Write-Host "Model downloaded to: ./unsloth/Qwen3-Coder-Next-GGUF" -ForegroundColor Cyan
Write-Host "Next step: Run 'docker compose up -d' to start the server" -ForegroundColor Cyan
