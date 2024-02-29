vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Simple plugins can be specified as strings
    use 'rstacruz/vim-closer'

    -- nvim-tree
    use {
        'nvim-tree/nvim-tree.lua',
        require = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' --optional, updated every week.
    }

	-- Git
	use 'tpope/vim-fugitive'

    -- file finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- LSP
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig' -- enable LSP
    use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
    use 'glepnir/lspsaga.nvim' -- LSP UIs

    -- cmp plugins
    use 'hrsh7th/nvim-cmp' -- The completion plugins
    use 'hrsh7th/cmp-buffer' -- buffer completions
    use 'hrsh7th/cmp-path' -- path completions
    use 'hrsh7th/cmp-cmdline' -- cmdline completions
    use 'saadparwaiz1/cmp_luasnip' -- snippet completions
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-vsnip'
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/vim-vsnip'

    -- snippets
    use 'L3MON4D3/LuaSnip' -- snippet engine

    -- DAP
    use {
        "rcarriga/nvim-dap-ui",
        requires = {
            'mfussenegger/nvim-dap',
            'jayp0521/mason-nvim-dap.nvim',
        },
        config = function()
            vim.fn.sign_define('DapBreakpoint', {text='■', texthl='', linehl='', numhl=''})
            vim.fn.sign_define('DapStopped', {text='●', texthl='', linehl='', numhl=''})
            require('dapui').setup()
            require('dap.ext.vscode').load_launchjs()
        end,
		opts = function(_, opts)
			opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
				"codelldb",
			})
		end,
    }
	use 'leoluz/nvim-dap-go'
	use {
		'folke/neodev.nvim',
		require("neodev").setup({
			library = { plugins = { "nvim-dap-ui" }, type = true }
		})
	}

    -- Formatter & Linter
    use 'MunifTanjim/prettier.nvim'
	use 'mhartington/formatter.nvim'

    -- Terminal
    use 'voldikss/vim-floaterm'

    -- Omnisharp
    use 'OmniSharp/omnisharp-vim'

    -- Todo highlight
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            }
        end
    }

    -- comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- rust tools
    use 'simrat39/rust-tools.nvim'

	-- Go
	use 'mattn/vim-goimports'

	-- statusline style
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	--markdown
	use {
		'preservim/vim-markdown',
		'previm/previm',
		'tyru/open-browser.vim',
	}

    use ({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
        config = function()
            local opts = {
                mkdp_echo_preview_url = 1,
                mkdp_open_to_the_world = 1
            }

            for k, v in pairs(opts) do
                vim.g[k] = v
            end
        end
    })

    -- gitsigns
    use 'lewis6991/gitsigns.nvim'

	-- Colorschema
	use 'folke/tokyonight.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
