return {
  {
    "https://github.com/windwp/nvim-ts-autotag",
    lazy = true,
    event = "InsertEnter",
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
