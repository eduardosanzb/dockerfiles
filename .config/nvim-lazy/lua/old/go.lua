return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
  },
  config = function()
    local status, go = pcall(require, 'go')

    if not status then
      return
    end

    go.setup({})
  end,
}