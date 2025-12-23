return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
          "cmake",
          "csharp_ls",
          "gopls",
          "vue_ls",
          "vtsls",
          "biome",
          "pylsp",
          "ruff",
          "rust_analyzer",
          "dockerls",
          "cssls",
          "yamlls",
        },
      })
    end,
  },
}
