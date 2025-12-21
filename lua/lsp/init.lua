-- This file configures and enables various Language Server Protocol (LSP) clients for Neovim.

-- Configure global LSP client capabilities and settings for all language servers.
vim.lsp.config("*", {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      },
    },
    require("cmp_nvim_lsp").default_capabilities(),
  },
  root_markers = { ".git" },
})

-- Enable specific language servers.
vim.lsp.enable({
  -- lua
  "lua_ls",

  -- python
  "ruff",
  "pylsp",

  -- go
  "gopls",

  -- c#
  "csharp_ls",

  -- c++
  "clangd",
  "neocmakelsp",

  -- dockerfile
  "docker-language-server",

  -- vue
  "vue_ls",
})
