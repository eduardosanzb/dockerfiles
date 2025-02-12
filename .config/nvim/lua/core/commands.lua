
-- Write file also with upper W.
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wa', 'wa', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('Q', 'q', {})

if vim.g.neovide then
  vim.notify("neovide is running")
	vim.api.nvim_set_keymap('v', '<D-c>', '"+y', {noremap = true})
	vim.api.nvim_set_keymap('n', '<D-v>', 'l"+P', {noremap = true})
	vim.api.nvim_set_keymap('v', '<D-v>', '"+P', {noremap = true})
	vim.api.nvim_set_keymap('c', '<D-v>', '<C-o>l<C-o>"+<C-o>P<C-o>l', {noremap = true})
	vim.api.nvim_set_keymap('i', '<D-v>', '<ESC>l"+Pli', {noremap = true})
	vim.api.nvim_set_keymap('t', '<D-v>', '<C-\\><C-n>"+Pi', {noremap = true})
end

