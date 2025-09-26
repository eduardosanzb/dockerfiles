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
        adapter = {
          name = "my_openai"
        },
    },
    inline = {
        adapter = {
          name = "my_openai"
        },
    },
    cmd = {
        adapter = {
          name = "my_openai"
        },
    },
  },
  adapters = {
  http = {
    my_openai = function()
    return require("codecompanion.adapters").extend("openai_compatible", {
      name ="lmstudio",
        env = {
          url = "http://localhost:1234",
          chat_url = "/v1/chat/completions",
        },
        schema = {
          model = {
            default = "qwen/qwen3-coder-30b",
            model = "qwen/qwen3-coder-30b"
          },
        },
      })
    end,
  },
  },
})

-- lets move minuet from the packer to here
-- require('minuet').setup({
--   cmp = {
--     enabled = false
--   },
--   provider = 'openai_fim_compatible',
--   n_completions = 1,
--   notify = 'warn',
--   context_window = 16000,
--   throttle = 500,
--   debounce = 400,
--   request_timeout = 3,
--   provider_options = {
--     openai_fim_compatible = {
--       stream = true,
--       api_key = 'TERM',
--       name = 'lmstudio',
--       end_point = 'http://localhost:1234/v1/completions',
--       -- model = 'glm-4-32b-0414',
--       -- model = 'glm-4-32b-0414',
--       model = 'qwen3-30b-a3b-mlx',
--       optional = {
--         max_tokens = 200,
--         top_p = 0.9,
--       },
--       template = {
--         prompt = function(context_before_cursor, context_after_cursor, _)
--           return '/no-think'
--               ..'<|fim_prefix|>'
--               .. context_before_cursor
--               .. '<|fim_suffix|>'
--               .. context_after_cursor
--               .. '<|fim_middle|>'
--         end,
--         suffix = false,
--       },
--     },
--   },
--   virtualtext = {
--     enabled = false,
--     auto_trigger_ft = {  },
--     keymap = {
--       -- accept whole completion
--       accept = '<S-/>',
--       -- accept one line
--       -- accept_line = '<S-/>',
--       -- accept n lines (prompts for number)
--       -- e.g. "A-z 2 CR" will accept 2 lines
--       accept_n_lines = '<A-z>',
--       -- Cycle to prev completion item, or manually invoke completion
--       prev = '<A-[>',
--       -- Cycle to next completion item, or manually invoke completion
--       next = '<A-]>',
--       dismiss = '<A-e>',
--       -- lets change dismiss to esc
--     },
--   },
-- })
