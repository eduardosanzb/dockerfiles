-----------------------------------------------------------
-- Treesitter-context configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter-context
-- url: https://github.com/nvim-treesitter/nvim-treesitter-context

local status_ok, treesitterContext = pcall(require, 'treesitter-context')
if not status_ok then
  return
end

treesitterContext.setup {
    enable = true,
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            "class",
            "function",
            "method",
            "for",
            "while",
            "if",
            "switch",
            "case",
        },
		 typescript = {
			"class_declaration",
			"abstract_class_declaration",
			"else_clause",
			"function",
		},
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    },

    -- [!] The options below are exposed but shouldn't require your attention,
    --     you can safely ignore them.

    zindex = 20, -- The Z-index of the context window
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  }
