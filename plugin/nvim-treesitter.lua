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
        "tsx",
        "html",
        "query",
        "markdown",
        "markdown_inline",
        "json",
        "rust",
    },
    indent = { enable = true },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
