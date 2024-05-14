-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ","

-----------------------------------------------------------
-- shortcuts
-----------------------------------------------------------
-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Clear search highlighting with <leader> and c
map("n", "<leader>c", "nohl<CR>")

-- Move around splits using Ctrl + {h, j, k, l}
map("n", "<C-h>", "<left>")
map("n", "<C-j>", "<down>")
map("n", "<C-k>", "<up>")
map("n", "<C-l>", "<right>")

-- Terminal
map("n", "ft", "<cmd>FloatermNew<CR>")
map("n", "fk", "<cmd>FloatermKill<CR>")

-- build-in LSP function
-- keyboard shortcut
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
map("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
