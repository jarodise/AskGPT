# ChatGPT KOReader Plugin (enhanced)

This plugin allows you to integrate various LLM services (OpenAI, Google Gemini, etc.) with KOReader.

## Features

- Three predefined system prompts for quick access
- Custom prompt input for flexible interactions
- Copy AI responses to the clipboard
- Configure custom system prompts for different contexts
- Support for multiple LLM providers (OpenAI, Google Gemini)
- Translate highlighted text to a specified language (if enabled in configuration)

## Installation

1. Make sure you have KOReader installed on your device.
2. Copy the `askgpt` folder to your KOReader plugins directory (`koreader/plugins/`).
3. Restart KOReader.
4. Configuration setup: use your favorite text editor to open the configuration.lua file and configure:
   - API endpoint (OpenAI or Gemini)
   - API key
   - Model name
   - Custom prompts (prompt1, prompt2, prompt3)

### Configuration Examples

For OpenAI:
```lua
api_endpoint = "https://api.openai.com/v1/chat/completions"
model = "gpt-3.5-turbo"
```

For Google Gemini:
```lua
api_endpoint = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash-exp:generateContent"
model = "gemini-2.0-flash-exp"
```

## Usage

1. Highlight text in a document.
2. Tap the "..." icon in the selection toolbar.
3. Choose from these options:
   - **Prompt 1**: Use your first predefined prompt (e.g., "translate to Spanish")
   - **Prompt 2**: Use your second predefined prompt (e.g., "translate to Chinese")
   - **Prompt 3**: Use your third predefined prompt (e.g., "explain in detail")
   - **Ask AI**: Open a dialog to enter your own custom prompt

### Using Predefined Prompts (1, 2, 3)
- Simply tap the prompt button and the AI will process your highlighted text according to the predefined instruction in configuration.lua
- The response will be automatically copied to clipboard
- You can continue the conversation with follow-up questions

### Using Custom Prompts (Ask AI)
1. Tap "Ask AI" in the menu
2. Type your custom prompt/question about the highlighted text
3. Tap "Ask" to get the response
4. The response will show in a viewer where you can:
   - Read the full conversation history
   - Ask follow-up questions
   - Copy responses to clipboard

### Tips
- Responses are automatically copied to your clipboard
- You can maintain a conversation thread with follow-up questions
- The AI considers the document's context (title and author) when responding
- Error messages will help you identify any configuration or connection issues

## License

This plugin is released under the MIT License. See the `LICENSE` file for more information.
