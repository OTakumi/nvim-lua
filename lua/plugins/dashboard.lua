return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = {
      -- config
      config = {
        week_header = {
          enable = true, --boolean use a week header
          -- concat = true, --concat string after time string line
          -- append = true, --table append after time string line
        },
      },
    },
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
