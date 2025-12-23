return {
  {
    "mfussenegger/nvim-lint",
    -- ファイルの読み書きや挿入モード終了時に読み込まれるようにします
    event = { "BufWritePost", "BufReadPost", "InsertLeave" },
    config = function()
      local lint = require("lint")

      -- ファイルタイプ毎のリンター設定
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
        vue = { "biomejs" },
      }

      -- 特定のリンターへの引数設定
      lint.linters.ruff.args = {
        "--select=F,E",
        "--ignore=E501",
      }

      -- lintを実行するための自動コマンド
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("nvim-lint-autogroup", { clear = true }),
        callback = function()
          lint.try_lint()
        end,
      })

      -- ユーザーコマンドの作成
      vim.api.nvim_create_user_command("Lint", function()
        lint.try_lint()
      end, { desc = "Trigger nvim-lint" })

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
          active_linter_configs[name] = lint.linters[name] or { error = "Definition not found" }
        end
        print(vim.inspect(active_linter_configs))
      end, { desc = "Check nvim-lint config for current filetype" })
    end,
  },
}