return {
  {
    "https://github.com/windwp/nvim-ts-autotag",
    lazy = true,
    event = "InsertEnter", -- 'evemt' のタイポを修正
    ft = {
      "html",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "rescript",
      "xml",
      "markdown",
    },
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
  },
}
