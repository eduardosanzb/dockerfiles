-- local status_ok, dap = pcall(require, 'dap')
-- if not status_ok then
--     return
-- end
--
--
-- local pathMasonChromeDebug = '/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js'
--
-- dap.adapters.chrome = {
--     type = "executable",
--     command = "node",
--     args = {os.getenv("HOME") .. pathMasonChromeDebug}
-- }
--
-- dap.configurations.typescript = { -- change to typescript if needed
--     {
--         type = "chrome",
--         request = "attach",
--         program = "${file}",
--         cwd = vim.fn.getcwd(),
--         sourceMaps = true,
--         protocol = "inspector",
--         port = 9222,
--         webRoot = "${workspaceFolder}"
--     }
-- }
--
-- require("neodev").setup({
--   library = { plugins = { "nvim-dap-ui" }, types = true },
-- })

local dap, dapui = require("dap"), require("dapui")
local utils = require("dap.utils")

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

dap.adapters = {
  ["pwa-node"] = {
    type = "server",
    port = "${port}",
    executable = "js-debug-adapter",
    args = {
      "${port}",
    }
  }
}
dap.configurations["typescript"] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to process ID",
          processId = utils.pick_process,
          cwd = "${workspaceFolder}",
        },
}
-- require('dap-go').setup {
--   -- Additional dap configurations can be added.
--   -- dap_configurations accepts a list of tables where each entry
--   -- represents a dap configuration. For more details do:
--   -- :help dap-configuration
--   dap_configurations = {
--     {
--       -- Must be "go" or it will be ignored by the plugin
--       name = "Attach remote auht ext",
--       type = "go",
--       request = "attach",
--       mode = "remote",
--       port = 2345,
--       host = "127.0.0.1",
--       showLog = true,
--       apiVersion = 2,
--       trace = "verbose",
--       connect = {
--         host = "127.0.0.1",
--         port = 2345,
--       },
--
--       substitutePath = {
--         {
--           from = "${workspaceFolder}/filters/authorization",
--           to = "/app",
--         }
--       }
--     },
--   },
--
--   delve = {
--     port = "2345"
--   }
-- }

