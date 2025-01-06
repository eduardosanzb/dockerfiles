

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

-- Copilot --
vim.api.nvim_set_keymap('i', '<C-/>', 'copilot#Accept("<CR>")', {expr=true, silent=true})

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

-- paste --
map('', '<leader>cp', ":w !pbcopy<CR>")

-- Terminal --
map('n', '<leader>t', ':belowright sp term://zsh<CR>', { noremap = true })
map('n', '<leader>vt', ':belowright vs term://zsh<CR>', { noremap = true })
map('t', '<C-Esc>', '<C-\\><C-n><CR>')

-- Plugins --
  -- TreeSitter
map('', '<tab>', ":lua require('nvim-tree.api').tree.toggle({ focus = false })<CR>")
map('', '<leader><tab>', ":lua require('nvim-tree.api').tree.open({ find_file = true })<CR>")
map("n", "<leader>mn", ":lua require('nvim-tree.api').marks.navigate.next()<CR>")
map("n", "<leader>mp", ":lua require('nvim-tree.api').marks.navigate.prev()<CR>")
map("n", "<leader>ms", ":lua require('nvim-tree.api').marks.navigate.select()<CR>")
map('', '<leader>ex', ":norm zR<CR>")

  -- Telescope
    -- files
map('', "<leader>ps", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For >')})<CR>")
map('', "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>")

-- map('', "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>")
map("", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

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
map('', "<leader>sd", ":lua require('telescope.builtin').diagnostics()<CR>")
map('', "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")

function RunPrettierAngGofmt()
    local file_extension = vim.fn.expand('%:e')
    local prettier_languages = {'js', 'ts', 'json', 'yaml', 'yml'} -- Add more languages if needed

    if file_extension == 'go' then
        vim.cmd('GoFmt')
    elseif vim.fn.index(prettier_languages, file_extension) >= 0 then
        vim.cmd('Prettier')
    else
        print("No matching formatter for this file type.")
    end
end



map('n', "<leader>f",   ":lua RunPrettierAngGofmt()<CR>")
map('n', 'K',         ':lua vim.lsp.buf.hover()<CR>')
map('n', '<space>ca', ':lua vim.lsp.buf.code_action()<CR>')
map ('n', '<space>e', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>')

-- lsp saga
map ('n', 'sd', ':Lspsaga peek_type_definition<CR>')

-- lsp k8s
map('n', '<leader>kn', ':K8sNamespaces<CR>')


-- Git
-- map('', "<leader>do", ":DiffviewOpen<CR>")
-- map('', "<leader>dc", ":DiffviewClose<CR>")
-- map('', "<leader>dh", ":DiffviewFileHistory<CR>")

-- markdown
map('n', '<leader>md', ":Glow<CR>")

-- colorscheme
map('n', '<leader>cd', ':set background=dark<CR>')
map('n', '<leader>cl', ':set background=light<CR>')

-- Liveplatform
map('n', '<leader>fp', ':!yarn format<CR>')

-- Dap
map('n', '<leader>du', ':lua require("dapui").toggle()<CR>')
-- map for continue, breakpoint, stepover, stepinto, stepout
map('n', '<leader>dc', ':lua require("dap").continue()<CR>')
map('n', '<leader>db', ':lua require("dap").toggle_breakpoint()<CR>')
map('n', '<leader>dn', ':lua require("dap").step_over()<CR>')
map('n', '<leader>di', ':lua require("dap").step_into()<CR>')
map('n', '<leader>do', ':lua require("dap").step_out()<CR>')

-- GOlang
map('n', '<leader>rt', ':GoTest -v -a -enable-mock-server=true <CR>')




