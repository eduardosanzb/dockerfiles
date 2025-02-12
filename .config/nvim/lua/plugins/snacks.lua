-----------------------------------------------------------
-- Snacks
----------------------------------------------------------

-- Plugin: snacks.nvim
-- url: https://github.com/folke/snacks.nvim

local status_ok, snacks = pcall(require, 'snacks')

if not status_ok then
  return
end

snacks.setup({
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    gitbrowse = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true } -- Wrap notifications
      }
    }
})
