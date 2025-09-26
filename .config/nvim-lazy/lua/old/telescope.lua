return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  config = function()
    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
      return
    end

    local telescopeConfig = require("telescope.config")
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    -- I want to search in hidden/dot files.
    table.insert(vimgrep_arguments, "--hidden")
    -- I don't want to search in the `.git` directory.
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    telescope.load_extension("live_grep_args")

    telescope.setup {
      defaults = {
        vimgrep_arguments = vimgrep_arguments,
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
      },
      pickers = {
        find_files = {
          theme = "ivy",
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        git_files = {
          theme = "ivy"
        },
        live_grep = {
          theme = "ivy",
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        grep_string = {
          theme = "ivy",
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      },
      extensions = {
        live_grep_args = {
          theme = "ivy",
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      },
    }
  end,
}