return {
  "delphinus/auto-cursorline.nvim",

  config = function()
    local status_ok, authCursorline = pcall(require, 'auto-cursorline')
    if not status_ok then
      return
    end

    authCursorline.setup{
       wait_ms = 0,
     }
  end,
}
