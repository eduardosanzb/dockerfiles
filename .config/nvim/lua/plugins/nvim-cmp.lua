-----------------------------------------------------------
-- Autocomplete configuration file
-----------------------------------------------------------

-- Plugin: nvim-cmp
-- url: https://github.com/hrsh7th/nvim-cmp


local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_status_ok then
  return
end

-- Formatting the box
-- https://github.com/onsails/lspkind.nvim
local lspkind = require('lspkind')


vim.g['copilot_no_tab_map'] = true
vim.g['copilot_assume_mapped'] = true


local function get_current_date()
  local day_name = os.date("%A")
  return day_name .. " " .. os.date("%Y-%m-%d")
end

local function get_tomorrow_date()
  local current_time = os.time()
  local tomorrow_time = os.time { year = os.date("*t", current_time).year, month = os.date("*t", current_time).month, day = os.date("*t", current_time).day + 1 }
  local tomorrow_day_name = os.date("%A", tomorrow_time)
  return tomorrow_day_name .. " " .. os.date("%Y-%m-%d", tomorrow_time)
end


local function get_week_number_and_dates()
  local current_time = os.time()
  local week_number = os.date("%U", current_time) + 1 -- %U returns week number starting from 0
  local weekday = os.date("%w", current_time)         -- %w returns day of the week (0 = Sunday, 1 = Monday, ..., 6 = Saturday)

  -- Calculate the difference to get to the next Monday
  local days_until_monday = (8 - tonumber(weekday)) % 7
  if days_until_monday == 0 then days_until_monday = 7 end -- If today is Monday, we need to go to the next week's Monday

  local monday_time = os.time { year = os.date("*t", current_time).year, month = os.date("*t", current_time).month, day = os.date("*t", current_time).day + days_until_monday }
  local dates = {}

  for i = 0, 4 do
    local date = os.date("%Y-%m-%d", monday_time + i * 24 * 60 * 60)
    table.insert(dates, date)
  end

  return string.format("Week %d: %s", week_number, table.concat(dates, ", "))
end

local function get_next_day_of_the_week(day_name)
    -- Map English day names to their numeric representations
    local day_map = {
        ["sunday"]   = 0,
        ["monday"]   = 1,
        ["tuesday"]  = 2,
        ["wednesday"]= 3,
        ["thursday"] = 4,
        ["friday"]   = 5,
        ["saturday"] = 6
    }

    -- Get the numeric representation of the target day
    local target_day_num = day_map[day_name]

    if not target_day_num then
        return "Invalid day name"
    end

    -- Get the current day as a string (e.g., "1" for Monday)
    local current_day_str = os.date("%w")
    -- Convert to number
    local current_day_num = tonumber(current_day_str)

    -- Calculate days until the next occurrence of the target day
    local days_to_add = (target_day_num - current_day_num + 7) % 7

    -- If today is the same day, add one week
    if days_to_add == 0 then
        days_to_add = 7
    end

    -- Calculate the timestamp for the next day
    local now = os.time()
    local next_day_time = now + days_to_add * 86400 -- 86400 = seconds in a day

    -- Format and return the date
    return os.date("%Y-%m-%d", next_day_time)
end



local ls = luasnip
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node


luasnip.add_snippets("all", {
  s("@today", {
    t("## "),
    f(get_current_date),
  })
})
luasnip.add_snippets("all", {
  s("@tomorrow", {
    t("## "),
    f(get_tomorrow_date),
  })
})
luasnip.add_snippets("all", {
  s("@week", {
    t("## "),
    f(get_week_number_and_dates),
  })
})

-- Create a list of all the week days
local weeks_days = { "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday" }

-- Create snippets dynamically
local snippets = {}

for _, day in ipairs(weeks_days) do
  table.insert(snippets, s("@" .. day, {
    t("## "),
    f(function()
      return day .. " " .. get_next_day_of_the_week(day)
    end),
  }))
end
-- Add all snippets to luasnip
luasnip.add_snippets("all", snippets)


cmp.setup {
  -- Load snippet support
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  -- Completion settings
  completion = {
    --completeopt = 'menu,menuone,noselect'
    keyword_length = 2
  },

  -- Key mapping
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
     ["<A-y>"] = require('minuet').make_cmp_map(),

    -- Tab mapping
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.b._copilot_suggestion ~= nil then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true, true, true), '')
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end
  },

  formatting = {
    format = lspkind.cmp_format {
      mode = "symbol_text",
      menu = {
        nvim_lsp = "[LSP]",
        ultisnips = "[US]",
        path = "[Path]",
        buffer = "[Buffer]",
        emoji = "[Emoji]",
        omni = "[Omni]",
      },
      show_labelDetails = true,
      maxwidth = 40,
      ellipsis_char = "...",
    },
  },

  sources = {
    per_filetype = {
      codecompanion = { "codecompanion" }
    },
    -- { name = 'minuet' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'render-markdown' },
    { name = 'emoji' },
    { name = "git" },
    { name = 'nvim_lsp' },
    { name = 'minuet' },
    -- { name = 'cmp_ai' }

  },

  performance = {
    fetching_timeout = 2000
  },

}
require("cmp_git").setup()

-- local cmp_ai = require('cmp_ai.config')
--
-- cmp_ai:setup({
--   max_lines = 1000,
--   provider = 'Ollama',
--   notify = true,
--   notify_callback = function(msg)
--     vim.notify(msg)
--   end,
--   provider_options = {
--     model = 'mlx-community/glm-4-32b-0414',
--     auto_unload = false, -- Set to true to automatically unload the model when
--                         -- exiting nvim.
--   },
--   run_on_every_keystroke = true,
--   ignored_file_types = {
--     -- default is not to ignore
--     -- uncomment to ignore in lua:
--     -- lua = true
--   },
-- })
