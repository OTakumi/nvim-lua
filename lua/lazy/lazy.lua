require("lazy").setup({
    -- Github copilot
    { "github/copilot.vim", lazy = false, opt = {} },
    { "zbirenbaum/copilot.lua", lazy = true },
    { "nvim-lua/plenary.nvim", lazy = true },

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
        event = { "BufReadPre", "BufNewFile" },
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

    -- neotest
    {
        "nvim-neotest/neotest",
        dependencies = {
            "alfaix/neotest-gtest",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/nvim-nio",
        },
        event = "InsertEnter",
    },

    -- nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = true,
    },

    -- dap
    {
        "mfussenegger/nvim-dap",
        lazy = true,
    },
    {
        "rcarriga/nvim-dap-ui",
        lazy = true,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        lazy = true,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        lazy = true,
        event = "InsertEnter",
    },

    -- lspsaga
    {
        "nvimdev/lspsaga.nvim", -- LSP UIs
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        event = "InsertEnter",
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

    -- Todo highlight
    {
        "folke/todo-comments.nvim",
        event = "InsertEnter",
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
        ft = "rust",
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^4",
        lazy = true,
        ft = "rust",
    },

    -- typescript
    {
        "pmizio/typescript-tools.nvim",
        opts = {},
        lazy = true,
        ft = { "typescript", "typescriptreact" },
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

    -- Git
    {
        "dinhhuy258/git.nvim",
        opts = {},
        lazy = true,
        event = "InsertEnter",
    },

    -- toggleterm
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            direction = "float",
        },
        lazy = true,
        event = "VimEnter",
    },

    -- markdown
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        lazy = true,
        ft = "markdown",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    { "tyru/open-browser.vim", lazy = true, ft = "markdown" },
    { "folke/tokyonight.nvim", lazy = true, event = "VimEnter" }, -- Colorschema

    -- Plantuml
    { "aklt/plantuml-syntax", lazy = true },
})
