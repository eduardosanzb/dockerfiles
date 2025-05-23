local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
    vim.notify("autodark - dark mode")
    vim.api.nvim_set_option('background', 'dark')
  --  if vim.g.colors_name ~= "xcode" then
  --     vim.cmd('colorscheme xcode')
  --   end
	end,
	set_light_mode = function()
    vim.notify("autodark - light mode")
		vim.api.nvim_set_option('background', 'light')
    -- if vim.g.colors_name ~= "default" then
    --   vim.cmd('colorscheme default')
    -- end
	end,
})
-- auto_dark_mode.init()
