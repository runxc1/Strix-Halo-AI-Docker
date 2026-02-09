# Qwen3-Coder-Next ROCm OpenAI Compatible Server

`llama.cpp` server running Qwen3-Coder-Next model with Vulkan GPU acceleration.

> [!NOTE]
> Anecdotally, the experience using `opencode` with this setup on a Framework Mainboard (Ryzen AI Max 395+ 128gb) feels almost as fast as Claude Code. Definitely useable day-to-day! 

## 🏌️ Quick Start

```bash
docker compose up -d
```

Server runs on `http://localhost:8080`

## 🧰 Requirements

- AMD GPU with ROCm support
- Docker with Vulkan device access

## 🛠️ Configuration

### Download Model

Download the [unsloth/Qwen3-Coder-Next-GGUF](https://huggingface.co/unsloth/Qwen3-Coder-Next-GGUF) model from Hugging Face.

**Option 1: Use the setup script** (recommended):
```bash
./setup.sh
```

**Option 2: Manual download**:
```bash
https://unsloth.ai/docs/models/qwen3-coder-next

pip install -U huggingface_hub

hf download unsloth/Qwen3-Coder-Next-GGUF \
    --local-dir unsloth/Qwen3-Coder-Next-GGUF \
    --include "*UD-Q4_K_XL*"
```

The model (~46GB) will be downloaded to `./unsloth/Qwen3-Coder-Next-GGUF/`.

### Open Web-UI

In the "Admin Panel" under "Connections", add a new "OpenAI" style connection
like this:

![openweb-ui_config](.github/openwebui-config.png)

> The API token can be anything

### opencode

In opencode, you can add the provider and model to your
`~/.config/opencode/opencode.jsonc` like this:

```jsonc
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "llama.cpp": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "llm.puff.lan",
      "options": {
        "baseURL": "http://mortgage-lifter2:8080/v1",
        "includeUsage": true
      },
      "models": {
        "Qwen3-Coder-Next-UD-Q4_K_XL": {
          "name": "Qwen3 Coder Next",
          "tool_call": true,
          "reasoning": true,
          "options": {
            "temperature": 0.2,
            "top_p": 0.95,
            "top_k": 40
          }
        }
      }
    }
  },
  "model": "Qwen3-Coder-Next-UD-Q4_K_XL",
  "autoupdate": true,
}
```

## 📝 License

MIT
