require("conform").setup({
  formatters_by_ft = {
    -- lua
    lua = { "stylua" },

    -- python
    python = { "ruff_organize_imports", "ruff_format", "black", "isort" },

    -- rust
    rust = { "rustfmt", lsp_format = "fallback" },

    -- typescript
    typescript = { "biome" },
    typescriptreact = { "biome" },
    javascript = { "biome" },
    javascriptreact = { "biome" },
    json = { "biome" },
    jsonc = { "biome" },
    cs = { "csharpier" },

    -- go
    go = { "goimports", "gofumpt" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
    lsp_fallback = true,
  },
  formatters = {
    stylua = {
      exe = "stylua",
      prepend_args = {
        "--indent-type=spaces",
        "--indent-width=2",
        "-",
      },
    },
    black = {
      exe = "black",
      prepend_args = {
        "-l 120",
        "--quiet",
        "-",
      },
    },
  },
})
