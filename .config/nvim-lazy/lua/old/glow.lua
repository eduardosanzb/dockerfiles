return {
  "ellisonleao/glow.nvim",
  config = function()
    local status,glow = pcall(require, 'glow')

    if not status then
      return
    end

    glow.setup({
      pager = false,
      width = 240,
    })
  end,
}