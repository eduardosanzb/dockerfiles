-----------------------------------------------------------
-- telescope configuration
-----------------------------------------------------------

-- Plugin: telescope
-- url: https://github.com/nvim-telescope/telescope.nvim#customization


local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.load_extension("live_grep_args")
telescope.load_extension("dap")

telescope.setup {
  pickers = {
    find_files = {
      theme = "ivy"
    },
    git_files = {
      theme = "ivy"
    },
    live_grep = {
      theme = "ivy"
    },
    grep_string = {
      theme = "ivy"
    },
  },
  extensions = {
    live_grep_args = {
      theme = "ivy"
    },
  },

}
