-----------------------------------------------------------
-- Snacks
----------------------------------------------------------

-- Plugin: snacks.nvim
-- url: https://github.com/folke/snacks.nvim

local status_ok, Snacks = pcall(require, "snacks")

if not status_ok then
  return
end

Snacks.setup({
  bigfile = { enabled = true },
  dashboard = { enabled = false },
  indent = { enabled = true },
  input = {
    enabled = true,
    win = {
      relative = "editor",
      position = "bottom",
      size = { width = 0, height = 1 },
      border = "none",
    },
  },
  explorer = { enabled = true },
  image = { enabled = true },
  notifier = {
    enabled = true,
    timeout = 3000,
  },
  scope = { enabled = true },
  quickfile = { enabled = true },
  picker = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  toggle = { enabled = true},
  words = { enabled = true },
  gitbrowse = { enabled = true },
  styles = {
    notification = {
      wo = { wrap = true }, -- Wrap notifications
    },
  },
})

vim.ui.input = Snacks.input

-- Override vim.ui.select for choice selections
vim.ui.select =  Snacks.picker.select
