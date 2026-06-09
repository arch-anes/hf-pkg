# hf-pkg

`hf-pkg` is an NPM-like dependency manager for Hugging Face models, designed to work as an extension to the `huggingface-cli`.

It uses a `model.json` file to keep track of the models your project depends on, including specific revisions, file inclusion/exclusion patterns (useful for GGUF/quantization), and local directory mappings.

## Installation

Install via pip:

```bash
pip install .
```

Or install as a Hugging Face CLI extension (once published):

```bash
hf extensions install hf-pkg
```

## Usage

### Add a model

Add a model to your `model.json` and download it:

```bash
hf-pkg add TheBloke/Llama-2-7B-Chat-GGUF --include "*q4_K_M.gguf" --local-dir ./models/llama
```

### Install models

Read `model.json` and download all specified models:

```bash
hf-pkg install
```

Or just:

```bash
hf-pkg
```

### Running as a Hugging Face CLI Extension

Once installed as an extension, you can execute it simply through the `hf` CLI:

```bash
hf pkg install
```

Or to add a model:

```bash
hf pkg add repo_id --include "*.gguf"
```

### Example `model.json`

```json
{
  "models": {
    "mistralai/Mistral-7B-Instruct-v0.2": {
      "revision": "main",
      "include": [
        "*.safetensors"
      ]
    },
    "TheBloke/Llama-2-7B-Chat-GGUF": {
      "revision": "main",
      "include": [
        "*q4_K_M.gguf"
      ],
      "local_dir": "./models/llama"
    }
  }
}
```
