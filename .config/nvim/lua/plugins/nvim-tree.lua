-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

-- Plugin: nvim-tree
-- url: https://github.com/kyazdani42/nvim-tree.lua

-- Keybindings are defined in `core/keymaps.lua`:
-- https://github.com/kyazdani42/nvim-tree.lua#keybindings

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
-- nvim_tree.setup {
--   auto_reload_on_write = true,
--   create_in_closed_folder = false,
--   --disable_netrw = false, -> already disabled on `/core/options.lua`
--   hijack_netrw = true,
--   hijack_unnamed_buffer_when_opening = false,
--   open_on_tab = false,
--   sort_by = "name",
--   reload_on_bufenter = false,
--   respect_buf_cwd = false,
--   update_cwd = true,
--   view = {
--     centralize_selection = true,
--     adaptive_size = true,
--     width = 50,
--     hide_root_folder = false,
--     side = "left",
--     preserve_window_proportions = false,
--     number = true,
--     relativenumber = true,
--     signcolumn = "yes",
--     mappings = {
--       custom_only = false,
--       list = {
--         -- user mappings go here
--       },
--     },
--   },
--   renderer = {
--     add_trailing = false,
--     group_empty = false,
--     highlight_git = false,
--     highlight_opened_files = "all",
--     root_folder_modifier = ":~",
--     indent_markers = {
--       enable = false,
--       icons = {
--         corner = "└ ",
--         edge = "│ ",
--         none = "  ",
--       },
--     },
--     icons = {
--       webdev_colors = true,
--       git_placement = "before",
--       padding = " ",
--       symlink_arrow = " ➛ ",
--       show = {
--         file = true,
--         folder = true,
--         folder_arrow = true,
--         git = true,
--       },
--       glyphs = {
--         default = "",
--         symlink = "",
--         folder = {
--           arrow_closed = "",
--           arrow_open = "",
--           default = "",
--           open = "",
--           empty = "",
--           empty_open = "",
--           symlink = "",
--           symlink_open = "",
--         },
--         git = {
--           unstaged = "✗",
--           staged = "✓",
--           unmerged = "",
--           renamed = "➜",
--           untracked = "★",
--           deleted = "",
--           ignored = "◌",
--         },
--       },
--     },
--     special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
--   },
--   hijack_directories = {
--     enable = true,
--     auto_open = false,
--   },
--   update_focused_file = {
--     enable = true,
--     update_cwd = false,
--     ignore_list = {},
--   },
--   system_open = {
--     cmd = "",
--     args = {},
--   },
--   diagnostics = {
--     enable = false,
--     show_on_dirs = false,
--     icons = {
--       hint = "",
--       info = "",
--       warning = "",
--       error = "",
--     },
--   },
--   filters = {
--     dotfiles = false,
--     custom = {},
--     exclude = {},
--   },
--   git = {
--     enable = true,
--     ignore = true,
--     timeout = 400,
--   },
--   actions = {
--     use_system_clipboard = true,
--     change_dir = {
--       enable = true,
--       global = false,
--       restrict_above_cwd = false,
--     },
--     open_file = {
--       quit_on_open = false,
--       resize_window = true,
--       window_picker = {
--         enable = true,
--         chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
--         exclude = {
--           filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
--           buftype = { "nofile", "terminal", "help" },
--         },
--       },
--     },
--   },
--   trash = {
--     cmd = "trash",
--     require_confirm = true,
--   },
--   live_filter = {
--     prefix = "[FILTER]: ",
--     always_show_folders = true,
--   },
--   log = {
--     enable = true,
--     truncate = false,
--     types = {
--       all = true,
--       config = false,
--       copy_paste = false,
--       diagnostics = false,
--       git = false,
--       profile = false,
--     },
--   },
-- }
--
