vim.cmd('highlight ColorColumn ctermbg=1 guibg=red')

-- vim.cmd('colorscheme xcode')
vim.cmd('colorscheme catppuccin')

-- configure catppuccin
local catppuccin = require("catppuccin")

catppuccin.setup({
   background = {
        light = "latte",
        dark = "macchiato",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.35, -- percentage of the shade to apply to the inactive window
    },
})


-- Transparency setup
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   pattern = "*",
--   callback = function()
--     local background = vim.o.background
--     local colorscheme = vim.g.colors_name
--     local originaBgAndColorscheme = "original: "..background.." / "..colorscheme
--     vim.notify(originaBgAndColorscheme)
--
--     if vim.o.background == "light" then
--       if vim.g.colors_name ~= "default" then
--        vim.cmd('colorscheme default')
--        vim.cmd('redraw')
--        return
--       end
--
--       local changedBgAndColorscheme ="changed"..vim.o.background.." "..vim.colorscheme
--       vim.notify(changedBgAndColorscheme)
--       return -- no transparent mode
--     end
--
--     if vim.o.background == "dark" and vim.g.colors_name ~= "xcode" then
--       vim.cmd('colorscheme xcode')
--       vim.cmd('redraw')
--       vim.notify("dark mode with "..vim.g.colors_name)
--     end
--
--     -- transparent background
--     vim.notify("transparent mode")
--     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
--     vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
--     vim.api.nvim_set_hl(0, "Terminal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
--     vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
--     vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
--     vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
--     vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none" })
--     vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
--     vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
--     vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "none" })
--
--     -- transparent background for neotree
--     vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NeoTreeVertSplit", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "none" })
--
--     -- transparent background for nvim-tree
--     vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
--
--     -- transparent notify background
--     vim.api.nvim_set_hl(0, "NotifyINFOBody", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NotifyERRORBody", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NotifyWARNBody", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NotifyTRACEBody", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NotifyINFOTitle", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NotifyERRORTitle", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NotifyWARNTitle", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NotifyTRACETitle", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NotifyINFOBorder", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NotifyERRORBorder", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NotifyWARNBorder", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { bg = "none" })
--   end
-- })
