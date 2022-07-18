-----------------------------------------------------------
-- Nvim-sourround configuration file
----------------------------------------------------------

-- Plugin: nvim-surround
-- url: https://github.com/kylechui/nvim-surround

local status_ok, surround = pcall(require, 'nvim-surround')
if not status_ok then
    return
end

surround.setup()

