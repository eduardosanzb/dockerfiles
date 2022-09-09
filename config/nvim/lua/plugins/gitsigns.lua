
-----------------------------------------------------------
-- Nvim-sourround configuration file
----------------------------------------------------------

-- Plugin: gitsigns.nvim
-- url: https://github.com/lewis6991/gitsigns.nvim

local status_ok, gitsigns = pcall(require, 'gitsigns')

if not status_ok then
    return
end

gitsigns.setup {
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs
    numhl      = true, -- Toggle with `:Gitsigns toggle_numhl
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 100
    }
}

