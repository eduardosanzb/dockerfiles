-- need a map method to handle the different kinds of key maps
local function map(mode, combo, mapping, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, combo, mapping, options)
end


-- OUR BELOVED SPACE AS THE LEADEEER!
vim.g.mapleader = " "

-- AI SHIT --

function AcceptAI()
  local tempbuf = vim.api.nvim_create_buf(false, true)
  vim.cmd('redir @+ | Copilot status | redir END')
  local copilot_status = vim.fn.getreg('+') -- uses '+', adjust if needed
  vim.api.nvim_buf_delete(tempbuf, { force = true })
  if copilot_status:match("Ready") then
    vim.print("copi")
    return "copilot#Accept(\"<CR>\")"
  end

  vim.print("then minuet")
  local min_actions = require('minuet.virtualtext').action
  if min_actions.is_visible() then --
    return min_actions.accept()
  end


  --toast a warning

  return "<Nop>" -- do nothing if neither is active
end

vim.api.nvim_set_keymap('i', '<C-/>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
-- vim.keymap.set('i', '<C-/>', function()
--     AcceptAI()
--     return ''
-- end, { silent = true })


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
map('n', '<leader>ws', '<C-w><C-r>')                        -- swap splits
map('', '<leader>wf', ':lua EduardoSanzbWindowFocus()<CR>') -- Focus on window custom function


-- Reload configuration without restart nvim
map('n', '<leader>ro', ':so %<CR>')

-- Swap wrap
function Swap_wrap()
  if vim.wo.wrap then
    vim.wo.wrap = false
    vim.wo.linebreak = false
    vim.cmd('set nowrap')
  else
    vim.wo.wrap = true
    vim.wo.linebreak = true
    vim.cmd('set wrap')
  end
end
map('n', '<leader>wr', ':lua Swap_wrap()<CR>')

-- paste --
map('', '<leader>cp', ":w !pbcopy<CR>")

-- Terminal --
map('n', '<leader>t', ':belowright sp term://zsh<CR>', { noremap = true })
map('n', '<leader>vt', ':belowright vs term://zsh<CR>', { noremap = true })
map('t', '<leader><Esc>', '<C-\\><C-n><CR>')

-- Plugins --
-- Nvim tree
map('', '<tab>', ":lua require('nvim-tree.api').tree.toggle({ focus = false })<CR>")
map('', '<leader><tab>', ":lua require('nvim-tree.api').tree.open({ find_file = true })<CR>")
map("n", "<leader>mn", ":lua require('nvim-tree.api').marks.navigate.next()<CR>")
map("n", "<leader>mp", ":lua require('nvim-tree.api').marks.navigate.prev()<CR>")
map("n", "<leader>ms", ":lua require('nvim-tree.api').marks.navigate.select()<CR>")
map('', '<leader>ex', ":norm zR<CR>")

map('', "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")

-- Snacks
map('n', "<leader>n", ":lua Snacks.picker.notifications()<CR>")
map('n', "<leader>ch", ":lua Snacks.picker.command_history()<CR>")

-- Files
map('n', "<leader>ps", ":lua local search = vim.fn.input('Grep For > '); if search ~= '' then Snacks.picker.grep({ search = search }) end<CR>")
map('n', "<leader>ff", ":lua Snacks.picker.files({ hidden = true, follow = true })<CR>")



map('n', "<leader>fg", ":lua Snacks.picker.grep()<CR>")
map('n', "<leader>/", ":lua Snacks.picker.lines()<CR>")
map('n', "<leader>fh", ":lua Snacks.picker.help()<CR>")
map('n', "<leader>km", ":lua Snacks.picker.keymaps()<CR>")
map('n', "<leader>fr", ":lua Snacks.picker.resume()<CR>")
map('n', "<leader>fo", ":lua Snacks.picker.recent()<CR>")

-- LSP
map('n', "<leader>gi", ":lua Snacks.picker.lsp_implementations()<CR>")
map('n', "<leader>gD", ":lua Snacks.picker.lsp_type_definitions()<CR>")
map('n', "<leader>gd", ":lua Snacks.picker.lsp_definitions()<CR>")
map('n', "<leader>gr", ":lua Snacks.picker.lsp_references()<CR>")
map('n', "<leader>gs", ":lua Snacks.picker.lsp_symbols()<CR>")
map('n', "<leader>sd", ":Trouble diagnostics toggle<CR>")

-- Git
-- map('n', "<leader>gb", ":lua Snacks.picker.git_branches()<CR>")
-- map('n', "<leader>gl", ":lua Snacks.picker.git_log()<CR>")
-- map('n', "<leader>gL", ":lua Snacks.picker.git_log_line()<CR>")
-- map('n', "<leader>gs", ":lua Snacks.picker.git_status()<CR>")
-- map('n', "<leader>gS", ":lua Snacks.picker.git_stash()<CR>")
-- map('n', "<leader>gd", ":lua Snacks.picker.git_diff()<CR>")
-- map('n', "<leader>gf", ":lua Snacks.picker.git_log_file()<CR>")

-- UI Overrides (discussed but not finalized)
-- Command line replacement options:
-- map('n', ':', ":lua Snacks.input({ prompt = ':', completion = 'cmdline', history = 'cmd' }, function(cmd) if cmd and cmd ~= '' then pcall(vim.cmd, cmd) end end)<CR>")
-- map('n', '<leader>:', ":lua Snacks.picker.commands()<CR>")
-- map('n', '<leader>ch', ":lua Snacks.picker.command_history()<CR>")


function RunPrettierAngGofmt()
  local file_extension = vim.fn.expand('%:e')
  local prettier_languages = { 'js', 'ts', 'json', 'yaml', 'yml' } -- Add more languages if needed

  -- log the fileextend
  if file_extension == 'go' then
    vim.cmd('GoFmt')
  elseif vim.fn.index(prettier_languages, file_extension) >= 0 then
    vim.cmd('Prettier')
  else
    print("No matching formatter for this file type.")
  end
end


map('n', "<leader>f", ":lua RunPrettierAngGofmt()<CR>")
-- map('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
map('n', 'K', '<Cmd>Lspsaga hover_doc<CR>')
map('n', '<space>ca', ':lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>e', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>')

-- lsp saga
map('n', 'sd', ':Lspsaga peek_type_definition<CR>')

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

-- trawa
map('n', '<leader>fp', ':Prettier <CR>')
map('n', '<leader>coe', ':Copilot enable<CR>')
map('n', '<leader>cod', ':Copilot disable<CR>')

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

-- lazygit
map('n', '<leader>lg', ':LazyGit<CR>')

-- git Browser
map('n', '<leader>ghf', ':Browse<CR>')
map('n', '<leader>ghl', ':BrowseLine<CR>')

-- codecompanion
-- map('n', '<leader>ccg', '')
