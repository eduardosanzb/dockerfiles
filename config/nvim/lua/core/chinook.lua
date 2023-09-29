-- colours and fonts
vim.cmd('highlight ColorColumn ctermbg=1 guibg=red')
local statusCatp, catppuccin = pcall(require, 'catppuccin')
if not statusCatp then
  return
end

catppuccin.setup({
  flavour = "frappe",
  transparent_background = false,
  background = {
    dark = "frappe",
    light = "latte",
  },
  term_colors = true,
  compile = {
    enabled = true,
    path = vim.fn.stdpath("cache") .. "/catppuccin",
  },
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.15,
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    -- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
    telescope = true,
    treesitter = true,
    treesitter_context = true,
    gitsigns = true,
    dashboard = true,
    nvimtree = true,
    coc_nvim = true,
  },
  color_overrides = {},
  highlight_overrides = {},
})
-- setup must be called before loading
vim.cmd('colorscheme catppuccin')

-- local statusGruv, gruvbox = pcall(require, 'gruvbox')
-- if not statusGruv then
--   return
-- end

-- gruvbox.setup({
--   undercurl = true,
--   underline = true,
--   bold = true,
--   italic = true,
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = true, -- invert background for search, diffs, statuslines and errors
--   contrast = "", -- can be "hard", "soft" or empty string
--   overrides = {},
-- })

