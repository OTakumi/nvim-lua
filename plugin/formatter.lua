-- Utilities for creating configurations
local defaults = require("formatter.defaults")
local util = require("formatter.util")

-- Automatically format on save
vim.api.nvim_create_augroup("__formatter__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = "__formatter__",
    command = ":FormatWrite",
})

local biome_config = function()
    return {
        exe = "biome",
        args = {
            "format",
            "--line-width=100",
            "--indent-width=2",
            "--semicolons=always",
            "--indent-style=space",
            "--quote-style=single",
            "--trailing-comma=es5",
            "--attribute-position=multiline",

            -- Always write the path setting immediately after std-file-path
            "--stdin-file-path",
            util.escape_path(util.get_current_buffer_file_path()),
        },
        stdin = true,
    }
end

local yamlfmt_config = function()
    return {
        exe = "yamlfmt",
    }
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- Format on save

    -- All formatter configurations are opt-in
    filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        -- ========== Lua ==========
        lua = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.lua").stylua,

            -- You can also define your own configuration
            function()
                -- Supports conditional formatting
                if util.get_current_buffer_file_name() == "special.lua" then
                    return nil
                end

                -- Full specification of configurations is down below and in Vim help
                -- files
                return {
                    exe = "stylua",
                    args = {
                        "--indent-type=spaces",
                        "--search-parent-directories",
                        "--stdin-filepath",
                        util.escape_path(util.get_current_buffer_file_path()),
                        "--",
                        "-",
                    },
                    stdin = true,
                }
            end,
        },

        -- ========== Rust ==========
        rust = {
            require("formatter.filetypes.rust").rustfmt,
            function()
                return {}
            end,
        },

        -- ========== Python ==========
        python = {
            require("formatter.filetypes.python").black,
            function()
                return {
                    exe = "black",
                    args = {
                        "-l 80",
                        "--quiet",
                        "-",
                    },
                    stdin = true,
                }
            end,
        },

        -- ========== TypeScript ==========
        typescript = { require("formatter.filetypes.typescript").biome, biome_config },
        typescriptreact = { require("formatter.filetypes.typescriptreact").biome, biome_config },

        -- ========== JavaScript ==========
        javascript = { require("formatter.filetypes.javascript").biome, biome_config },
        javascriptreact = { require("formatter.filetypes.javascriptreact").biome, biome_config },

        -- ========== C++ ==========
        cpp = {
            require("formatter.filetypes.cpp").clangformat,
            function()
                return {
                    exe = "clang-format",
                    args = {
                        "--sort-includes",
                        "-style='{BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 80}'",
                    },
                    stdin = true,
                }
            end,
        },

        -- ========== Yaml ==========
        yaml = { require("formatter.filetypes.yaml").yamlfmt, yamlfmt_config },
        yml = { require("formatter.filetypes.yaml").yamlfmt, yamlfmt_config },

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace,
        },
    },
})
