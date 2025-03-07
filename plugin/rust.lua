vim.g.rustaceanvim = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.keymap.set("n", "<leader>a", function()
        vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
    end, { silent = true, buffer = bufnr })
    vim.keymap.set(
        "n",
        "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
        function()
            vim.cmd.RustLsp({ "hover", "actions" })
        end,
        { silent = true, buffer = bufnr }
    )

    return {
        -- other rustacean settings. --
        tools = {
            enable_nextest = true,
            enable_clippy = true,
        },
        server = {
            on_attach = function()
                -- other settings. --
            end,
            default_settings = {
                -- rust-analyzer language server configuration
                ["rust-analyzer"] = {
                    -- Add clippy lints for Rust.
                    checkOnSave = true,
                    procMacro = {
                        enable = true,
                        ignored = {
                            ["napi-derive"] = { "napi" },
                            ["async-recursion"] = { "async_recursion" },
                        },
                    },
                },
            },
        },
    }
end
