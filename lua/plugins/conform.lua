return {
  {
    "stevearc/conform.nvim",
    -- `format_on_save`機能を使うため、ファイルの保存前に読み込まれるように設定
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- ファイル保存時にフォーマットを実行
      format_on_save = {
        timeout_ms = 500,
      },
      -- ファイルタイプ毎のフォーマッター設定
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
      -- 各フォーマッターの詳細設定
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
