-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/eduardosanchez/.cache/nvim/packer_hererocks/2.1.1748459687/share/lua/5.1/?.lua;/Users/eduardosanchez/.cache/nvim/packer_hererocks/2.1.1748459687/share/lua/5.1/?/init.lua;/Users/eduardosanchez/.cache/nvim/packer_hererocks/2.1.1748459687/lib/luarocks/rocks-5.1/?.lua;/Users/eduardosanchez/.cache/nvim/packer_hererocks/2.1.1748459687/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/eduardosanchez/.cache/nvim/packer_hererocks/2.1.1748459687/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["auto-cursorline.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/auto-cursorline.nvim",
    url = "https://github.com/delphinus/auto-cursorline.nvim"
  },
  ["auto-dark-mode.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/auto-dark-mode.nvim",
    url = "https://github.com/f-person/auto-dark-mode.nvim"
  },
  ["aw-watcher.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15aw_watcher\frequire\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/aw-watcher.nvim",
    url = "https://github.com/lowitea/aw-watcher.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-ai"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/cmp-ai",
    url = "https://github.com/tzachar/cmp-ai"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-git"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/cmp-git",
    url = "https://github.com/petertriho/cmp-git"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["codecompanion.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/codecompanion.nvim",
    url = "https://github.com/olimorris/codecompanion.nvim"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["csvview.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcsvview\frequire\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/csvview.nvim",
    url = "https://github.com/hat0uma/csvview.nvim"
  },
  ["deno-nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/deno-nvim",
    url = "https://github.com/sigmasd/deno-nvim"
  },
  ["diagram.nvim"] = {
    config = { "\27LJ\2\ní\3\0\0\a\0\17\1\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0004\3\3\0006\4\0\0'\6\3\0B\4\2\2>\4\1\0036\4\0\0'\6\4\0B\4\2\0?\4\0\0=\3\6\0025\3\b\0005\4\a\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\3=\3\16\2B\0\2\1K\0\1\0\21renderer_options\fgnuplot\1\0\2\ntheme\tdark\tsize\f800,600\ad2\1\0\1\rtheme_id\3\1\rplantuml\1\0\1\fcharset\nutf-8\fmermaid\1\0\4\rplantuml\0\fmermaid\0\ad2\0\fgnuplot\0\1\0\1\ntheme\vforest\17integrations\1\0\2\21renderer_options\0\17integrations\0\31diagram.integrations.neorg\"diagram.integrations.markdown\nsetup\fdiagram\frequire\5ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/diagram.nvim",
    url = "https://github.com/3rd/diagram.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["eslint.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/eslint.nvim",
    url = "https://github.com/MunifTanjim/eslint.nvim"
  },
  ["feline.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["fold-preview.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17fold-preview\frequire\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/fold-preview.nvim",
    url = "https://github.com/anuvyklack/fold-preview.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git_browse.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/git_browse.nvim",
    url = "https://github.com/Morozzzko/git_browse.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/glow.nvim",
    url = "https://github.com/ellisonleao/glow.nvim"
  },
  ["go.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/guihua.lua",
    url = "https://github.com/ray-x/guihua.lua"
  },
  ["hologram.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\17auto_display\2\nsetup\rhologram\frequire\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/hologram.nvim",
    url = "https://github.com/edluffy/hologram.nvim"
  },
  ["image.nvim"] = {
    config = { "\27LJ\2\ná\a\0\0\6\0\24\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0005\5\n\0=\5\6\4=\4\v\0035\4\f\0005\5\r\0=\5\6\4=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\25hijack_file_patterns\1\a\0\0\n*.png\n*.jpg\v*.jpeg\n*.gif\v*.webp\v*.avif#window_overlap_clear_ft_ignore\1\6\0\0\rcmp_menu\rcmp_docs\17snacks_notif\15scrollview\20scrollview_sign\17integrations\bcss\1\0\1\fenabled\1\thtml\1\0\1\fenabled\1\ntypst\1\2\0\0\ntypst\1\0\2\14filetypes\0\fenabled\2\nneorg\1\2\0\0\tnorg\1\0\2\14filetypes\0\fenabled\2\rmarkdown\1\0\5\bcss\0\thtml\0\ntypst\0\nneorg\0\rmarkdown\0\14filetypes\1\3\0\0\rmarkdown\fvimwiki\1\0\6 only_render_image_at_cursor\1\27download_remote_images\2\25clear_in_insert_mode\1\fenabled\2\14filetypes\0\22floating_wsindows\1\1\0\f max_width_window_percentage\0\fbackend\nkitty\25hijack_file_patterns\0$tmux_show_only_in_active_window\1$editor_only_render_when_focused\1\14max_width\0#window_overlap_clear_ft_ignore\0!window_overlap_clear_enabled\1!max_height_window_percentage\0032\17integrations\0\15max_height\0\14processor\15magick_cli\nsetup\nimage\frequire\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/image.nvim",
    url = "https://github.com/3rd/image.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["k8s.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\bk8s\frequire\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/k8s.nvim",
    url = "https://github.com/arjunmahishi/k8s.nvim"
  },
  ["keymap-amend.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/keymap-amend.nvim",
    url = "https://github.com/anuvyklack/keymap-amend.nvim"
  },
  ["lazy-stats"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/lazy-stats",
    url = "https://github.com/hville/lazy-stats"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["leap.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["llm.nvim"] = {
    config = { "\27LJ\2\n»\1\0\0\4\1\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0-\3\0\0=\3\4\2B\0\2\1K\0\1\0\2¿\22streaming_handler\1\0\4\nmodel!mlx-community/glm-4-32b-0414\rapi_type\vopenai\burl.http://127.0.0.1:1234/v1/chat/completions\22streaming_handler\0\nsetup\bllm\frequire\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/llm.nvim",
    url = "https://github.com/Kurama622/llm.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mcphub.nvim"] = {
    commands = { "MCPHub" },
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vmcphub\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/opt/mcphub.nvim",
    url = "https://github.com/ravitemer/mcphub.nvim"
  },
  ["mini.ai"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/mini.ai",
    url = "https://github.com/echasnovski/mini.ai"
  },
  ["mini.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["minuet-ai.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/minuet-ai.nvim",
    url = "https://github.com/milanglacier/minuet-ai.nvim"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  neogen = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogen\frequire\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/neogen",
    url = "https://github.com/danymat/neogen"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/catgoose/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fneoclip\frequire\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-surround"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\nè\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\16ssh_aliases\1\0\1\16ssh_aliases\0\1\0\2\21github.com-trawa\15github.com\15github.com\15github.com\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["prettier.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/prettier.nvim",
    url = "https://github.com/MunifTanjim/prettier.nvim"
  },
  ["render-markdown.nvim"] = {
    config = { "\27LJ\2\nƒ\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\15file_types\1\4\0\0\rmarkdown\18codecompanion\tocto\16completions\1\0\2\15file_types\0\16completions\0\blsp\1\0\1\blsp\0\1\0\1\fenabled\2\nsetup\20render-markdown\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/opt/render-markdown.nvim",
    url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"
  },
  ["shade.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/shade.nvim",
    url = "https://github.com/sunjon/shade.nvim"
  },
  ["snacks.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/snacks.nvim",
    url = "https://github.com/folke/snacks.nvim"
  },
  ["sqlite.lua"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/opt/sqlite.lua",
    url = "https://github.com/kkharji/sqlite.lua"
  },
  ["sqlite.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/sqlite.nvim",
    url = "https://github.com/3rd/sqlite.nvim"
  },
  tagbar = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/preservim/tagbar"
  },
  ["telescope-live-grep-args.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/telescope-live-grep-args.nvim",
    url = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["time-tracker.nvim"] = {
    config = { "\27LJ\2\nû\2\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0006\3\3\0009\3\4\0039\3\5\3'\5\6\0B\3\2\2'\4\a\0&\3\4\3=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\20tracking_events\1\6\0\0\rBufEnter\16BufWinEnter\16CursorMoved\17CursorMovedI\16WinScrolled\14data_file\1\0\3\20tracking_events\0\29tracking_timeout_seconds\3¨\2\14data_file\0\21/time-tracker.db\tdata\fstdpath\afn\bvim\nsetup\17time-tracker\frequire\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/time-tracker.nvim",
    url = "https://github.com/3rd/time-tracker.nvim"
  },
  ["typescript-tools.nvim"] = {
    config = { "\27LJ\2\nª\1\0\0\4\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\2B\0\2\1K\0\1\0\30tsserver_file_preferences\28tsserver_format_options\1\0\2\28tsserver_format_options\0\30tsserver_file_preferences\0\nsetup\21typescript-tools\frequire\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/typescript-tools.nvim",
    url = "https://github.com/pmizio/typescript-tools.nvim"
  },
  ["typescript.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  ["vi-mongo.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rvi-mongo\frequire\0" },
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/vi-mongo.nvim",
    url = "https://github.com/kopecmaciej/vi-mongo.nvim"
  },
  ["vim-colors-xcode"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/vim-colors-xcode",
    url = "https://github.com/arzg/vim-colors-xcode"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/eduardosanchez/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^sqlite"] = "sqlite.lua"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: image.nvim
time([[Config for image.nvim]], true)
try_loadstring("\27LJ\2\ná\a\0\0\6\0\24\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0005\5\n\0=\5\6\4=\4\v\0035\4\f\0005\5\r\0=\5\6\4=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\25hijack_file_patterns\1\a\0\0\n*.png\n*.jpg\v*.jpeg\n*.gif\v*.webp\v*.avif#window_overlap_clear_ft_ignore\1\6\0\0\rcmp_menu\rcmp_docs\17snacks_notif\15scrollview\20scrollview_sign\17integrations\bcss\1\0\1\fenabled\1\thtml\1\0\1\fenabled\1\ntypst\1\2\0\0\ntypst\1\0\2\14filetypes\0\fenabled\2\nneorg\1\2\0\0\tnorg\1\0\2\14filetypes\0\fenabled\2\rmarkdown\1\0\5\bcss\0\thtml\0\ntypst\0\nneorg\0\rmarkdown\0\14filetypes\1\3\0\0\rmarkdown\fvimwiki\1\0\6 only_render_image_at_cursor\1\27download_remote_images\2\25clear_in_insert_mode\1\fenabled\2\14filetypes\0\22floating_wsindows\1\1\0\f max_width_window_percentage\0\fbackend\nkitty\25hijack_file_patterns\0$tmux_show_only_in_active_window\1$editor_only_render_when_focused\1\14max_width\0#window_overlap_clear_ft_ignore\0!window_overlap_clear_enabled\1!max_height_window_percentage\0032\17integrations\0\15max_height\0\14processor\15magick_cli\nsetup\nimage\frequire\0", "config", "image.nvim")
time([[Config for image.nvim]], false)
-- Config for: csvview.nvim
time([[Config for csvview.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcsvview\frequire\0", "config", "csvview.nvim")
time([[Config for csvview.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: neogen
time([[Config for neogen]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogen\frequire\0", "config", "neogen")
time([[Config for neogen]], false)
-- Config for: time-tracker.nvim
time([[Config for time-tracker.nvim]], true)
try_loadstring("\27LJ\2\nû\2\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0006\3\3\0009\3\4\0039\3\5\3'\5\6\0B\3\2\2'\4\a\0&\3\4\3=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\20tracking_events\1\6\0\0\rBufEnter\16BufWinEnter\16CursorMoved\17CursorMovedI\16WinScrolled\14data_file\1\0\3\20tracking_events\0\29tracking_timeout_seconds\3¨\2\14data_file\0\21/time-tracker.db\tdata\fstdpath\afn\bvim\nsetup\17time-tracker\frequire\0", "config", "time-tracker.nvim")
time([[Config for time-tracker.nvim]], false)
-- Config for: aw-watcher.nvim
time([[Config for aw-watcher.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15aw_watcher\frequire\0", "config", "aw-watcher.nvim")
time([[Config for aw-watcher.nvim]], false)
-- Config for: diagram.nvim
time([[Config for diagram.nvim]], true)
try_loadstring("\27LJ\2\ní\3\0\0\a\0\17\1\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0004\3\3\0006\4\0\0'\6\3\0B\4\2\2>\4\1\0036\4\0\0'\6\4\0B\4\2\0?\4\0\0=\3\6\0025\3\b\0005\4\a\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\3=\3\16\2B\0\2\1K\0\1\0\21renderer_options\fgnuplot\1\0\2\ntheme\tdark\tsize\f800,600\ad2\1\0\1\rtheme_id\3\1\rplantuml\1\0\1\fcharset\nutf-8\fmermaid\1\0\4\rplantuml\0\fmermaid\0\ad2\0\fgnuplot\0\1\0\1\ntheme\vforest\17integrations\1\0\2\21renderer_options\0\17integrations\0\31diagram.integrations.neorg\"diagram.integrations.markdown\nsetup\fdiagram\frequire\5ÄÄ¿ô\4\0", "config", "diagram.nvim")
time([[Config for diagram.nvim]], false)
-- Config for: typescript-tools.nvim
time([[Config for typescript-tools.nvim]], true)
try_loadstring("\27LJ\2\nª\1\0\0\4\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\2B\0\2\1K\0\1\0\30tsserver_file_preferences\28tsserver_format_options\1\0\2\28tsserver_format_options\0\30tsserver_file_preferences\0\nsetup\21typescript-tools\frequire\0", "config", "typescript-tools.nvim")
time([[Config for typescript-tools.nvim]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fneoclip\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: hologram.nvim
time([[Config for hologram.nvim]], true)
try_loadstring("\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\17auto_display\2\nsetup\rhologram\frequire\0", "config", "hologram.nvim")
time([[Config for hologram.nvim]], false)
-- Config for: vi-mongo.nvim
time([[Config for vi-mongo.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rvi-mongo\frequire\0", "config", "vi-mongo.nvim")
time([[Config for vi-mongo.nvim]], false)
-- Config for: fold-preview.nvim
time([[Config for fold-preview.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17fold-preview\frequire\0", "config", "fold-preview.nvim")
time([[Config for fold-preview.nvim]], false)
-- Config for: llm.nvim
time([[Config for llm.nvim]], true)
try_loadstring("\27LJ\2\n»\1\0\0\4\1\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0-\3\0\0=\3\4\2B\0\2\1K\0\1\0\2¿\22streaming_handler\1\0\4\nmodel!mlx-community/glm-4-32b-0414\rapi_type\vopenai\burl.http://127.0.0.1:1234/v1/chat/completions\22streaming_handler\0\nsetup\bllm\frequire\0", "config", "llm.nvim")
time([[Config for llm.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: k8s.nvim
time([[Config for k8s.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\bk8s\frequire\0", "config", "k8s.nvim")
time([[Config for k8s.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\2\nè\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\16ssh_aliases\1\0\1\16ssh_aliases\0\1\0\2\21github.com-trawa\15github.com\15github.com\15github.com\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd render-markdown.nvim ]]

-- Config for: render-markdown.nvim
try_loadstring("\27LJ\2\nƒ\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\15file_types\1\4\0\0\rmarkdown\18codecompanion\tocto\16completions\1\0\2\15file_types\0\16completions\0\blsp\1\0\1\blsp\0\1\0\1\fenabled\2\nsetup\20render-markdown\frequire\0", "config", "render-markdown.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'MCPHub', function(cmdargs)
          require('packer.load')({'mcphub.nvim'}, { cmd = 'MCPHub', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'mcphub.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MCPHub ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
