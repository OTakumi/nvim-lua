require("lazy").setup({
    -- Github copilot
    { "github/copilot.vim", lazy = false },

    -- Copilot chat
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        opts = {
            debug = true, -- Enable debugging
            -- See Configuration section for rest
        },
        -- See Commands section for default commands if you want to lazy load on them
    },

    -- Simple plugins can be specified as strings
    { "rstacruz/vim-closer", lazy = true, event = "InsertEnter" },

    -- LSP
    -- mason
    {
        "williamboman/mason.nvim",
        dependencies = {
            { "williamboman/mason-lspconfig.nvim", lazy = true, event = "InsertEnter" },
            { "neovim/nvim-lspconfig", lazy = true, event = "InsertEnter" },
            { "jose-elias-alvarez/null-ls.nvim", lazy = true, event = "InsertEnter" },
            { "hrsh7th/nvim-cmp", lazy = true, event = "InsertEnter" },
        },
        lazy = true,
        event = "InsertEnter",
    },

    -- cmp plugins
    {
        "hrsh7th/nvim-cmp", -- The completion plugins
        lazy = true,
        event = "InsertEnter",
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

    -- nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        event = "VimEnter",
    },

    -- lspsaga
    {
        "nvimdev/lspsaga.nvim", -- LSP UIs
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons",
        },
        lazy = true,
        event = "VimEnter",
    },

    -- formatters, linters
    { "jay-babu/mason-null-ls.nvim", lazy = true, event = "InsertEnter" },
    { "mhartington/formatter.nvim", lazy = true, event = "InsertEnter" },

    -- file finder
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        event = "VimEnter",
    },

    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        lazy = true,
        event = "VimEnter",
    },

    -- Terminal
    {
        "voldikss/vim-floaterm",
        lazy = true,
        event = "InsertEnter",
    },

    -- Todo highlight
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        lazy = true,
        event = "InsertEnter",
    },

    -- comments
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = true,
        event = "InsertEnter",
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

    -- markdown
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    { "preservim/vim-markdown", lazy = true, event = "InsertEnter" },
    { "previm/previm", lazy = true, event = "InsertEnter" },
    { "tyru/open-browser.vim", lazy = true, event = "InsertEnter" },

    -- Colorschema
    { "folke/tokyonight.nvim", lazy = true, event = "VimEnter" },

    -- Plantuml
    { "aklt/plantuml-syntax", lazy = true, event = "InsertEnter" },
})
