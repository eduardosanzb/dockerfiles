return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local status_ok, nvim_tree = pcall(require, 'nvim-tree')
    if not status_ok then
      return
    end

    -- Call setup:
    nvim_tree.setup({
      sort = {
        sorter = "case_sensitive",
      },

      view = {
        width = 40,
        relativenumber = true,
        preserve_window_proportions = true,

      },

      renderer = {
        group_empty = true,
        full_name = true,
      },

      modified = {
        enable = true,
      },

      filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
      },

      tab = {
        sync = {
          open = true,
          close = true,

        }
      }
    })
  end,
}