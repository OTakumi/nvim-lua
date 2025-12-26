return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- Automatically update parsers on installation or update
    build = ":TSUpdate",
    event = "VimEnter",
    opts = {
      -- List of parsers to install
      ensure_installed = {
        "lua",
        "rust",
        "python",
        "go",
        "vim",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "vue",
        "json",
        "markdown",
        "markdown_inline",
      },
      -- Enable indent functionality
      indent = { enable = true },
      -- Enable highlight functionality
      highlight = {
        enable = true,
        -- Disable highlighting for large files
        disable = function(lang, buf)
          local max_filesize = 300 * 1024 -- 300 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        -- Disable additional Vim regex highlighting
        additional_vim_regex_highlighting = false,
      },
    },
  },

  -- Plugin to display the context of the current code block
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {},
  },
}
