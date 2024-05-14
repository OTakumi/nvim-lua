-- ---------- Settings ----------
-- require("telescope").setup({
--     defaults = {
--         mappings = {
--             i = {
--                 ["<C-h>"] = "which_key",
--             },
--         },
--         winblend = 20,
--     },
-- })
--
-- require("telescope").load_extension("fzf")
--
-- local builtin = require("telescope.builtin")
--
-- vim.keymap.set("n", "<leader>ff", builtin.find_files)
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep)
-- vim.keymap.set("n", "<leader>fb", builtin.buffers)
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags)
--
return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-ghq.nvim" },
        { "nvim-telescope/telescope-z.nvim" },
        -- { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function()
        require("plugin.telescope")
    end,
}
