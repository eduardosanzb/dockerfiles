

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
map('', '<up>', ':wincmd + <CR>')
map('', '<down>', ':wincmd - <CR>')
map('', '<left>', ':wincmd > <CR>')
map('', '<right>', ':wincmd < <CR>')

-- Control window --
map('', '<leader>h', ':wincmd h<CR>')
map('', '<leader>l', ':wincmd l<CR>')
map('', '<leader>j', ':wincmd j<CR>')
map('', '<leader>k', ':wincmd k<CR>')
map('', '<leader>pf', ':wincmd_ | wincmd|<CR>')


map('n', '<leader>we', '<C-w><C-=>')
map('n', '<leader>ws', '<C-w><C-r>') -- swap splits
map('', '<leader>wf', ':lua EduardoSanzbWindowFocus()<CR>') -- Focus on window custom function


-- Reload configuration without restart nvim
map('n', '<leader>ro', ':so %<CR>')

-- Terminal --
map('n', '<leader>t', ':belowright sp term://zsh<CR>', { noremap = true })
map('n', '<leader>vt', ':belowright vs term://zsh<CR>', { noremap = true })
map('t', '<Esc>', '<C-\\><C-n><CR>')

-- Plugins --
  -- TreeSitter
map('', '<tab>', ":lua require('nvim-tree').toggle(false, true)<CR>")
map('', '<leader><tab>', ":lua require('nvim-tree').focus()<CR>")
map('', '<leader>e', ":norm zR<CR>")

  -- Telescope
    -- files
map('', "<leader>ps", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For >')})<CR>")
map('', "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>")
map('', "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>")
map('', "<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>")
map('', "<leader>km", ":lua require('telescope.builtin').keymaps()<CR>")
map('', "<leader>fr", ":lua require('telescope.builtin').resume()<CR>")
map('', "<leader>fo", ":Telescope oldfiles<CR>")
    -- lsp
map('', "<leader>gi", ":lua require('telescope.builtin').lsp_implementations()<CR>")
map('', "<leader>gD", ":lua require('telescope.builtin').lsp_type_definitions()<CR>")
map('', "<leader>gd", ":lua require('telescope.builtin').lsp_definitions()<CR>")
map('', "<leader>gr", ":lua require('telescope.builtin').lsp_references()<CR>")
map('', "<leader>gs", ":lua require('telescope.builtin').lsp_document_symbols()<CR>")
map('', "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
map('', "<space>f",   ":lua vim.lsp.buf.formatting()<CR>")
map('n', 'K',         ':lua vim.lsp.buf.hover()<CR>')
map('n', '<space>ca', ':lua vim.lsp.buf.code_action()<CR>')

-- Git
map('', "<leader>do", ":DiffviewOpen<CR>")
map('', "<leader>dc", ":DiffviewClose<CR>")
map('', "<leader>dh", ":DiffviewFileHistory<CR>")

-- markdown
map('n', '<leader>md', ":Glow<CR>")

-- colorscheme
map('n', '<leader>cd', ':Catppuccin frappe<CR>')
map('n', '<leader>cl', ':Catppuccin latte<CR>')

