-- LSP keymaps configuration
-- Set buffer-local keymaps when LSP attaches to a buffer

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    -- Don't set K for Rust (handled by rustaceanvim)
    if vim.bo[ev.buf].filetype ~= "rust" then
      vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "LSP: Hover" }))
    end

    -- LSP actions
    vim.keymap.set("n", "gf", vim.lsp.buf.format, vim.tbl_extend("force", opts, { desc = "LSP: Format" }))
    vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "LSP: References" }))
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "LSP: Definition" }))
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "LSP: Declaration" }))
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "LSP: Implementation" }))
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "LSP: Type Definition" }))
    vim.keymap.set("n", "gn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP: Rename" }))
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "LSP: Code Action" }))

    -- Diagnostics
    vim.keymap.set("n", "ge", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "LSP: Show Diagnostics" }))
    vim.keymap.set("n", "g]", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "LSP: Next Diagnostic" }))
    vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "LSP: Prev Diagnostic" }))

    -- Signature help
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "LSP: Signature Help" }))

    -- Workspace management
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, vim.tbl_extend("force", opts, { desc = "LSP: Add Workspace Folder" }))
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, vim.tbl_extend("force", opts, { desc = "LSP: Remove Workspace Folder" }))
    vim.keymap.set("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, vim.tbl_extend("force", opts, { desc = "LSP: List Workspace Folders" }))
  end,
})
