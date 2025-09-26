return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  config = function()
    local status_ok, avante = pcall(require, 'avante')
    if not status_ok then
        return
    end

    avante.setup()
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "zbirenbaum/copilot.lua",
  },
}