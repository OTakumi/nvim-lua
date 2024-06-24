local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
    vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = false, buffer = bufnr })

vim.g.rustaceanvim = function()
    return {
        -- other rustacean settings. --
        server = {
            on_attach = function()
                vim.keymap.set("n", "<Leader>K", function()
                    vim.cmd.RustLsp({ "hover", "actions" })
                end, { buffer = bufnr })
                -- other settings. --
            end,
            default_settings = {
                -- rust-analyzer language server configuration
                ["rust-analyzer"] = {
                    cargo = {
                        allFeatures = true,
                        loadOutDirsFromCheck = true,
                        buildScripts = {
                            enable = true,
                        },
                    },
                    -- Add clippy lints for Rust.
                    checkOnSave = true,
                    procMacro = {
                        enable = true,
                        ignored = {
                            ["async-trait"] = { "async_trait" },
                            ["napi-derive"] = { "napi" },
                            ["async-recursion"] = { "async_recursion" },
                        },
                    },
                },
            },
        },
    }
end
