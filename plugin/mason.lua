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
        "rust_analyzer",
        "clangd",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "gopls",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "pyright",
        "sqls",
        "tsserver",
        "vimls",
        "yamlls",
    },
})

require("mason-lspconfig").setup_handlers({
    function(server)
        require("lspconfig")[server].setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        })
    end,
})

local null_ls = require("null-ls")
null_ls.setup()

require("mason-null-ls").setup({
    ensure_installed = {
        "biome",
        "stylua",
        "jq",
        "rustfmt",
        "prettier",
        "dockerfilelint",
        "markdownlint",
        "pylint",
        "black",
        "gofumpt",
        "yamllint",
    },
    handlers = {},
})
