require("conform").setup({
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
        lsp_fallback = true,
    },
    formatters = {
        stylua = {
            exe = "stylua",
            args = {
                "--indent-type=spaces",
                "--indent-width=4",
                "--search-parent-directories",
                "--stdin-filepath",
            },
            stdin = true,
        },
        black = {
            exe = "black",
            args = {
                "-l 119",
                "--quiet",
            },
            stdin = true,
        },
    },
    formatters_by_ft = {
        lua = { "stylua" },

        -- Conform will run multiple formatters sequentially
        python = { "black" },

        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },

        -- Conform will run the first available formatter
        typescript = { "biome" },
        typescriptreact = { "biome" },
        javascript = { "biome" },
        javascriptreact = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
    },
})
