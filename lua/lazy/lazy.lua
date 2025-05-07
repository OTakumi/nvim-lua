require("lazy").setup({
    -- Github copilot
    -- { "github/copilot.vim", lazy = false },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        lazy = false,
        opts = {
            panel = { enabled = false },
            suggestion = { enabled = false },
        },
    },

    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            model = "claude-3.7-sonnet",
        },
    },

    -- avante
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
        opts = {
            ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
            provider = "claude", -- The provider used in Aider mode or in the planning phase of Cursor Planning Mode
            -- WARNING: Since auto-suggestions are a high-frequency operation and therefore expensive,
            -- currently designating it as `copilot` provider is dangerous because: https://github.com/yetone/avante.nvim/issues/1048
            -- Of course, you can reduce the request frequency by increasing `suggestion.debounce`.
            -- add any opts here
            auto_suggestions_provider = "claude",
            cursor_applying_provider = nil, -- The provider used in the applying phase of Cursor Planning Mode, defaults to nil, when nil uses Config.provider as the provider for the applying phase
            claude = {
                endpoint = "https://api.anthropic.com",
                model = "claude-3-5-sonnet-20241022",
                temperature = 0,
                max_tokens = 4096,
            },
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "echasnovski/mini.pick", -- for file_selector provider mini.pick
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
            "ibhagwan/fzf-lua", -- for file_selector provider fzf
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },

    -- Git
    {
        "tpope/vim-fugitive",
        lazy = true,
        event = "InsertEnter",
    },

    -- Simple plugins can be specified as strings
    { "rstacruz/vim-closer", lazy = true, event = "InsertEnter" },

    -- mason
    { "williamboman/mason.nvim" },

    -- lsp
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },

    {
        "jay-babu/mason-null-ls.nvim",
        lazy = true,
        -- event = { "BufReadPre", "BufNewFile" },
    },
    { "nvimtools/none-ls.nvim", lazy = true },

    -- cmp plugins
    { "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
    { "hrsh7th/cmp-nvim-lua", lazy = true },
    { "hrsh7th/cmp-nvim-lsp", lazy = true },
    { "hrsh7th/cmp-buffer", lazy = true },
    { "hrsh7th/cmp-path", lazy = true },
    {
        "zbirenbaum/copilot-cmp",
        lazy = true,
        event = "InsertEnter",
        opts = {},
    },
    { "hrsh7th/nvim-cmp", lazy = true, event = "InsertEnter" },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.3", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        lazy = true,
        event = "InsertEnter",
    },
    { "saadparwaiz1/cmp_luasnip", lazy = true, event = "InsertEnter" },
    { "hrsh7th/cmp-copilot", lazy = true, event = "InsertEnter" },

    -- nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    -- dap
    {
        "mfussenegger/nvim-dap",
        lazy = true,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        lazy = true,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        lazy = true,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        lazy = true,
    },

    -- lspsaga
    {
        "nvimdev/lspsaga.nvim", -- LSP UIs
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- formatters, linters
    { "mhartington/formatter.nvim", event = "CmdlineEnter" },

    -- file finder
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        lazy = true,
    },

    -- comments
    {
        "numToStr/Comment.nvim",
        opts = {},
        event = "VimEnter",
    },

    --rust
    {
        "rust-lang/rust.vim",
        lazy = true,
        ft = { "rust" },
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = true,
        ft = { "rust" },
    },

    -- statusline style
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = "material",
            icons_enabled = true,
        },
        lazy = true,
        event = "VimEnter",
    },

    -- cpp
    {
        "p00f/clangd_extensions.nvim",
        lazy = true,
        ft = { "c", "cpp" },
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        lazy = true,
        event = "VimEnter",
        opts = {},
    },

    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
        --   -- refer to `:h file-pattern` for more examples
        --   "BufReadPre path/to/my-vault/*.md",
        --   "BufNewFile path/to/my-vault/*.md",
        -- },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
    },
})
