require("conform").setup({
  formatters_by_ft = {
    -- lua
    lua = { "stylua" },

    -- python
    python = { "ruff_organize_imports", "ruff_format" },

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
    ruff_format = {
      exe = "ruff",
      prepend_args = {
        "format",
        "--line-length",
        "120",
        "--quiet",
        "-",
      },
    },
  },
})
