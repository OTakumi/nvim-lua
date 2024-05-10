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

    -- Git
    use("tpope/vim-fugitive")

    -- file finder
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-ghq.nvim" },
            { "nvim-telescope/telescope-z.nvim" },
        },
    })

    -- LSP
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig") -- enable LSP
    use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
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
        requires = {
            { "hrsh7th/cmp-buffer" }, -- buffer completions
            { "hrsh7th/cmp-path" }, -- path completions
            { "hrsh7th/cmp-cmdline" }, -- cmdline completions
            { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-vsnip" },
            { "onsails/lspkind-nvim" },
            { "hrsh7th/vim-vsnip" },
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
        config = function()
            require("todo-comments").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })

    -- comments
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    -- rust tools
    use("simrat39/rust-tools.nvim")

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

    -- gitsigns
    use("lewis6991/gitsigns.nvim")

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
