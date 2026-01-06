--[[
Rust development configuration using rustaceanvim

IMPORTANT: rust-analyzer Installation
- Do NOT use Mason to manage rust-analyzer
- The rustaceanvim author recommends against using Mason-managed rust-analyzer
- Reason: Version mismatches between rust-analyzer and your project toolchain
  can lead to subtle issues

Recommended Installation:
1. Install rust-analyzer via rustup (recommended):
   $ rustup component add rust-analyzer

2. Verify installation:
   $ rust-analyzer --version

3. Update rust-analyzer (automatically updated with rustup):
   $ rustup update

Configuration Notes:
- rustaceanvim will automatically detect rust-analyzer in your PATH
- No need to specify `server.cmd` unless using a custom installation
- Ensure mason-lspconfig excludes rust_analyzer in lua/plugins/lsp.lua:
  automatic_enable = {
    exclude = { "rust_analyzer" }
  }
--]]

return {
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    ft = "rust",
    config = function(_, opts)
      vim.g.rustaceanvim = opts
    end,
    opts = {
      tools = {
        enable_nextest = true,
      },
      -- LSP server (rust-analyzer) configuration
      server = {
        on_attach = function(_, bufnr)
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
            cargo = {
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
  },
}
