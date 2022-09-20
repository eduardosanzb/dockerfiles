-----------------------------------------------------------
-- Cursorline manager
-----------------------------------------------------------

-- Plugin: auto-cursorline
-- url: https://github.com/delphinus/auto-cursorline.nvim


local status_ok, authCursorline = pcall(require, 'auto-cursorline')
if not status_ok then
  return
end


authCursorline.setup{
   wait_ms = 0,
}
