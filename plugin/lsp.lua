local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
    -- C
    "clangd",

    -- docker
    "dockerls",
    "docker_compose_language_service",

    -- go
    "gopls",
    "jqls",

    -- python
    "pyright",
    "ruff",

    -- lua
    "lua_ls",

    -- sql
    "sqls",

    -- html, css
    "html",
    "cssls",

    -- javascript, japascriptreact, typescript, typescriptreact
    "ts_ls",
    "biome",

    -- terraform
    "terraformls",

    -- json
    "jsonls",
    -- markdown
    "marksman",
    -- YAML
    "yamlls",
    -- TOML
    "taplo",
  },
  automatic_installation = true,
  automatic_enable = true,
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,

  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- `require('plenary')`のようなサードパーティライブラリのエラーを抑制
      },
    },
  },
  -- lspのフォーマット機能を無効化
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})

-- Python
lspconfig.ruff.setup({
  capabilities = capabilities,
})

lspconfig.pyright.setup({
  capabilities = capabilities,
})

-- C#
lspconfig.csharp_ls.setup({
  capabilities = capabilities,

  settings = {
    csharp_ls = {
      -- inlay hintを全体的に有効化
      inlayHints = {
        enabled = true,
      },
    },
  },
})

-- html, css
lspconfig.html.setup({ capabilities = capabilities })
lspconfig.cssls.setup({ capabilities = capabilities })
