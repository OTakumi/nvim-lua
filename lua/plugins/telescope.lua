return {
  {
    "nvim-telescope/telescope.nvim",
    -- `tag`指定を外して最新の安定版を追跡します
    cmd = "Telescope", -- Telescopeコマンドで遅延読み込み
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ghq.nvim",
      "nvim-telescope/telescope-z.nvim",
      -- `run`の代わりに`build`を使用
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- file_browser拡張機能は別のプラグインなので依存関係に追加
      "nvim-telescope/telescope-file-browser.nvim",
    },
    -- 静的な設定は`opts`にまとめる
    opts = {
      defaults = {
        sorting_strategy = "ascending",
        winblend = 0,
      },
      extensions = {
        file_browser = {
          theme = "ivy",
          hijack_netrw = true,
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      -- 拡張機能の読み込み
      telescope.load_extension("fzf")
      telescope.load_extension("ghq")
      telescope.load_extension("z")
      telescope.load_extension("file_browser")

      -- 一般的なキーマップを追加
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Find Files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: Live Grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope: Find Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Help Tags" })
      vim.keymap.set("n", "<leader>fz", "<cmd>Telescope z<cr>", { desc = "Telescope: Z" })
      vim.keymap.set("n", "<leader>fq", "<cmd>Telescope ghq<cr>", { desc = "Telescope: GHQ" })
    end,
  },
}