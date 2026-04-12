return {
  -- Git
  {
    "tpope/vim-fugitive",
    lazy = true,
    event = "BufReadPost",
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "BufReadPost",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      current_line_blame = false,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- ハンクのナビゲーション
        map("n", "]h", gs.next_hunk, "Next hunk")
        map("n", "[h", gs.prev_hunk, "Prev hunk")
        -- ハンクのステージ/リセット
        map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
        -- 差分プレビュー
        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
        -- blame
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "Blame line")
        map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")
        -- diffと比較
        map("n", "<leader>hd", gs.diffthis, "Diff this")
      end,
    },
  },
}
