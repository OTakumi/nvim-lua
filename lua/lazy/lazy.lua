require("lazy").setup({
    -- Github copilot
    { "github/copilot.vim", lazy = false },

    -- Copilot chat
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        opts = {
            debug = true, -- Enable debugging
            -- See Configuration section for rest
        },
        -- See Commands section for default commands if you want to lazy load on them
    },
    {
        "zbirenbaum/copilot.lua",
    },
    {
        "nvim-lua/plenary.nvim",
    },

    -- Simple plugins can be specified as strings
    { "rstacruz/vim-closer", lazy = true, event = "InsertEnter" },

    -- LSP
    -- mason
    {
        "williamboman/mason.nvim",
        lazy = true,
    },
    { "williamboman/mason-lspconfig.nvim", lazy = true },
    { "neovim/nvim-lspconfig", lazy = true },
    {
        "jay-babu/mason-null-ls.nvim",
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },
    },
    { "nvimtools/none-ls.nvim", lazy = true },

    -- cmp plugins
    {
        "hrsh7th/nvim-cmp", -- The completion plugins
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-nvim-lua",
        },
        lazy = true,
        event = "VimEnter",
    },

    -- neotest
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "alfaix/neotest-gtest",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        lazy = true,
        -- event = "InsertEnter",
    },

    -- nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = true,
        -- event = "InsertEnter",
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
    },

    -- lspsaga
    {
        "nvimdev/lspsaga.nvim", -- LSP UIs
        dependencies = {
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
        lazy = true,
        event = "VimEnter",
    },

    -- Terminal
    {
        "voldikss/vim-floaterm",
        lazy = true,
    },

    -- Todo highlight
    {
        "folke/todo-comments.nvim",
        lazy = true,
        event = "InsertEnter",
    },

    -- comments
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = true,
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
        ft = { "c", "cpp" },
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
    { "aklt/plantuml-syntax", lazy = true, event = "InsertEnter" },
})
