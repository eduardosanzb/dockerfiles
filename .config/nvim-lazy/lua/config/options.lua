-- LazyVim and Neovide options configuration

-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smarttab = true

local indent = 2
vim.opt.tabstop = indent
vim.opt.shiftwidth = indent
vim.opt.softtabstop = indent
vim.opt.expandtab = true

vim.opt.mouse = "a"
vim.opt.guicursor = ""

-- Project-specific vimrc config
vim.opt.exrc = true

vim.opt.hidden = true
vim.opt.wrap = false

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "160"

vim.cmd("language en_US.utf-8")

-- Neovide settings
if vim.g.neovide then
  vim.keymap.set({ "n", "x" }, "<C-S-C>", "+y", { desc = "Copy system clipboard" })
  vim.keymap.set({ "n", "x" }, "<C-S-V>", "+p", { desc = "Paste system clipboard" })
end

-- Open all folds by default
vim.opt.foldlevelstart = 99

-- Better search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Better backup and swap files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Enable undo history
vim.opt.undofile = true

-- Enable 24-bit RGB color
vim.opt.termguicolors = true

-- Enable sign column all the time to prevent shifting
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 50

-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt.spell = true
  end,
})
