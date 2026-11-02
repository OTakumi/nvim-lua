return {
  {
    "mfussenegger/nvim-dap",
    cmd = {
      "DapContinue",
      "DapToggleBreakpoint",
      "DapStepOver",
      "DapStepInto",
      "DapStepOut",
      "DapSetBreakpoint",
      "DapUIClose",
      "DapUIToggle",
    },
    -- Keymaps live here (not in `config`) so they exist before the plugin
    -- is loaded; pressing one of them triggers the lazy load.
    keys = {
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "DAP: Continue",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "DAP: Step Over",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "DAP: Step Into",
      },
      {
        "<F12>",
        function()
          require("dap").step_out()
        end,
        desc = "DAP: Step Out",
      },
      {
        "<Leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "DAP: Toggle Breakpoint",
      },
      {
        "<Leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "DAP: Set Conditional Breakpoint",
      },
      {
        "<Leader>dl",
        function()
          require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end,
        desc = "DAP: Set Log Point",
      },
      {
        "<Leader>du",
        function()
          require("dapui").toggle()
        end,
        desc = "DAP-UI: Toggle",
      },
      {
        "<Leader>dr",
        function()
          require("dap").repl.open()
        end,
        desc = "DAP: Open REPL",
      },
    },
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        opts = {
          icons = { expanded = "▾", collapsed = "▸" },
          mappings = {
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
          },
          layouts = {
            {
              elements = { "scopes", "breakpoints", "stacks", "watches" },
              size = 40,
              position = "left",
            },
            {
              elements = { "repl" },
              size = 10,
              position = "bottom",
            },
          },
        },
      },
      -- Virtual text display for breakpoints and variables
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
      -- Manage debuggers via Mason
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "mfussenegger/nvim-dap" },
        opts = {
          -- ensure_installed = { "coreclr", "go" },
        },
      },
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      -- Open / close the UI together with the debug session
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
    end,
  },
}
