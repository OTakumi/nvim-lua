require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "cpp",
        "lua",
        "vim",
        "diff",
        "python",
        "javascript",
        "typescript",
        "query",
        "markdown",
        "markdown_inline",
        "json",
        "rust",
    },
    indent = { enable = true },
})
