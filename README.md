# ChatGPT KOReader Plugin

This plugin allows you to ask questions to ChatGPT about highlighted text in your KOReader documents.

## Features

- Ask questions about highlighted text using ChatGPT
- View the conversation history with ChatGPT
- Copy the ChatGPT response to the clipboard
- Configure custom system prompts for different contexts
- Translate highlighted text to a specified language (if enabled in configuration)

## Installation

1. Make sure you have KOReader installed on your device.
2. Copy the `askgpt` folder to your KOReader plugins directory (`koreader/plugins/`).
3. Restart KOReader.

## Usage

1. Highlight text in a document.
2. Tap the "..." icon in the selection toolbar.
3. Select either "Prompt 1" or "Prompt 2" from the menu.
4. Type your question in the input dialog and tap "Ask".
5. The ChatGPT response will be displayed in a viewer.
6. You can ask follow-up questions or copy the response to the clipboard.

## Configuration

The plugin can be configured by creating a `configuration.lua` file in the plugin directory (`koreader/plugins/askgpt/`). You can use the provided `configuration.lua.sample` as a template.

The following options are available:

- `api_key`: Your OpenAI API key.
- `api_endpoint`: The API endpoint for ChatGPT (default: `"https://api.openai.com/v1/chat/completions"`). You can change this to a proxy if needed.
- `prompt1`: The system prompt for the "Prompt 1" button.
- `prompt2`: The system prompt for the "Prompt 2" button.
- `features`:
  - `translate_to`: The target language for the "Translate" button (e.g., `"French"`). If not set, the "Translate" button will not be shown.

### Example `configuration.lua`

```lua
local CONFIGURATION = {
  -- Replace with your actual OpenAI API key
  api_key = "YOUR_API_KEY",

  -- API endpoint (you can change it to a proxy if needed)
  api_endpoint = "https://api.openai.com/v1/chat/completions",

  -- Default system prompt used when asking ChatGPT a question
  -- It can be overridden by setting a custom prompt in the plugin settings
  prompt1 = "The following is a conversation with an AI assistant. The assistant is helpful, creative, clever, and very friendly. Answer as concisely as possible.",

  -- Default system prompt used when asking ChatGPT a question
  -- It can be overridden by setting a custom prompt in the plugin settings
  prompt2 = "The following is a conversation with an AI assistant. The assistant is helpful, creative, clever, and very friendly. Answer as concisely as possible.",

  features = {
    translate_to = "French"
  }
}

return CONFIGURATION
```

## License

This plugin is released under the MIT License. See the `LICENSE` file for more information.
