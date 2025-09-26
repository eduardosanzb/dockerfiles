-- Keymaps
local function map(mode, combo, mapping, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, combo, mapping, options)
end

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable arrow keys
map("", "<up>", "<cmd>wincmd +<CR>")
map("", "<down>", "<cmd>wincmd -<CR>")
map("", "<left>", "<cmd>wincmd ><CR>")
map("", "<right>", "<cmd>wincmd <<CR>")

-- Window navigation
map("", "<leader>h", "<cmd>wincmd h<CR>")
map("", "<leader>l", "<cmd>wincmd l<CR>")
map("", "<leader>j", "<cmd>wincmd j<CR>")
map("", "<leader>k", "<cmd>wincmd k<CR>")
map("", "<leader>pf", "<cmd>wincmd_ | wincmd|<CR>")

map("n", "<leader>we", "<C-w><C-=>")
map("n", "<leader>ws", "<C-w><C-r>") -- swap splits

-- Reload configuration
map("n", "<leader>ro", "<cmd>so %<CR>")

-- Wrap toggle
function Swap_wrap()
  if vim.wo.wrap then
    vim.wo.wrap = false
    vim.wo.linebreak = false
    vim.cmd("set nowrap")
  else
    vim.wo.wrap = true
    vim.wo.linebreak = true
    vim.cmd("set wrap")
  end
end

map("n", "<leader>wr", "<cmd>lua Swap_wrap()<CR>")

-- Terminal
map("n", "<leader>t", "<cmd>belowright sp term://zsh<CR>", { noremap = true })
map("n", "<leader>vt", "<cmd>belowright vs term://zsh<CR>", { noremap = true })
map("t", "<leader><Esc>", "<C-\\><C-n>")

-- Paste
map("", "<leader>cp", "<cmd>w !pbcopy<CR>")

-- File explorer (NvimTree)
map("", "<tab>", "<cmd>NvimTreeToggle<CR>")
map("", "<leader><tab>", "<cmd>NvimTreeFindFile<CR>")

-- Telescope
map("", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("", "<leader>fg", "<cmd>Telescope live_grep_args<CR>")
map("", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("", "<leader>fh", "<cmd>Telescope help_tags<CR>")

-- LSP
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>")
map("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>")
map("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>")
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")

-- Git
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>")
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>")
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>")

-- Commenting
map("n", "<leader>/", "<cmd>lua require(\"Comment.api\").toggle.linewise.current()<CR>")
map("v", "<leader>/", "<esc><cmd>lua require(\"Comment.api\").toggle.linewise(vim.fn.visualmode())<CR>")

-- Surround
-- Uses default bindings: ys, cs, ds

-- DAP
map("n", "<leader>du", "<cmd>lua require(\"dapui\").toggle()<CR>")
map("n", "<leader>dc", "<cmd>lua require(\"dap\").continue()<CR>")
map("n", "<leader>db", "<cmd>lua require(\"dap\").toggle_breakpoint()<CR>")
map("n", "<leader>dn", "<cmd>lua require(\"dap\").step_over()<CR>")
map("n", "<leader>di", "<cmd>lua require(\"dap\").step_into()<CR>")
map("n", "<leader>do", "<cmd>lua require(\"dap\").step_out()<CR>")

-- Markdown
map("n", "<leader>md", "<cmd>Glow<CR>")

-- Go
map("n", "<leader>rt", "<cmd>GoTest -v -a -enable-mock-server=true<CR>")
