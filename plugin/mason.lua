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
        "marksman",
        -- "rust_analyzer",
        "pylsp",
        "sqls",
        "taplo",
        "ts_ls",
        "yamlls",
    },
})

require("mason-lspconfig").setup_handlers({
    function(server)
        require("lspconfig")[server].setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        })
    end,
    -- ["rust_analyzer"] = function() end,
    ["clangd"] = function()
        require("lspconfig").clangd.setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            cmd = {
                "clangd",
                "--offset-encoding=utf-16",
            },
        })
        -- require("clangd_extensions.inlay_hints").setup_autocmd()
        -- require("clangd_extensions.inlay_hints").set_inlay_hints()
    end,
    ["pylsp"] = function()
        require("lspconfig").pylsp.setup({
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            ignore = { "W391" },
                            maxLineLength = 119,
                        },
                    },
                },
            },
        })
    end,
    ["gopls"] = function()
        require("lspconfig").gopls.setup({
            analyzes = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
        })
    end,
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
        "black",
        "biome",
        "cpplint",
        "clang-format",
        "gofmt",
        "gofumpt",
        "goimports",
        "hadolint",
        "markdownlint",
        "prettier",
        "pylint",
        "stylua",
        "stylelint",
        "yamllint",
        "yamlfmt",
    },
    handlers = {},
})

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        -- linters
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.pylint.with({
            diagnostics_postprocess = function(diagnostic)
                diagnostic.code = diagnostic.message_id
            end,
        }),
        null_ls.builtins.diagnostics.hadolint,

        -- formatters
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.biome,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.yamlfmt,
    },
})
