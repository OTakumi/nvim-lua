return {
  "nvim-mini/mini.icons",
  version = "*", -- Use stable version
  opts = {},
  lazy = false,
  config = function(_, opts)
    require("mini.icons").setup(opts)

    -- Mock nvim-web-devicons for compatibility with other plugins
    -- This allows plugins like lualine, dashboard, lspsaga to work seamlessly
    MiniIcons.mock_nvim_web_devicons()
  end,
}
