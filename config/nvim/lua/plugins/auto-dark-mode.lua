local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.api.nvim_set_option('background', 'dark')
		vim.cmd('colorscheme xcode')
	end,
	set_light_mode = function()
		vim.api.nvim_set_option('background', 'light')
		vim.cmd('colorscheme xcode')
	end,
})
auto_dark_mode.init()
