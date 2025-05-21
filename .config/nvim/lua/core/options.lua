vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.smarttab = true

local indent = 2

vim.opt.tabstop = indent
vim.opt.shiftwidth = indent
vim.opt.softtabstop = indent
vim.opt.expandtab = true

vim.opt.mouse = 'a'
vim.opt.guicursor = ''

-- " vimrc config per project
vim.opt.exrc = true

vim.opt.hidden = true

-- vim.wo.noerrorbells
vim.cmd('set nowrap' )

-- " TODO
-- " For the seatch?
-- "vim.opt.smartindent
-- vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff=8
-- vim.cmd('signcolumn yes')
vim.opt.colorcolumn = '160'


vim.cmd("language en_US.utf-8")


if vim.g.neovide then
  vim.keymap.set({ "n", "x" }, "<C-S-C>", '"+y', { desc = "Copy system clipboard" })
  vim.keymap.set({ "n", "x" }, "<C-S-V>", '"+p', { desc = "Paste system clipboard" })
end

vim.opt.foldmethod = "syntax" -- or "indent" for simpler folding
vim.opt.foldlevelstart = 99       -- Open all folds by default
