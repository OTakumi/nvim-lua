vim.cmd([[packadd packer.nvim]])

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Simple plugins can be specified as strings
    use("rstacruz/vim-closer")

    -- nvim-tree
    use({
        "nvim-tree/nvim-tree.lua",
        require = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly", --optional, updated every week.
    })
    use("nvim-treesitter/nvim-treesitter")

    -- file finder
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-ghq.nvim" },
            { "nvim-telescope/telescope-z.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        },
        wants = {
            "plenary.nvim",
            "telescope-ghq.nvim",
            "telescope-z.nvim",
            "telescope-fzf-native.nvim",
        },
    })

    -- LSP
    use({
        "williamboman/mason.nvim",
        requires = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "jose-elias-alvarez/null-ls.nvim",
            "hrsh7th/nvim-cmp",
        },
    })
    use({
        "nvimdev/lspsaga.nvim", -- LSP UIs
        after = "nvim-lspconfig",
        config = function()
            require("lspsaga").setup({})
        end,
    })

    -- cmp plugins
    use({
        "hrsh7th/nvim-cmp", -- The completion plugins
        modeule = { "cmp" },
        requires = {
            { "hrsh7th/cmp-buffer" }, -- buffer completions
            { "hrsh7th/cmp-path" }, -- path completions
            { "hrsh7th/cmp-cmdline" }, -- cmdline completions
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua", event = "VimEnter" },
            { "hrsh7th/cmp-vsnip", event = "VimEnter" },
            { "hrsh7th/vim-vsnip", event = "VimEnter" },
            -- { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
        },
    })

    -- formatters, linters
    use("jay-babu/mason-null-ls.nvim")
    use("mhartington/formatter.nvim")

    -- Terminal
    use("voldikss/vim-floaterm")

    -- Todo highlight
    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        wants = "nvim-lua/plenary.nvim",
    })

    -- comments
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    -- rust tools
    -- use("simrat39/rust-tools.nvim")

    -- statusline style
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })

    -- markdown
    use({
        "preservim/vim-markdown",
        "previm/previm",
        "tyru/open-browser.vim",
    })

    -- Colorschema
    use("folke/tokyonight.nvim")

    -- Plantuml
    use("aklt/plantuml-syntax")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
