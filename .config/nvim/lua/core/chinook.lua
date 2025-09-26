vim.cmd('highlight ColorColumn ctermbg=1 guibg=red')


-- configure catppuccin
local catppuccin = require("catppuccin")

catppuccin.setup({
  flavour = "auto", -- latte, frappe, macchiato, mocha
  background = {    -- :h background
    light = "latte",
    dark = "mocha",
  },
  float = {
    transparent = false,     -- enable transparent floating windows
    solid = true,            -- use solid styling for floating windows, see |winborder|
  },
  show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
  term_colors = true,
  transparent_background = true,
  dim_inactive = {
    enabled = false,   -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15, -- percentage of the shade to apply to the inactive window
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    treesitter = true,
    harpoon = true,
    telescope = true,
    mason = true,
    noice = true,
    notify = true,
    which_key = true,
    fidget = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    }
  }
}
)

local tokyonight = require("tokyonight")
tokyonight.setup({
  style = "moon",         -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day",    -- The theme is used when the background is set to light
  transparent = true,     -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "transparent",       -- style for sidebars, see below
    floats = "transparent",         -- style for floating windows
  },
  sidebars = { "qf", "help" },      -- Set the sidebar styles to "dark", "transparent" or "normal" (default is normal)
  day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false,             -- dims inactive windows
  lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold
})


vim.cmd('colorscheme catppuccin')
vim.cmd('colorscheme tokyonight-moon')
