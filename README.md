# ChatGPT KOReader Plugin (enhanced)

This plugin allows you to integrate LLM with KOReader.

## Features

- Predefine default custom system prompts to be applied to the selected text.
- Copy the ChatGPT response to the clipboard
- Configure custom system prompts for different contexts
- Translate highlighted text to a specified language (if enabled in configuration)

## Installation

1. Make sure you have KOReader installed on your device.
2. Copy the `askgpt` folder to your KOReader plugins directory (`koreader/plugins/`).
3. Restart KOReader.
4. Configuration setup: use your favorite text editor to open the configuration.lua file, input the API endpoint accordingly, and in the prompt1 and prompt2 section, input your desired system prompts. 

## Usage

1. Highlight text in a document.
2. Tap the "..." icon in the selection toolbar.
3. Select either "Prompt 1" or "Prompt 2" from the menu.
4. Type your question in the input dialog and tap "Ask".
5. The ChatGPT response will be displayed in a viewer.
6. You can ask follow-up questions or copy the response to the clipboard.


## License

This plugin is released under the MIT License. See the `LICENSE` file for more information.
