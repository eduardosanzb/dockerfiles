-----------------------------------------------------------
-- Shade.nvim configuration file
----------------------------------------------------------

-- Plugin: shade.nvim
-- url: https://github.com/sunjon/Shade.nvim

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
