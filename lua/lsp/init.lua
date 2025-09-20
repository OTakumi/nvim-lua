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

-- load
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

  -- dockerfile
  "docker-language-server",
})
