return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 500,
    icons = {
      separator = "→",
    },
    spec = {
      -- Telescope (file finding)
      { "<leader>f", group = "Find" },
      { "<leader>ff", desc = "Find Files" },
      { "<leader>fg", desc = "Live Grep" },
      { "<leader>fb", desc = "Find Buffers" },
      { "<leader>fh", desc = "Help Tags" },
      { "<leader>fz", desc = "Z (frecency)" },
      { "<leader>fq", desc = "GHQ" },

      -- DAP (debugging)
      { "<leader>d", group = "Debug" },
      { "<leader>db", desc = "Toggle Breakpoint" },
      { "<leader>dB", desc = "Conditional Breakpoint" },
      { "<leader>dl", desc = "Log Point" },
      { "<leader>du", desc = "Toggle DAP UI" },
      { "<leader>dr", desc = "Open REPL" },

      -- LSP Workspace
      { "<leader>w", group = "LSP Workspace" },
      { "<leader>wa", desc = "Add Workspace Folder" },
      { "<leader>wr", desc = "Remove Workspace Folder" },
      { "<leader>wl", desc = "List Workspace Folders" },

      -- LSP & Git
      { "<leader>c", desc = "Clear Search Highlights" },
      { "<leader>k", desc = "LSP Signature Help" },
      { "<leader>a", desc = "Rust Code Action" },
      { "<leader>lg", desc = "LazyGit" },

      -- LSP goto commands
      { "g", group = "Go to" },
      { "gd", desc = "LSP Definition" },
      { "gD", desc = "LSP Declaration" },
      { "gi", desc = "LSP Implementation" },
      { "gt", desc = "LSP Type Definition" },
      { "gr", desc = "LSP References" },
      { "gf", desc = "LSP Format" },
      { "gn", desc = "LSP Rename" },
      { "ga", desc = "LSP Code Action" },
      { "ge", desc = "LSP Diagnostics" },
      { "g]", desc = "Next Diagnostic" },
      { "g[", desc = "Previous Diagnostic" },

      -- Terminal
      { "t", group = "Terminal" },
      { "tt", desc = "Open Terminal" },

      -- Window navigation
      { "<C-h>", desc = "Window Left", hidden = true },
      { "<C-j>", desc = "Window Down", hidden = true },
      { "<C-k>", desc = "Window Up", hidden = true },
      { "<C-l>", desc = "Window Right", hidden = true },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
