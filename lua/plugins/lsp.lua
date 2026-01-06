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
    },
  },
}
