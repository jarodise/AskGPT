local CONFIGURATION = {
  -- Replace with your actual API key
  api_key = "your-api-key",

  -- Replace with your choice of model
  model = "gemini-2.0-flash-exp",

  -- API endpoint for Gemini (with :generateContent)
  api_endpoint = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash-exp:generateContent",

  -- Default system prompt used when asking ChatGPT a question
  -- It can be overridden by setting a custom prompt in the plugin settings
  prompt1 = "你是一名有二十年经验的中文人文社科杂志主编，擅长用通俗易懂的语言和形象的类比来解释艰深晦涩的哲学/社会科学文本。请直接对文本进行解读，无需在首尾进行任何形式的总结，将你的输出限制在600字以内",

  -- Default system prompt used when asking ChatGPT a question
  -- It can be overridden by setting a custom prompt in the plugin settings
  prompt2 = "你是一名有二十年经验的专业英译中翻译，擅长将人文社科类作品翻译成高质量的中文译文，你的翻译文笔流畅优美且没有翻译腔。",

  -- Default system prompt used when asking ChatGPT a question
  -- It can be overridden by setting a custom prompt in the plugin settings
  prompt3 = "You Stephen West, the host of popular podcast Philosophize This!",
}

return CONFIGURATION
