return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      {
        "hrsh7th/cmp-nvim-lsp",
        event = { "BufReadPre", "BufNewFile" },
        keys = {
          { "K", vim.lsp.buf.hover, desc = "LSP: Hover" },
          { "gf", vim.lsp.buf.format, desc = "LSP: Format" },
          { "gr", vim.lsp.buf.references, desc = "LSP: References" },
          { "gd", vim.lsp.buf.definition, desc = "LSP: Definition" },
          { "gD", vim.lsp.buf.declaration, desc = "LSP: Declaration" },
          { "gi", vim.lsp.buf.implementation, desc = "LSP: Implementation" },
          { "gt", vim.lsp.buf.type_definition, desc = "LSP: Type Definition" },
          { "gn", vim.lsp.buf.rename, desc = "LSP: Rename" },
          { "ga", vim.lsp.buf.code_action, desc = "LSP: Code Action" },
          { "ge", vim.diagnostic.open_float, desc = "LSP: Show Diagnostics" },
          { "g]", vim.diagnostic.goto_next, desc = "LSP: Next Diagnostic" },
          { "g[", vim.diagnostic.goto_prev, desc = "LSP: Prev Diagnostic" },
          { "<C-k>", vim.lsp.buf.signature_help, desc = "LSP: Signature Help" },
          { "<space>wa", vim.lsp.buf.add_workspace_folder, desc = "LSP: Add Workspace Folder" },
          { "<space>wr", vim.lsp.buf.remove_workspace_folder, desc = "LSP: Remove Workspace Folder" },
          {
            "<space>wl",
            function()
              print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            desc = "LSP: List Workspace Folders",
          },
        },
      },
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
