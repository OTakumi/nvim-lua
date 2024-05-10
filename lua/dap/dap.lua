require("dap/csharp")
local dap, dapui = require("dap"), require("dapui")

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

require("mason-nvim-dap").setup({
    automatic_setup = true,
    ensure_installed = {
        "cppdbg",
        "coreclr",
        "codelldb",
        "lldb",
        "node2",
        "chrome",
    },
})

-- C#
-- For netcoredbg, download the released file from the following a link
---- https://github.com/Samsung/netcoredbg
-- and put DOTNET_DEBUGGER_LOCATION=/path/to/netcoredbg in csharp.lua.
dap.adapters.coreclr = {
    type = "executable",
    command = DOTNET_DEBUGGER_LOCATION .. "\\netcoredbg",
    args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input("Path to DLL > ", vim.fn.getcwd() .. "\\bin\\Debug", "file")
        end,
    },
}

-- Rust
dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode-14",
    name = "lldb",
}

dap.adapters.codellbd = {
    type = "server",
}

dap.configurations.rust = {
    {
        name = "Rust Debug",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEmtry = false,
        args = {},
    },
}

-- golang
dap.adapters.go = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
        stdio = { nil, stdout },
        args = { "dap", "-l", "127.0.0.1:" .. port },
        detached = true,
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
        stdout:close()
        handle:close()
        if code ~= 0 then
            print("dlv exited with code", code)
        end
    end)
    assert(handle, "Error running dlv: " .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
        assert(not err, err)
        if chunk then
            vim.schedule(function()
                require("dap.repl").append(chunk)
            end)
        end
    end)

    -- wait for delve to start
    vim.defer_fn(function()
        callback({ type = "server", host = "127.0.0.1", port = port })
    end, 100)
end

dap.configurations.go = {
    {
        type = "go",
        name = "Debug the golang",
        request = "launch",
        program = "${file}",
    },
}
