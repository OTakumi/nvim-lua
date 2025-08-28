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
  markdown = { "vale" },
  sql = { "sqlfluff" },
  yaml = { "yq" },
}

-- ruff
lint.linters.ruff.args = {
  "--select=F,E",
  "--ignore=E501",
  "--line-length=120",
}
