local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup({
    capabilities = capabilities,
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

require("lspconfig").clangd.setup({
    capabilities = capabilities,
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

require("mason-nvim-dap").setup({
    ensure_installed = {
        "python",
        "delve",
        "cppdbg",
        "codelldb",
        "cpptools",
    },
    automatic_installation = true,
})

require("mason-null-ls").setup({
    function() end,
    ensure_installed = {
        "biome",
        "cpplint",
        "clang-format",
        "gofmt",
        "gofumpt",
        "goimports",
        "hadolint",
        "markdownlint",
        "prettier",
        "stylua",
        "stylelint",
        "terraform",
        "yamllint",
        "yamlfmt",
    },
    automatic_installation = true,
})

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        -- linters
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.hadolint,

        -- formatters
        null_ls.builtins.formatting.isort,
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
