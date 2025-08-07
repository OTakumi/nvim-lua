local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
        "gopls",
        "jqls",
        "lua_ls",
        "marksman",
        "sqls",
        "taplo",
        "ts_ls",
        "terraformls",
        "yamlls",
    },
    automatic_installation = true,
    automatic_enable = true,
})

lspconfig.lua_ls.setup({
    capabilities = capabilities,

    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false, -- `require('plenary')`のようなサードパーティライブラリのエラーを抑制
            },
        }
    }
})

lspconfig.pylsp.setup({
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { "W391", "E713" },
                    maxLineLength = 120,
                },
                pylint = {
                    enabled = true,
                    args = {
                        "--disable=C0114,C0115,C0116,C0301,E401",
                    },
                },
                black = {
                    lineLength = 120,
                },
                flake8 = {
                    ignore = { "W391", "E203", "E701", "F401", "W503", "E401", "E402" },
                    maxLineLength = 120,
                },
            },
        },
    },
})

lspconfig.csharp_ls.setup({
})
