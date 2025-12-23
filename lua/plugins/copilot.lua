return {
  {
    "zbirenbaum/copilot.lua",
    -- "Copilot"コマンドが実行されるまでプラグインの読み込みを遅延させます
    cmd = "Copilot",
    -- 挿入モードに入ったタイミングで読み込む設定も一般的です
    event = "InsertEnter",
    opts = {
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = false,
      },
      copilot_node_command = "node",
      filetypes = {
        yaml = true,
        help = true,
        gitcommit = true,
        gitrebase = true,
        hgcommit = true,
        markdown = true,
        ["."] = false,
      },
    },
  },
}

