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

dapui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
    },
    sidebar = {
        open_on_start = true,
        elements = {
            -- You can change the order of elements in the sidebar
            "scopes",
            "breakpoints",
            "stacks",
            "watches",
        },
        width = 40,
        position = "left", -- Can be "left" or "right"
    },
    tray = {
        open_on_start = true,
        elements = { "repl" },
        height = 10,
        position = "bottom", -- Can be "bottom" or "top"
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
    },
    windows = { indent = 1 },
})

require("nvim-dap-virtual-text").setup()

-- ==== keymaps.lua ==== --
-- nvim-dap keymaps
vim.keymap.set("n", "<F5>", '<cmd>lua require"dap".continue()<CR>')
vim.keymap.set("n", "<F10>", '<cmd>lua require"dap".step_over()<CR>')
vim.keymap.set("n", "<F11>", '<cmd>lua require"dap".step_into()<CR>')
vim.keymap.set("n", "<F12>", '<cmd>lua require"dap".step_out()<CR>')
vim.keymap.set("n", "<Leader>db", '<cmd>lua require"dap".toggle_breakpoint()<CR>')
vim.keymap.set("n", "<Leader>dB", '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
vim.keymap.set(
    "n",
    "<Leader>dl",
    '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>'
)

-- dap-ui keymaps
vim.keymap.set("n", "<Leader>du", '<cmd>lua require"dapui".toggle()<CR>')
vim.keymap.set("n", "<Leader>dr", '<cmd>lua require"dap".repl.open()<CR>')
