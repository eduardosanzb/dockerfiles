local status_ok, dap = pcall(require, 'dap')
if not status_ok then
    return
end


require("dapui").setup()
local pathMasonChromeDebug = '/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js'

dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. pathMasonChromeDebug}
}

dap.configurations.typescript = { -- change to typescript if needed
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

