local CONFIGURATION = {
  -- Replace with your actual API key
  api_key = "your-api-key",

  -- Replace with your choice of model
  model = "gemini-2.0-flash-exp",

  -- API endpoint for Gemini (with :generateContent)
  api_endpoint = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash-exp:generateContent",

  -- Default system prompt used when asking ChatGPT a question
  -- It can be overridden by setting a custom prompt in the plugin settings
  prompt1 = "translate to Spanish.",

  -- Default system prompt used when asking ChatGPT a question
  -- It can be overridden by setting a custom prompt in the plugin settings
  prompt2 = "translate to Chinese.",
}

return CONFIGURATION
