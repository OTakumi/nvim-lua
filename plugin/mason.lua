require("mason-nvim-dap").setup({
  ensure_installed = {
    "python",
    "delve",
    "cppdbg",
    "codelldb",
    "cpptools",
  },
  automatic_installation = true,
})

require("mason-null-ls").setup({
  function() end,
  ensure_installed = {
    "biome",
    "cpplint",
    "clang-format",
    "gofmt",
    "gofumpt",
    "goimports",
    "hadolint",
    "markdownlint",
    "stylua",
    "stylelint",
    "terraform",
    "yamllint",
    "yamlfmt",
  },
  automatic_installation = true,
})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- linters
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.diagnostics.hadolint,

    -- formatters
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.biome,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.yamlfmt,
  },
})
