-- Parsers to install. Highlighting, indentation, and folding are provided by
-- Neovim itself on the `main` branch of nvim-treesitter; this plugin only
-- manages parsers and queries.
local parsers = {
  "c",
  "cpp",
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
  "tsx",
  "vue",
  "json",
  "bash",
  "markdown",
  "markdown_inline",
  "make",
  "cmake",
  "toml",
  "yaml",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    -- The main branch does not support lazy-loading
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("user-treesitter", { clear = true }),
        callback = function(ev)
          local lang = vim.treesitter.language.get_lang(ev.match)
          if not lang then
            return
          end
          local ok_add, has_parser = pcall(vim.treesitter.language.add, lang)
          if not ok_add or not has_parser then
            return
          end
          -- Skip large files to keep editing responsive
          local max_filesize = 300 * 1024
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
          if ok and stats and stats.size > max_filesize then
            return
          end
          vim.treesitter.start(ev.buf, lang)
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },

  -- Plugin to display the context of the current code block
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {},
  },
}
