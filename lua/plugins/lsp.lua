return {
  { "hrsh7th/cmp-nvim-lsp", opts = {} },
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "clangd",
        "cmake",
        "csharp_ls",
        "gopls",
        "vue_ls",
        "vtsls",
        "biome",
        "pylsp",
        "ruff",
        "rust_analyzer",
        "dockerls",
        "cssls",
        "yamlls",
      },
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local nmap = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc, silent = true })
          end
          nmap("K", vim.lsp.buf.hover, "LSP: Hover")
          nmap("gf", vim.lsp.buf.format, "LSP: Format")
          nmap("gr", vim.lsp.buf.references, "LSP: References")
          nmap("gd", vim.lsp.buf.definition, "LSP: Definition")
          nmap("gD", vim.lsp.buf.declaration, "LSP: Declaration")
          nmap("gi", vim.lsp.buf.implementation, "LSP: Implementation")
          nmap("gt", vim.lsp.buf.type_definition, "LSP: Type Definition")
          nmap("gn", vim.lsp.buf.rename, "LSP: Rename")
          nmap("ga", vim.lsp.buf.code_action, "LSP: Code Action")
          nmap("ge", vim.diagnostic.open_float, "LSP: Show Diagnostics")
          nmap("g]", vim.diagnostic.goto_next, "LSP: Next Diagnostic")
          nmap("g[", vim.diagnostic.goto_prev, "LSP: Prev Diagnostic")
          nmap("<leader>k", vim.lsp.buf.signature_help, "LSP: Signature Help")
          nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "LSP: Add Workspace Folder")
          nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "LSP: Remove Workspace Folder")
          nmap("<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, "LSP: List Workspace Folders")
        end,
      }),
    },
  },
}
