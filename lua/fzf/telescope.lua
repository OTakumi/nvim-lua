-- ---------- Settings ----------
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
            },
        },
    },
})

require("telescope").load_extension("fzf")

-- ---------- Keymaps ----------
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {})
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {})
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffer<cr>", {})
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {})
