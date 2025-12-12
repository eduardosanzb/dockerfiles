-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua filepacker
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

return packer.startup({
  function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'


    -- CSV viewer
    use({
      "hat0uma/csvview.nvim",
      config = function()
        require('csvview').setup()
      end
    })

    -- nvim v0.7.2
    use({
      "kdheepak/lazygit.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
      },
    })

    -- super cool delete inside bla blabal
    use 'echasnovski/mini.ai'
    use({
      'echasnovski/mini.nvim',
      branch = 'stable',
    })



    -- The bundle of plugins
    use 'hville/lazy-stats'
    use 'MunifTanjim/nui.nvim'
    use {
      "folke/snacks.nvim",
      require = { 'nvim-mini/mini.icons' }
    }
    use {
      'folke/noice.nvim',
      requires = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
      }
    }

    use "folke/which-key.nvim"
    use "Morozzzko/git_browse.nvim"


    -- File explorer
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'
    -- use 'nvim-tree/nvim-web-devicons'

    -- Yankdb
    use {
      "AckslD/nvim-neoclip.lua",
      requires = {
        { 'kkharji/sqlite.lua',           module = 'sqlite' },
        { 'nvim-telescope/telescope.nvim' },
      },
      config = function()
        require('neoclip').setup()
      end,
    }


    -- timetracker
    use {
      "3rd/time-tracker.nvim",
      requires = {
        "3rd/sqlite.nvim",
      },
      opts = {
        data_file = vim.fn.stdpath("data") .. "/time-tracker.db",
      },
      config = function()
        require("time-tracker").setup({
          data_file = vim.fn.stdpath("data") .. "/time-tracker.db",
          tracking_events = { "BufEnter", "BufWinEnter", "CursorMoved", "CursorMovedI", "WinScrolled" },
          tracking_timeout_seconds = 5 * 60, -- 5 minutes
        })
      end,
    }
    use { "lowitea/aw-watcher.nvim",
      opts = { -- required, but can be empty table: {}
      },
      config = function()
        require("aw_watcher").setup({})
      end,
    }


    -- Indent line
    use 'lukas-reineke/indent-blankline.nvim'

    -- Autopair
    use {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup {}
      end
    }

    -- Surround selections
    use "kylechui/nvim-surround"

    -- Tag viewer
    use 'preservim/tagbar'

    -- hex color highligher
    use {
      "catgoose/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end
    }

    -- replace fzf instread of treeesi
    use {
      'ibhagwan/fzf-lua',
      requires = {
        { 'kyazdani42/nvim-web-devicons' }
      }
    }
    -- Treesitter interface
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-context'

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.3',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
        -- { "mfussenegger/nvim-dap" }
      }
    }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }

    -- Docs generator
    use {
      "danymat/neogen",
      config = function()
        require('neogen').setup {}
      end,
      requires = "nvim-treesitter/nvim-treesitter",
      -- Uncomment next line if you want to follow only stable versions
      -- tag = "*"
    }
    -- Color schemes
    use 'navarasu/onedark.nvim'
    use 'folke/tokyonight.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'yorickpeterse/nvim-grey'
    use 'arzg/vim-colors-xcode'

    use "delphinus/auto-cursorline.nvim"


    -- diagnostics better
    use 'folke/trouble.nvim'


    -- shadow of multiwindows
    use 'sunjon/shade.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use({
      "glepnir/lspsaga.nvim",
      branch = "main",
      requires = {
        { "nvim-tree/nvim-web-devicons" },
        --Please make sure you install markdown and markdown_inline parser
        { "nvim-treesitter/nvim-treesitter" }
      }
    })
    -- LSP plugin for typescript
    use 'jose-elias-alvarez/typescript.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/eslint.nvim'
    use('MunifTanjim/prettier.nvim')
    use {
      "pmizio/typescript-tools.nvim",
      requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      config = function()
        require("typescript-tools").setup {
          tsserver_format_options = {

          },
          tsserver_file_preferences = {},
        }
      end,
    }

    use 'sigmasd/deno-nvim'

    -- Autocomplete
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'L3MON4D3/LuaSnip',
        'onsails/lspkind.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/vim-vsnip',
      },
    }
    use({ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" })

    use { 'saadparwaiz1/cmp_luasnip' }
    use "rafamadriz/friendly-snippets"


    -- Search in file using less chars
    use "ggandor/leap.nvim"

    -- Comment toggler
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }

    -- Statusline
    use {
      'feline-nvim/feline.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
    }

    -- git labels
    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
    }

    -- git viewer and helpers
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }


    -- Dashboard (start screen)
    use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
    }

    use { "williamboman/mason.nvim" }
    use 'folke/neodev.nvim'
    -- use {'mfussenegger/nvim-dap', requires = { "theHamsta/nvim-dap-virtual-text", "nvim-neotest/nvim-nio" }}


    --Databases
    use {
      'kopecmaciej/vi-mongo.nvim',
      config = function()
        require('vi-mongo').setup()
      end
    }





    -- Golang
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua' -- recommended if need floating window support


    -- Markdown preview
    use { "ellisonleao/glow.nvim" }
    -- use {
    --   'edluffy/hologram.nvim',
    --   config = function()
    --     require('hologram').setup {
    --       auto_display = true -- WIP automatic markdown image display, may be prone to breaking
    --     }
    --   end
    -- }

    use {
      "3rd/image.nvim",
      build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
      opts = {},
      config = function()
        require("image").setup({
          backend = "kitty",
          processor = "magick_cli", -- or "magick_cli"
          integrations = {
            markdown = {
              enabled = true,
              clear_in_insert_mode = false,
              download_remote_images = true,
              only_render_image_at_cursor = false,
              floating_wsindows = false,             -- if true, images will be rendered in floating markdown windows
              filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
            },
            neorg = {
              enabled = true,
              filetypes = { "norg" },
            },
            typst = {
              enabled = true,
              filetypes = { "typst" },
            },
            html = {
              enabled = false,
            },
            css = {
              enabled = false,
            },
          },
          max_width = nil,
          max_height = nil,
          max_width_window_percentage = nil,
          max_height_window_percentage = 50,
          window_overlap_clear_enabled = false,                                               -- toggles images when windows are overlapped
          window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
          editor_only_render_when_focused = false,                                            -- auto show/hide images when the editor gains/looses focus
          tmux_show_only_in_active_window = false,                                            -- auto show/hide images in the correct Tmux window (needs visual-activity off)
          hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
        })
      end,
    }

    use {
      "3rd/diagram.nvim",
      requires = {
        "3rd/image.nvim",
      },
      opts = { -- you can just pass {}, defaults below
        renderer_options = {
          mermaid = {
            background = nil, -- nil | "transparent" | "white" | "#hex"
            theme = nil,      -- nil | "default" | "dark" | "forest" | "neutral"
            scale = 1,        -- nil | 1 (default) | 2  | 3 | ...
            width = nil,      -- nil | 800 | 400 | ...
            height = nil,     -- nil | 600 | 300 | ...
          },
          plantuml = {
            charset = nil,
          },
          d2 = {
            theme_id = nil,
            dark_theme_id = nil,
            scale = nil,
            layout = nil,
            sketch = nil,
          },
          gnuplot = {
            size = nil,  -- nil | "800,600" | ...
            font = nil,  -- nil | "Arial,12" | ...
            theme = nil, -- nil | "light" | "dark" | custom theme string
          },
        }
      },
      config = function()
        require("diagram").setup({
          integrations = {
            require("diagram.integrations.markdown"),
            require("diagram.integrations.neorg"),
          },
          renderer_options = {
            mermaid = {
              theme = "forest",
            },
            plantuml = {
              charset = "utf-8",
            },
            d2 = {
              theme_id = 1,
            },
            gnuplot = {
              theme = "dark",
              size = "800,600",
            },
          },
        })
      end,
    }


    -- use { 'anuvyklack/pretty-fold.nvim',
    --   config = function()
    --     require('pretty-fold').setup({
    --       fold_closed = '', -- Closed fold icon
    --       fold_opened = '', -- Opened fold icon
    --       highlight = "Comment", -- Color for fold text
    --     })
    --   end
    -- }
    use { 'anuvyklack/fold-preview.nvim',
      requires = 'anuvyklack/keymap-amend.nvim',
      config = function()
        require('fold-preview').setup()
      end
    }

    use {
      'pwntester/octo.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'folke/snacks.nvim',
        'kyazdani42/nvim-web-devicons',
      },
      config = function()
        require "octo".setup({
          ssh_aliases = {
            ["github.com"] = "github.com",
          },

        })
      end
    }

    -- AI SHIT
    use 'github/copilot.vim'
    use 'tzachar/cmp-ai'
    local function local_llm_streaming_handler(chunk, ctx, F)
      if not chunk then
        return ctx.assistant_output
      end
      local tail = chunk:sub(-1, -1)
      if tail:sub(1, 1) ~= "}" then
        ctx.line = ctx.line .. chunk
      else
        ctx.line = ctx.line .. chunk
        local status, data = pcall(vim.fn.json_decode, ctx.line)
        if not status or not data.message.content then
          return ctx.assistant_output
        end
        ctx.assistant_output = ctx.assistant_output .. data.message.content
        F.WriteContent(ctx.bufnr, ctx.winid, data.message.content)
        ctx.line = ""
      end
      return ctx.assistant_output
    end

    local function local_llm_parse_handler(chunk)
      local assistant_output = chunk.message.content
      return assistant_output
    end

    use({
      "Kurama622/llm.nvim",
      requires = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
      config = function()
        require("llm").setup({
          url = "http://127.0.0.1:1234/v1/chat/completions",
          model = "qwen/qwen3-coder-30b",
          api_type = "openai",
          streaming_handler = local_llm_parse_handler
        })
      end,
    })


    use({
      "olimorris/codecompanion.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
      }
    })

    use({
      'milanglacier/minuet-ai.nvim'
    })


    -- lookings
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }


    use {
      'ravitemer/mcphub.nvim',
      requires = { 'nvim-lua/plenary.nvim' }, -- Required for Job and HTTP requests
      cmd = "MCPHub",                         -- lazy load by default
      run = "npm install -g mcp-hub@latest",  -- Installs required mcp-hub npm module
      config = function()
        require("mcphub").setup()
      end,
    }
    -- use {
    --   "yetone/avante.nvim",
    --   build = "make BUILD_FROM_SOURCE=true",
    --   lazy = false,
    --   version = false,
    --   BUILD_FROM_SOURCE = true,
    --   config = function()
    --     require("avante_lib").load()
    --     require("avante").setup()
    --   end,
    --   requires = {
    --     "nvim-treesitter/nvim-treesitter",
    --     "stevearc/dressing.nvim",
    --     "nvim-lua/plenary.nvim",
    --     "MunifTanjim/nui.nvim",
    --     --- The below dependencies are optional,
    --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    --     "HakonHarnes/img-clip.nvim",
    --   },
    -- }

    use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    }
    use({
      'MeanderingProgrammer/render-markdown.nvim',
      after = { 'nvim-treesitter' },
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
      config = function()
        require('render-markdown').setup({
          completions = { lsp = { enabled = true } },
          file_types = { 'markdown', 'codecompanion', 'octo' }
        })
      end,
    })

    -- Kubernetes
    -- https://github.com/arjunmahishi/k8s.nvim
    use {
      'arjunmahishi/k8s.nvim',
      config = function()
        require 'k8s'.setup {
        }
      end
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
