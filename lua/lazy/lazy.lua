require("lazy").setup({
    -- Github copilot
    { "github/copilot.vim", lazy = false },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        opts = {
            suggesion = { enabled = true },
            panel = { enabled = false },
            copilot_node_command = "node",
            filetypes = {
                javascript = true,
                typescript = true,
                typescriptreact = true,
                javascriptreact = true,
                lua = true,
                python = true,
                rust = true,
                go = true,
                sh = true,
                yaml = true,
                json = true,
                html = true,
                css = true,
                help = true,
                gitcommit = true,
                gitrebase = true,
                hgcommit = true,
                markdown = true,
                ["*"] = false,
            },
        },
    },

    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim", "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {},
    },

    -- Git
    {
        "tpope/vim-fugitive",
        lazy = true,
        event = "InsertEnter",
    },

    -- Simple plugins can be specified as strings
    { "rstacruz/vim-closer", lazy = true, event = "InsertEnter" },

    -- LSP
    -- mason
    { "williamboman/mason.nvim", lazy = true },
    { "williamboman/mason-lspconfig.nvim", lazy = true, opt = {} },
    { "neovim/nvim-lspconfig", lazy = true },
    {
        "jay-babu/mason-null-ls.nvim",
        lazy = true,
        -- event = { "BufReadPre", "BufNewFile" },
    },
    { "nvimtools/none-ls.nvim", lazy = true },

    -- cmp plugins
    { "hrsh7th/nvim-cmp", lazy = true },
    { "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
    { "hrsh7th/cmp-nvim-lua", lazy = true },
    { "hrsh7th/cmp-nvim-lsp", lazy = true },
    { "hrsh7th/cmp-buffer", lazy = true },
    { "hrsh7th/cmp-path", lazy = true },
    { "hrsh7th/cmp-vsnip", lazy = true, event = "InsertEnter" },
    { "hrsh7th/vim-vsnip", lazy = true, event = "InsertEnter" },
    {
        "zbirenbaum/copilot-cmp",
        lazy = true,
        event = "InsertEnter",
    },

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
})
