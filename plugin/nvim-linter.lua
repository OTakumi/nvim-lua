local lint = require("lint")

lint.linters_by_ft = {
  javascript = { "biomejs" },
  typescript = { "biomejs" },
  jsx = { "biomejs" },
  tsx = { "biomejs" },
  go = { "golangcilint" },
  lua = { "luacheck" },
  python = { "ruff" },
  docker = { "hadolint" },
  markdown = { "markdownlint" },
  sql = { "sqlfluff" },
  yaml = { "yamllint" },
}

-- ruff
lint.linters.ruff.args = {
  "--select=F,E",
  "--ignore=E501",
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
  callback = function()
    lint.try_lint()
  end,
})

-- :Lint
vim.api.nvim_create_user_command("Lint", function()
  lint.try_lint()
end, { desc = "Trigger nvim-lint" })

-- :LintHealthCheck
vim.api.nvim_create_user_command("LintHealthCheck", function()
  local ft = vim.bo.filetype
  local linter_names = lint.linters_by_ft[ft]

  if not linter_names or #linter_names == 0 then
    print("❌ nvim-lint: No linters configured for '" .. ft .. "'")
    return
  end

  print("✅ nvim-lint: Active linters for '" .. ft .. "'")

  local active_linter_configs = {}
  for _, name in ipairs(linter_names) do
    -- lint.linters テーブルから定義を名前で検索する
    active_linter_configs[name] = lint.linters[name] or { error = "Definition not found" }
  end

  -- 取得した設定内容を見やすく表示
  print(vim.inspect(active_linter_configs))
end, { desc = "Check nvim-lint config for current filetype" })
