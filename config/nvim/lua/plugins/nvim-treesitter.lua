-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

nvim_treesitter.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    'bash', 'css', 'html', 'javascript', 'json', 'lua',
    'typescript', 'vim', 'go', 'graphql', 'yaml'
   },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
}

--folding based on treesitter
vim.api.nvim_exec([[
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]], true)
