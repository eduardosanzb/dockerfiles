return {
  "sunjon/shade.nvim",
  config = function()
    local status_ok, shade = pcall(require, 'shade')
    if not status_ok then
        return
    end

    shade.setup({
        overlay_opacity = 50,
        opacity_ste = 1,
        keys = {
            brightness_down = '<F5>',
            brightness_up = '<F6>',
            toggle = '<leader>s'
        }
    })
  end,
}