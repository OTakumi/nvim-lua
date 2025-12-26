return {
  {
    "nvimdev/lspsaga.nvim",
    -- Load when LSP attaches to buffer
    event = "LspAttach",
    dependencies = {
      "nvim-mini/mini.icons",
    },
    opts = {
      -- 元の設定から不要なネストを削除
      border_style = "single",
      symbol_in_winbar = {
        enable = true,
      },
      code_action_lightbulb = {
        enable = true,
      },
      show_outline = {
        win_width = 50,
        auto_preview = false,
      },
    },
  },
}

