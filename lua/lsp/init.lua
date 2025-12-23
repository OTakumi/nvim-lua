-- Lsp共通設定
local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("*", {
  capabilities = capabilities,
  root_markers = { ".git" },
})

vim.lsp.enable("pylsp")
vim.lsp.enable({ "vtsls", "vue_ls" })
