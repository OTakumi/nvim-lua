-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
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
                return {
                    exe = "rustfmt",
                    args = {
                        "--edition=2021",
                        "--",
                        util.escape_path(util.get_current_buffer_file_path()),
                    },
                    stdin = false,
                }
            end,
        },

        -- ========== Python ==========
        python = {
            require("formatter.filetypes.python").black,
            function()
                return {
                    exe = "black",
                    args = {
                        "--quiet",
                        "-",
                    },
                    stdin = true,
                }
            end,
        },

        -- ========== TypeScript ==========
        typescript = {require("formatter.filetypes.typescript").biome,},
        typescriptreact = {require("formatter.filetypes.typescriptreact").biome,},

        -- ========== JavaScript ==========
        javascript = {require("formatter.filetypes.javascript").biome,},
        javascriptreact = {require("formatter.filetypes.javascriptreact").biome,},

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace,
        },
    },
})
