require('packer_init')

require('core/chinook')
require('core/keybindings')
require('core/options')
require('core/statusline')

require('plugins/alpha-nvim')
require('plugins/indent-blankline')
require('plugins/nvim-cmp')
require('plugins/nvim-lspconfig')
require('plugins/nvim-tree')
require('plugins/nvim-treesitter')
require('plugins/treesitter-context')
require('plugins/gitsigns')

require('plugins/mason')
require('plugins/nvim-dap')



require('eduardosanzb')

-- Autocommands need to be sourced at the end!
require('core/autocommands')
