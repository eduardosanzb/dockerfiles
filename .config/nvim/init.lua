require('packer_init')

require('plugins/snacks')

require('core/chinook')
require('core/commands')
require('core/keybindings')
require('core/options')
require('core/statusline')


require('plugins/nvim-dap')

require('plugins/alpha-nvim')
require('plugins/gitsigns')
require('plugins/indent-blankline')
require('plugins/mason')
require('plugins/nvim-cmp')
require('plugins/nvim-lspconfig')
require('plugins/nvim-surround')
require('plugins/nvim-telescope')
require('plugins/nvim-tree')
require('plugins/nvim-treesitter')
require('plugins/treesitter-context')
require('plugins/nvim-neo-tree')
require('plugins/glow-nvim')
require('plugins/auto-cursorline')
require('plugins/leap')
require('plugins/lsp-saga')
require('plugins/go')

require('eduardosanzb')

require('plugins/auto-dark-mode')


-- Autocommands need to be sourced at the end!
require('core/autocommands')

-- Copilot setup
vim.cmd([[ let g:copilot_filetypes = {  'markdown': v:true, 'yaml': v:true } ]])
