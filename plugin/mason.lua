require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd",
        "dockerls",
        "docker_compose_language_service",
        "graphql",
        "gopls",
        "jqls",
        "lua_ls",
        "luau_lsp",
        "marksman",
        "pylsp",
        "sqlls",
        "taplo",
        "tsserver",
        "yamlls",
    },
})

require("mason-nvim-dap").setup({
    ensure_installed = {
        "python",
        "delve",
        "cppdbg",
        "codelldb",
        "cpptools",
    },
    handlers = {},
})

require("mason-null-ls").setup({
    function() end,
    ensure_installed = {
        "biome",
        "dockerfilelint",
        "dockerlint",
        "eslint",
        "gofmt",
        "golangci-lint",
        "jsonlint",
        "markdownlint",
        "prettier",
        "pylint",
        "stylua",
        "shellcheck",
        "stylelint",
        "yamllint",
    },
    handlers = {},
})
