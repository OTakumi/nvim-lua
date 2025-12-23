return {
  -- Rust用の基本的なファイルタイプ設定やシンタックスを提供
  {
    "rust-lang/rust.vim",
    ft = "rust",
    -- `rustaceanvim` があれば不要な場合も多いため、どちらか一方に絞る選択もあります
  },
  -- LSP、デバッグ、その他多くの機能を提供する高機能プラグイン
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- 安定版を追跡
    ft = "rust",    -- Rustファイルを開いた時にのみ読み込み
    opts = {
      -- 追加ツールの設定
      tools = {
        enable_nextest = true,
        enable_clippy = true,
      },
      -- LSPサーバー(rust-analyzer)の設定
      server = {
        on_attach = function(client, bufnr)
          -- LSPサーバーが起動した後にキーマップを設定
          vim.keymap.set("n", "<leader>a", function() vim.cmd.RustLsp("codeAction") end, { silent = true, buffer = bufnr, desc = "Rust: Code Action" })
          vim.keymap.set("n", "K", function() vim.cmd.RustLsp({ "hover", "actions" }) end, { silent = true, buffer = bufnr, desc = "Rust: Hover Actions" })
        end,
        default_settings = {
          ["rust-analyzer"] = {
            checkOnSave = true,
            procMacro = {
              enable = true,
              ignored = {
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
  },
}