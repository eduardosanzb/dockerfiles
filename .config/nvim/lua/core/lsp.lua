
vim.lsp.config('copilot',{
  cmd = { 'copilot-language-server', '--stdio', },
  root_markers = { '.git' },
})

vim.lsp.enable('copilot')
vim.print(
vim.lsp.inline_completion
)
