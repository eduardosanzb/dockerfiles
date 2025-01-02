-----------------------------------------------------------
-- Treesitter-context configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter-context
-- url: https://github.com/nvim-treesitter/nvim-treesitter-context

local status_ok, treesitterContext = pcall(require, 'treesitter-context')
if not status_ok then
  return
end

treesitterContext.setup {}
