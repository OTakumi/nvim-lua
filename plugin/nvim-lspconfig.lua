local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").pylsp.setup({
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

