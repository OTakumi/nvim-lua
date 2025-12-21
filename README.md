# nvim-lua

## LSP

LSPサーバーを追加する手順は以下の通りです。

1. `:Mason` を実行し、追加したいLSPサーバーの名前を確認します。
2. `:MasonInstall <server-name>` を実行してサーバーをインストールします。（例: `:MasonInstall pylsp`）
3. `lsp/` ディレクトリに設定ファイルを作成します (任意)。
   - `lsp/<server-name>.lua` という名前でファイルを作成すると、サーバーの起動時に自動で読み込まれます。
   - 例えば `pylsp` の設定を追加する場合、`lsp/pylsp.lua` を作成します。
4. `lua/lsp/init.lua` の `vim.lsp.enable` テーブルに、手順1で確認したサーバー名を追加します。
