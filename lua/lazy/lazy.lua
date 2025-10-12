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

  -- Git
  {
    "tpope/vim-fugitive",
    lazy = true,
    event = "BufReadPost",
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "BufReadPost",
  },

  -- Simple plugins can be specified as strings
  { "rstacruz/vim-closer", lazy = true, event = "InsertEnter" },

  -- mason
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  -- cmp plugins
  { "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
  { "hrsh7th/cmp-nvim-lua", lazy = true },
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-buffer", lazy = true },
  { "hrsh7th/cmp-path", lazy = true },
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

  -- formatter
  {
    "stevearc/conform.nvim",
    dependencies = { "williamboman/mason.nvim" },
    lazy = true,
    event = { "BufWritePre" }, -- ファイル保存前にイベントを発火
    cmd = { "ConformInfo" },
    opts = {},
  },

  -- linter
  {
    "mfussenegger/nvim-lint",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
  },

  -- file finder
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = true,
  },

  -- tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({})
    end,
    opts = {},
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

  -- git diff
  { "sindrets/diffview.nvim", lazy = true, event = "VimEnter" },

  -- autotag
  {
    "https://github.com/windwp/nvim-ts-autotag",
    lazy = true,
    evemt = "InsertEnter",
    ft = {
      "html",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "rescript",
      "xml",
      "markdown",
    },
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
  },

  -- todo comment
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
})
