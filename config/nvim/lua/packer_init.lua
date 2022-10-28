-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    k 'clone',
    o '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
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

return packer.startup({ function(use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'

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
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' }, { "nvim-telescope/telescope-live-grep-args.nvim" }, }
  }
  -- Color schemes
  use 'navarasu/onedark.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'https://gitlab.com/HiPhish/resolarized.nvim.git'
  use { "catppuccin/nvim", as = "catppuccin" }
  use "delphinus/auto-cursorline.nvim"


  -- shadow of multiwindows
  use 'sunjon/shade.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  -- LSP plugin for typescript
  use 'jose-elias-alvarez/typescript.nvim'

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
  use 'mfussenegger/nvim-dap'

  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }


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
