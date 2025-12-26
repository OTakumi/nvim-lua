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
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function()
          local dapui = require("dapui")
          dapui.setup({
            icons = { expanded = "▾", collapsed = "▸" },
            mappings = {
              expand = { "<CR>", "<2-LeftMouse>" },
              open = "o",
              remove = "d",
              edit = "e",
            },
            sidebar = {
              open_on_start = true,
              elements = { "scopes", "breakpoints", "stacks", "watches" },
              width = 40,
              position = "left",
            },
            tray = {
              open_on_start = false,
              elements = { "repl" },
              height = 10,
              position = "bottom",
            },
          })
        end,
      },
      -- Virtual text display for breakpoints and variables
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {}, -- Enable with default settings
      },
      -- Manage debuggers via Mason
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "mfussenegger/nvim-dap" },
        -- Specify debuggers to install here
        opts = {
          -- ensure_installed = { "coreclr", "go" },
        },
      },
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      -- Integration settings with nvim-dap-ui
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

      -- Keymap settings
      vim.keymap.set("n", "<F5>", function()
        require("dap").continue()
      end, { desc = "DAP: Continue" })
      vim.keymap.set("n", "<F10>", function()
        require("dap").step_over()
      end, { desc = "DAP: Step Over" })
      vim.keymap.set("n", "<F11>", function()
        require("dap").step_into()
      end, { desc = "DAP: Step Into" })
      vim.keymap.set("n", "<F12>", function()
        require("dap").step_out()
      end, { desc = "DAP: Step Out" })
      vim.keymap.set("n", "<Leader>db", function()
        require("dap").toggle_breakpoint()
      end, { desc = "DAP: Toggle Breakpoint" })
      vim.keymap.set("n", "<Leader>dB", function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "DAP: Set Conditional Breakpoint" })
      vim.keymap.set("n", "<Leader>dl", function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end, { desc = "DAP: Set Log Point" })
      vim.keymap.set("n", "<Leader>du", function()
        require("dapui").toggle()
      end, { desc = "DAP-UI: Toggle" })
      vim.keymap.set("n", "<Leader>dr", function()
        require("dap").repl.open()
      end, { desc = "DAP: Open REPL" })
    end,
  },
}
