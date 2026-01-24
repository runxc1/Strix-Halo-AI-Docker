# GLM-4.7-Flash LLM Server

llama.cpp server running GLM-4.7-Flash model with Vulkan GPU acceleration.

## Quick Start

```bash
docker-compose up -d
```

Server runs on http://localhost:8080

## Requirements

- AMD GPU with ROCm support
- Docker with Vulkan device access

## Configuration

- **Model**: GLM-4.7-Flash-UD-Q8_K_XL.gguf
- **Context Size**: 202752 tokens
- **Port**: 8080
- **GPU**: Vulkan0 (ROCm)
- **Idle Sleep**: 300 seconds

Download model: https://huggingface.co/unsloth/GLM-4.7-Flash-GGUF/blob/main/GLM-4.7-Flash-UD-Q8_K_XL.gguf
