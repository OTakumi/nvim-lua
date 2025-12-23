return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- 遅延ロードを無効化
    lazy = false,
    -- インストール・更新時にパーサーを自動更新します
    build = ":TSUpdate",
    opts = {
      -- インストールするパーサーのリスト
      ensure_installed = {
        "lua",
        "rust",
        "python",
        "go",
        "vim",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "markdown",
        "markdown_inline",
        "vue",
      },
      -- インデント機能を有効化
      indent = { enable = true },
      -- ハイライト機能を有効化
      highlight = {
        enable = true,
        -- ファイルサイズが大きい場合はハイライトを無効化
        disable = function(lang, buf)
          local max_filesize = 300 * 1024 -- 300 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        -- 追加のVim正規表現ハイライトは無効
        additional_vim_regex_highlighting = false,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
    end,
  },
  -- 現在のコードブロックのコンテキストを表示するプラグイン
  {
    "nvim-treesitter/nvim-treesitter-context",
    -- nvim-treesitterの後にロードされるように依存関係を明記
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {}, -- デフォルト設定で有効化
  },
}
