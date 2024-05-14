require("lazy").setup({
    -- Simple plugins can be specified as strings
    { "rstacruz/vim-closer" },

    -- LSP
    -- mason
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "jose-elias-alvarez/null-ls.nvim",
            "hrsh7th/nvim-cmp",
        },
    },

    -- lspsaga
    {
        "nvimdev/lspsaga.nvim", -- LSP UIs
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- cmp plugins
    {
        "hrsh7th/nvim-cmp", -- The completion plugins
        dependencies = {
            { "hrsh7th/cmp-buffer" }, -- buffer completions
            { "hrsh7th/cmp-path" }, -- path completions
            { "hrsh7th/cmp-cmdline" }, -- cmdline completions
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-vsnip" },
            { "hrsh7th/vim-vsnip" },
        },
    },

    -- nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
    },

    -- formatters, linters
    { "jay-babu/mason-null-ls.nvim" },
    { "mhartington/formatter.nvim" },

    -- file finder
    {
        "nvim-telescope/telescope.nvim",
    },

    -- Terminal
    { "voldikss/vim-floaterm" },

    -- Todo highlight
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
    },

    -- comments
    {
        "numToStr/Comment.nvim",
    },

    -- statusline style
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = { "ayu_mirage" },
        },
    },

    -- markdown
    {
        "preservim/vim-markdown",
        "previm/previm",
        "tyru/open-browser.vim",
    },

    -- Colorschema
    { "folke/tokyonight.nvim" },

    -- Plantuml
    { "aklt/plantuml-syntax" },
})
