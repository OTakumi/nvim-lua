return {
  {
    "nvimdev/lspsaga.nvim",
    -- Load when LSP attaches to buffer
    event = "LspAttach",
    dependencies = {
      "nvim-mini/mini.icons",
    },
    opts = {
      border_style = "single",
      symbol_in_winbar = {
        enable = true,
      },
      lightbulb = {
        enable = true,
      },
      outline = {
        win_width = 50,
        auto_preview = false,
      },
    },
  },
}
