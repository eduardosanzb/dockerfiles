EduardoSanzbWindowFocus = require('../eduardosanzb/nvim-focus')

-- need a map method to handle the different kinds of key maps
local function map(mode, combo, mapping, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, combo, mapping, options)
end


-- OUR BELOVED SPACE AS THE LEADEEER!
vim.g.mapleader = " "


-- Disable arrow keys --
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Control window --
map('', '<leader>h', ':wincmd h<CR>')
map('', '<leader>l', ':wincmd l<CR>')
map('', '<leader>j', ':wincmd j<CR>')
map('', '<leader>k', ':wincmd k<CR>')
    -- swap splits
map('n', '<leader>ws', '<C-w><C-r>')
    -- Focus on window custom function
map('', '<leader>wf', ':lua EduardoSanzbWindowFocus()<CR>')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Terminal --
map('n', '<leader>t', ':belowright sp term://zsh<CR>', { noremap = true })
map('n', '<leader>vt', ':belowright vs term://zsh<CR>', { noremap = true })
map('t', '<Esc>', '<C-\\><C-n><CR>')

-- Plugins --
    -- TreeSitter
map('', '<tab>', ":NvimTreeToggle<CR>")

    -- Telescope
map('', "<leader>ps", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For >')})<CR>")
map('', "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>")
map('', "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>")
map('', "<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>")
map('', "<leader>km", ":lua require('telescope.builtin').keymaps()<CR>")
map('', "<leader>fr", ":lua require('telescope.builtin').resume()<CR>")
