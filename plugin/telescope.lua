return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    -- change some options
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-ghq.nvim" },
        { "nvim-telescope/telescope-z.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                -- layout_strategy = "horizon",
                -- layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
            },
            extension = {
                file_browser = {
                    theme = "ivy",
                    hijack_netrw = true,
                    mappings = {
                        ["i"] = {},
                        ["n"] = {},
                    },
                },
            },
        })
        require("telescope").load_extension("file_browser")
        require("telescope").load_extension("fzf")
    end,
}
