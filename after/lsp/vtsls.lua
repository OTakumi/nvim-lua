---@type vim.lsp.Config
local vue_plugin_path = vim.fs.joinpath(
  vim.env.HOME,
  ".local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server"
)

if vim.fn.isdirectory(vue_plugin_path) == 0 then
  vim.notify("Warning: Vue plugin path not found: " .. vue_plugin_path, vim.log.levels.WARN)
end

local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }

return {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = { -- 配列形式で渡す
          {
            name = "@vue/typescript-plugin",
            location = vue_plugin_path,
            languages = { "vue" },
            configNamespace = "typescript",
          },
        },
      },
    },
  },
  filetypes = tsserver_filetypes,
}
