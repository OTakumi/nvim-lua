return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },

  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- `require('plenary')`のようなサードパーティライブラリのエラーを抑制
      },
    },
  },
  -- lspのフォーマット機能を無効化
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}
