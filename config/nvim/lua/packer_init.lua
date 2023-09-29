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

    use 'wakatime/vim-wakatime'

    -- File explorer
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'

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

    -- Treesitter interface
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-context'

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.3',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
        { "mfussenegger/nvim-dap" }
      }
    }

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
    use 'ellisonleao/gruvbox.nvim'
    use 'https://gitlab.com/HiPhish/resolarized.nvim.git'
    use { "catppuccin/nvim", as = "catppuccin" }

    use 'f-person/auto-dark-mode.nvim'
    use "delphinus/auto-cursorline.nvim"


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

    use 'sigmasd/deno-nvim'

    -- Autocomplete
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/vim-vsnip'
      },
    }

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
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use 'leoluz/nvim-dap-go'


    -- Markdown preview
    use { "ellisonleao/glow.nvim" }
    use {
      'edluffy/hologram.nvim',
      config = function()
        require('hologram').setup {
          auto_display = true -- WIP automatic markdown image display, may be prone to breaking
        }
      end
    }


    use { 'anuvyklack/pretty-fold.nvim',
      config = function()
        require('pretty-fold').setup()
      end
    }
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
        'nvim-telescope/telescope.nvim',
        'kyazdani42/nvim-web-devicons',
      },
      config = function()
        require "octo".setup()
      end
    }

    use 'github/copilot.vim'

    -- Unless you are still migrating, remove the deprecated commands from v1.x

    use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    }

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
