-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

-- Plugin: nvim-lspconfig
-- url: https://github.com/neovim/nvim-lspconfig

-- For configuration see the Wiki: https://github.com/neovim/nvim-lspconfig/wiki
-- Autocompletion settings of "nvim-cmp" are defined in plugins/nvim-cmp.lua

local lsp_status_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_status_ok then
  return
end

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then
  return
end

-- Diagnostic options, see: `:help vim.diagnostic.config`
vim.diagnostic.config({ virtual_text = true })

-- Show line diagnostics automatically in hover window
vim.cmd([[
  autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
]])

-- Add additional capabilities supported by nvim-cmp
-- See: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}


local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  -- Highlighting references
  -- if client.resolved_capabilities.document_highlight then
  --   vim.api.nvim_exec(
  --     [[
  --     augroup lsp_document_highlight
  --       autocmd! * <buffer>
  --       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --     augroup END
  --   ]] ,
  --     false
  --   )
  -- end

  --[[ Avoid clashes between deno & tsserver ]]
  local active_clients = vim.lsp.get_active_clients()
  if client.name == 'denols' then
    for _, client_ in pairs(active_clients) do
      -- stop tsserver if denols is already active
      if client_.name == 'tsserver' then
        client_.stop()
      end
    end
  elseif client.name == 'tsserver' then
    for _, client_ in pairs(active_clients) do
      -- prevent tsserver from starting if denols is already active
      if client_.name == 'denols' then
        client.stop()
      end
    end
  end
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local bufopts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", bufopts)
  vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", bufopts)
  vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>", bufopts)
  vim.keymap.set("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", bufopts)
  vim.keymap.set("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", bufopts)
  vim.keymap.set("n", "<space>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", bufopts)
  vim.keymap.set("n", "<space>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>", bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>de", ":lua vim.lsp.buf.type_definition()<CR>", bufopts)
  vim.keymap.set("n", "<space>rn", ":lua vim.lsp.buf.rename()<CR>", bufopts)
  vim.keymap.set("n", "<space>ca", ":lua vim.lsp.buf.code_action()<CR>", bufopts)
  vim.keymap.set("n", "gr", ":lua vim.lsp.buf.references()<CR>", bufopts)
  vim.keymap.set("n", "[d", ":lua vim.lsp.diagnostic.goto_prev()<CR>", bufopts)
  vim.keymap.set("n", "]d", ":lua vim.lsp.diagnostic.goto_next()<CR>", bufopts)
  vim.keymap.set("n", "<space>q", ":lua vim.lsp.diagnostic.set_loclist()<CR>", bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

end


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches.
-- Add your language server below:
local servers = {
  "bashls",
  "pyright",
  "clangd",
  "html",
  "cssls",
  "gopls",
  "graphql",
  "denols",
  "jsonls",
  "eslint",
  "terraformls",
  -- "ltex"

}

-- Call setup
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  })
end


vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("package.json"),
  flags = {
    debounce_text_changes = 150,
  },
}

lspconfig.denols.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  flags = {
    debounce_text_changes = 150,
  },
})


local null_ls = require("null-ls")
local eslint = require("eslint")
local prettier = require("prettier")

null_ls.setup()
--
-- prettier.setup({
--   bin = 'prettierd', -- or `'prettierd'` (v0.22+)
--   filetypes = {
--     "css",
--     "graphql",
--     "html",
--     "javascript",
--     "javascriptreact",
--     "json",
--     "less",
--     "markdown",
--     "scss",
--     "typescript",
--     "typescriptreact",
--     "yaml",
--     "eslint"
--   },
-- })

-- eslint.setup({
--   bin = 'eslint_d', -- or `eslint_d`
--   code_actions = {
--     enable = true,
--     apply_on_save = {
--       enable = true,
--       types = { "directive", "problem", "suggestion", "layout" },
--     },
--     disable_rule_comment = {
--       enable = true,
--       location = "separate_line", -- or `same_line`
--     },
--   },
--   diagnostics = {
--     enable = true,
--     report_unused_disable_directives = false,
--     run_on = "type", -- or `save`
--   },
-- })


-- TODO: I do not think i need this anymore, check later
-- require("deno-nvim").setup({
--   server = {
--     on_attach = on_attach,
--   },
-- })
