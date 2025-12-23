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
  },
}
