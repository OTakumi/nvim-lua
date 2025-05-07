local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- vim.lsp.enable("pylsp")
vim.lsp.config("pylsp", {
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
require("lspconfig").pylsp.setup({
    capabilities = capabilities,
    -- other lspconfig configs
})

-- vim.lsp.enable("lua_ls")
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.list_extend(vim.api.nvim_get_runtime_file("lua", true), {
                    "${3rd}/luv/library",
                    "${3rd}/busted/library",
                    "${3rd}/luassert/library",
                }),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
require("lspconfig").lua_ls.setup({
    capabilities = capabilities,
    -- other lspconfig configs
})

vim.lsp.config("clangd", {
    settings = {
        ["clangd"] = {
            filetypes = { "c", "cpp", "objc", "objcpp" },
            cmd = {
                "clangd",
                "--offset-encoding=utf-16",
            },
        },
    },
})
require("lspconfig").clangd.setup({
    capabilities = capabilities,
    -- other lspconfig configs
})
