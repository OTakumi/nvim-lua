return {
  {
    "nvimdev/lspsaga.nvim",
    -- LSPがバッファにアタッチされたタイミングで読み込むようにします
    event = "LspAttach",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- アイコン表示に必要
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