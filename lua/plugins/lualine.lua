return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "iceberg_dark",
        icons_enabled = true,
      },
    },
    event = "VimEnter",
  },
}
