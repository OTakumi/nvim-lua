return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-mini/mini.icons",
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
