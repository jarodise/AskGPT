local Device = require("device")
local InputContainer = require("ui/widget/container/inputcontainer")
local NetworkMgr = require("ui/network/manager")
local _ = require("gettext")
local ChatGPTViewer = require("chatgptviewer")
local UIManager = require("ui/uimanager")
local InfoMessage = require("ui/widget/infomessage")
local Notification = require("ui/widget/notification")

local showChatGPTDialog = require("dialogs")
local UpdateChecker = require("update_checker")
local queryChatGPT = require("gpt_query")

local AskGPT = InputContainer:new {
  name = "askgpt",
  is_doc_only = true,
}

local updateMessageShown = false

function AskGPT:init()
  self.ui.highlight:addToHighlightDialog("askgpt_ChatGPT", function(_reader_highlight_instance)
    return {
      text = _("Ask ChatGPT"),
      enabled = Device:hasClipboard(),
      callback = function()
        NetworkMgr:runWhenOnline(function()
          if not updateMessageShown then
            UpdateChecker.checkForUpdates()
            updateMessageShown = true
          end

          local success, result = pcall(function() return require("configuration") end)
          local CONFIGURATION
          if success then
            CONFIGURATION = result
          else
            print("configuration.lua not found, using default system prompt")
          end
          local system_prompt = CONFIGURATION and CONFIGURATION.default_system_prompt or "The following is a conversation with an AI assistant. The assistant is helpful, creative, clever, and very friendly. Answer as concisely as possible."

          local highlightedText = _reader_highlight_instance.selected_text.text
          local message_history = {
            { role = "system", content = system_prompt },
            { role = "user", content = highlightedText }
          }

          local answer
          pcall(function()
            answer = queryChatGPT(message_history)
          end)

          if answer then
            table.insert(message_history, { role = "assistant", content = answer })

            Device.input.setClipboardText(answer)
            UIManager:show(Notification:new{ text = _("ChatGPT response copied to clipboard."), timeout = 3 })

            local result_text = ""
            for i = 1, #message_history do
              if message_history[i].role == "user" then
                result_text = result_text .. _("User: ") .. message_history[i].content .. "\n\n"
              else
                result_text = result_text .. _("ChatGPT: ") .. message_history[i].content .. "\n\n"
              end
            end

            local chatgpt_viewer = ChatGPTViewer:new{
              title = _("AskGPT"),
              text = result_text,
              onAskQuestion = function(chatgpt_viewer, question)
                table.insert(message_history, { role = "user", content = question })

                local answer
                pcall(function()
                  answer = queryChatGPT(message_history)
                end)

                if answer then
                  table.insert(message_history, { role = "assistant", content = answer })

                  Device.input.setClipboardText(answer)
                  UIManager:show(Notification:new{ text = _("ChatGPT response copied to clipboard."), timeout = 3 })

                  local result_text = ""
                  for i = 1, #message_history do
                    if message_history[i].role == "user" then
                      result_text = result_text .. _("User: ") .. message_history[i].content .. "\n\n"
                    else
                      result_text = result_text .. _("ChatGPT: ") .. message_history[i].content .. "\n\n"
                    end
                  end

                  chatgpt_viewer:update(result_text)
                else
                  UIManager:show(InfoMessage:new{ text = _("Error querying ChatGPT. Please check your configuration and try again."), timeout = 5 })
                end
              end
            }

            UIManager:show(chatgpt_viewer)
          else
            UIManager:show(InfoMessage:new{ text = _("Error querying ChatGPT. Please check your configuration and try again."), timeout = 5 })
          end
        end)
      end,
    }
  end)
end

return AskGPT
