-----------------------------------------------------------
-- Dashboard configuration file
-----------------------------------------------------------

-- Plugin: alpha-nvim
-- url: https://github.com/goolord/alpha-nvim

-- For configuration examples see: https://github.com/goolord/alpha-nvim/discussions/16


local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')

local banner = {
"                                     ▓███████▓                                       ",
"                                 █▒             ▓█                                   ",
"                              ▒█                   █▒                                ",
"                             █                       █                               ",
"                           ▒▓                         █▒                             ",
"                           █                           █                             ",
"                          █▒                           ██                            ",
"                          █                            ░█                            ",
"                         ░█                            ░█▒                           ",
"                         ▒█    ████████     ████████░   █▒                           ",
"                       █  █      ░▒▒▓                   █▒▒█                         ",
"                      █           ██▒         ▓██▒      ▒  ▒▓                        ",
"                       █                               ░▒  █                         ",
"                       █   ▒          ▒     ░          █▒ ░█                         ",
"                       ░▓  ▓▒          █████          ███ ▓▓                         ",
"                        █▒▒▓▒▒      █████▓█████▒    ▒████▒██                         ",
"                           █▒▒▒░  ██▒         ▓██  █████    ██                       ",
"                          ▓█▓▒▒▒▒▒█▓           ▒████████     █                       ",
"                        ██▓▓█▓▒▒▒███    ███    ▓███████      █                       ",
"                       █▒▒▒▒▓██▒▒██████░███▒█████████▓      ▓██                      ",
"                       █▒▒▒▒▒▓█████████████████████▒      ▒█░  █                     ",
"                       ███▒▒▒▓█   ███████████████       ▒█░   █                      ",
"                      ██  ▒████     ░█████████        ░█▒    █                       ",
"                    ██▒█     ▒████▓▓▓▓▓███░          █▓    ░█▓██▒                    ",
"                   █▒ ░█▓      █    ▒█▒            ██    ▓██▒▒▒▒▒██▓                 ",
"                ███░    █▒      ██▓              ▓█   ▒██▒▒▒▒▒▒▒▒▒▒▒███              ",
"             ██▓  ███▒  ░█▒      █▓            ▓█  ░██▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██            ",
"           █░        ██▓  █▒      ▓█         ▒█  ██▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒             ",
"                       ▓██░█       ░█     ▒▓████▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒              ",
"                         ▒███       ░████▓▓▒██▒▒▒▒▒    ░░░░░▒▒▒▒▒▒▒▒▒                ",
"                           ▓██        ██▒▒▒██▓▒▒▒░   ▒▓▓▓▓▒      ▒▒░                 ",
"                             ██        ██▒██▒▒▒░   █████████▓   ▒░                   ",
"                              ▒█        ███▓▒▒      ▒██████▒                         ",
"                      ▒▒▒▒▒▒▒▒▒██       ▓█▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                        ",
"                                ▓█     ░██▓▒                                         ",
"                                 ▓█    ██▒▓░                                         ",
"                                      ▒█▒▓░                                          ",
}


dashboard.section.header.val = banner
dashboard.section.header.position = "right"

-- Footer
local function footer()
  local version = vim.version()
  local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
  local datetime = os.date('%Y/%m/%d %H:%M:%S')

  return print_version .. ' ' .. datetime .. '\n'
end

-- Menu
dashboard.section.buttons.val = {
  dashboard.button('a', '  New file', ':ene <BAR> startinsert<CR>'),
  dashboard.button("f", "  Find File   ", ":lua Snacks.picker.files({ hidden = true, follow = true})<CR>"),
  dashboard.button("t", "  Find Text   ", ":lua Snacks.picker.grep_buffesr()<CR>"),
  dashboard.button("r", "  > Recent"   , ":lua Snacks.picker.recent()<CR>"),
  dashboard.button('s', '  Settings', ':e $MYVIMRC<CR>'),
  dashboard.button('u', '  Update plugins', ':PackerUpdate<CR>'),
  dashboard.button('q', '  Quit', ':qa<CR>'),
  dashboard.button('i', '  Github issues', ':Octo issue list<CR>')
}

dashboard.section.footer.val = footer()
dashboard.config.opts.position = "right"

alpha.setup(dashboard.config)

