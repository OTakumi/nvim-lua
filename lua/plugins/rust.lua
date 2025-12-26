return {
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    ft = "rust",
    event = "InsertEnter",
    opts = {
      tools = {
        enable_nextest = true,
        enable_clippy = true,
      },
      -- LSP server (rust-analyzer) configuration
      server = {
        on_attach = function(client, bufnr)
          -- Set keymaps after LSP server attaches
          vim.keymap.set("n", "<leader>a", function()
            vim.cmd.RustLsp("codeAction")
          end, { silent = true, buffer = bufnr, desc = "Rust: Code Action" })
          vim.keymap.set("n", "K", function()
            vim.cmd.RustLsp({ "hover", "actions" })
          end, { silent = true, buffer = bufnr, desc = "Rust: Hover Actions" })
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
