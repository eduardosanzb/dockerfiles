return {
  "nvim-treesitter/nvim-treesitter-context",
  config = function()
    local status_ok, treesitterContext = pcall(require, 'treesitter-context')
    if not status_ok then
      return
    end

    treesitterContext.setup {}
  end,
}