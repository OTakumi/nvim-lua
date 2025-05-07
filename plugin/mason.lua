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
        "pylsp",
        "sqls",
        "taplo",
        "ts_ls",
        "yamlls",
    },
    automatic_installation = true,
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
        -- "black",
        "biome",
        "cpplint",
        "clang-format",
        "gofmt",
        "gofumpt",
        "goimports",
        "hadolint",
        "markdownlint",
        "prettier",
        -- "pylint",
        "stylua",
        "stylelint",
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
        -- null_ls.builtins.diagnostics.pylint.with({
        --     diagnostics_postprocess = function(diagnostic)
        --         diagnostic.code = diagnostic.message_id
        --     end,
        -- }),
        null_ls.builtins.diagnostics.hadolint,

        -- formatters
        null_ls.builtins.formatting.isort,
        -- null_ls.builtins.formatting.black,
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
