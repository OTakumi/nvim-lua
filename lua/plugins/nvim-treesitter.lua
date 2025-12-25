return {
  {
    "nvim-treesitter/nvim-treesitter",
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
        "javascriptreact",
        "typescriptreact",
        "vue",
        "json",
        "markdown",
        "markdown_inline",
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
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
      -- file_browser
      {
        "<space>fb",
        ":Telescope file_browser path=%:p:h select_buffer=true theme=dropdown<CR>",
        desc = "File Browser",
      },
    },
  },
  -- 現在のコードブロックのコンテキストを表示するプラグイン
  {
    "nvim-treesitter/nvim-treesitter-context",
    -- nvim-treesitterの後にロードされるように依存関係を明記
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {}, -- デフォルト設定で有効化
  },
}
