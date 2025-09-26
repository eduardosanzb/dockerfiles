return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("codecompanion").setup({
      opts = {
        send_code = true,
      },
      display = {
        action_palette = {
          provider = "telescope",
        },
        chat = {
          show_header_separator = false,
          show_settings = true,
        },
      },
      strategies = {
        chat = {
          adapter = "my_openai",
        },
        inline = {
          adapter = "my_openai",
        },
        cmd = {
          adapter = "my_openai",
        },
      },
      adapters = {
        opts = {
          show_defaults = false,
        },

        my_openai = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "http://localhost:1234",
              chat_url = "/v1/chat/completions",
            },
            schema = {
              model = {
                -- default = "qwen3-30b-a3b-128k@q5_k_m"
                -- default = "qwen3-32b-128k"
                -- default = "qwen3-30b-a3b-mlx"
              },
            },
          })
        end,
      },
    })
  end,
}