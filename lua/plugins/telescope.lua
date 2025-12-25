return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ghq.nvim",
      "nvim-telescope/telescope-z.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    opts = {
      pickers = {
        themes = "get_dropdown",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      telescope.load_extension("fzf")
      telescope.load_extension("ghq")
      telescope.load_extension("z")
      telescope.load_extension("file_browser")

      -- keymaps
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Find Files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: Live Grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope: Find Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Help Tags" })
      vim.keymap.set("n", "<leader>fz", "<cmd>Telescope z<cr>", { desc = "Telescope: Z" })
      vim.keymap.set("n", "<leader>fq", "<cmd>Telescope ghq<cr>", { desc = "Telescope: GHQ" })
      vim.keymap.set(
        "n",
        "<space>fb",
        ":Telescope file_browser path=%:p:h select_buffer=true theme=dropdown<CR>",
        { desc = "Telescope: File Browser" }
      )
    end,
  },
}
