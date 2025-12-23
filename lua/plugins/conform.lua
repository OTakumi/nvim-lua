return {
  {
    "stevearc/conform.nvim",
    -- `format_on_save`機能を使うため、ファイルの保存前に読み込まれるように設定します。
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    -- フォーマッターをmason.nvimで管理しているため、依存関係を明記します。
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- ファイル保存時にフォーマットを実行します
      format_on_save = {
        timeout_ms = 500,
        -- 設定されたフォーマッターが無い場合、LSPをフォールバックとして使用します
        lsp_format = "fallback",
      },
      -- ファイルタイプ毎のフォーマッター設定
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_organize_imports", "ruff_format" },
        rust = { "rustfmt", lsp_format = "fallback" },
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
