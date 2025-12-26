return {
  {
    "stevearc/conform.nvim",
    -- Load before file save to use format_on_save feature
    event = "BufWritePre",
    cmd = "ConformInfo",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- Execute formatting on file save
      format_on_save = {
        timeout_ms = 500,
      },
      -- Formatter configuration per filetype
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_organize_imports", "ruff_format" },
        rust = { "rustfmt" },
        typescript = { "biome" },
        typescriptreact = { "biome" },
        javascript = { "biome" },
        javascriptreact = { "biome" },
        vue = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
        cs = { "csharpier" },
        go = { "goimports", "gofumpt" },
        markdown = { "markdownlint" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- Detailed configuration for each formatter
      formatters = {
        stylua = {
          prepend_args = { "--indent-type=spaces", "--indent-width=2", "-" },
        },
        ruff_format = {
          prepend_args = { "format", "--line-length", "120", "--quiet", "-" },
        },
      },
    },
  },
}
