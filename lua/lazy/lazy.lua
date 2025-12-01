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
      -- model = "gpt-4.1",
      window = {
        layout = "float",
        width = 120, -- Fixed width in columns
        height = 40, -- Fixed height in rows
        border = "rounded", -- 'single', 'double', 'rounded', 'solid'
        title = "🤖 AI Assistant",
        zindex = 100, -- Ensure window stays on top
      },

      headers = {
        user = "👤 You",
        assistant = "🤖 Copilot",
        tool = "🔧 Tool",
      },
    },
    config = function(_, opts)
      -- まずCopilotChatのセットアップを実行
      local chat = require("CopilotChat")
      chat.setup(opts)

      -- ここからが自動実行の設定です
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "gitcommit", -- ファイルタイプが gitcommit の時だけ発動
        callback = function()
          -- タイミングの問題を防ぐため、少しだけ遅延実行させるのがコツです
          vim.schedule(function()
            vim.cmd("CopilotChatCommit")
          end)
        end,
      })
    end,
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

  -- dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = {
      -- config
      config = {
        week_header = {
          enable = true, --boolean use a week header
          -- concat = true, --concat string after time string line
          -- append = true, --table append after time string line
        },
      },
    },
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

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
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {},
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

  -- snack
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      words = { enabled = true },
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
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },

  -- comments
  {
    "numToStr/Comment.nvim",
    opts = {},
    event = "VimEnter",
  },

  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {
      -- Configuration here, or leave empty to use defaults
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
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
      options = {
        theme = "iceberg_dark",
        icons_enabled = true,
      },
    },
    event = "VimEnter",
  },

  -- cpp
  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    ft = { "c", "cpp" },
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
