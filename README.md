# nvim-lua

## ディレクトリ構成

このNeovim設定の主要なディレクトリ構造は以下の通りです。

```text
.
├── init.lua          "Neovimのメイン設定ファイル"
├── after/ 
│   └── lsp/          "LSPサーバーごとのカスタム設定ファイル"
│       ├── pylsp.lua
│       ├── vtsls.lua
│       └── vue_ls.lua
└── lua/              "メインのLuaモジュール群"
    ├── config/       "lazy.nvimの設定"
    ├── core/         "コア設定（キーマップ、オプションなど）"
    ├── lsp/          "LSP関連（現在はinit.luaのみ）"
    │   └── init.lua
    └── plugins/      "各プラグインの設定"
```

## LSP

LSPサーバーを追加する手順は以下の通りです。

1. `lua/plugins/lsp.lua`ファイルを開きます。
2. `servers`テーブルのリストに、追加したいLSPサーバーの名前（`mason`で表示される名前）を追加します。
    * これにより、Neovim起動時にサーバーが自動的にインストールされ、セットアップされます。
3. (任意) サーバーにカスタム設定を追加したい場合は、`after/lsp/`ディレクトリに設定ファイルを作成します。
    * `after/lsp/<server-name>.lua` という名前でファイルを作成すると、サーバー起動時に設定が自動的に読み込まれ、デフォルト設定とマージされます。
    * 例えば、`pylsp`にカスタム設定を追加したい場合は、`after/lsp/pylsp.lua`ファイルを作成し、設定内容をLuaテーブルとして`return`します。

<https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file>

### 設定例: `after/lsp/pylsp.lua`

```lua
return {
  settings = {
    pylsp = {
      plugins = {
        -- Your plugins here
      },
    },
  },
}
```
