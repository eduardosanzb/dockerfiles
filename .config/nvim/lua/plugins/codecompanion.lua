require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "ollama",
    },
    inline = {
      adapter = "ollama",
    },
  },
  adapters = {
    ollama = function()
      return require("codecompanion.adapters").extend("openai_compatible", {
        env = {
          url = "http://localhost:1234",
          api_key = "OpenAI_API_KEY",
          chat_url = "/v1/chat/completions",
        },
      })
    end,
  },
})
