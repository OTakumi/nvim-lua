return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "clangd",
        "cmake",
        "gopls",
        "vue_ls",
        "vtsls",
        "biome",
        "pylsp",
        "ruff",
        "dockerls",
        "cssls",
        "yamlls",
      },
      automatic_install = true,
      automatic_enable = {
        exclude = { "rust_analyzer" }
      },
    },
    config = function(_, opts)
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        root_markers = { ".git" },
      })
      require("mason-lspconfig").setup(opts)
    end,
  },
}
