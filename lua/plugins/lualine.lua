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
      sections = {
        lualine_c = { { "filename", path = 1 } }
      },
    },
    event = "VimEnter",
  },
}
