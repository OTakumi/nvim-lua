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
        "cmake",
        "dockerls",
        "gopls",
        "golangci_lint_ls",
        "marksman",
        "biome",
    },
})

require("mason-lspconfig").setup_handlers({
    function(server)
        local opt = {
            capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        }

        require("lspconfig")[server].setup(opt)
    end,

    ["rust_analyzer"] = function()
        require("rust-tools").setup({
            tools = {
                executor = require("rust-tools/executors").termopen,
                reload_workspace_from_cargo_toml = true,
            },
        })
    end,
})

local null_ls = require("null-ls")
null_ls.setup()

require("mason-null-ls").setup({
    ensure_installed = { "stylua", "jq" },
    handlers = {},
})
