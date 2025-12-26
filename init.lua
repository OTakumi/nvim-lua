vim.loader.enable()

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")
require("core/options")
require("core/colorscheme")

local filetype_conf = require("core/filetype")

vim.api.nvim_create_augroup("vimrc_augroup", {})
vim.api.nvim_create_autocmd("FileType", {
  group = "vimrc_augroup",
  pattern = "*",
  callback = function(args)
    filetype_conf[args.match]()
  end,
})

--- keymaps ---
-- Common keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set("", "<up>", "<nop>", opts)
vim.keymap.set("", "<down>", "<nop>", opts)
vim.keymap.set("", "<left>", "<nop>", opts)
vim.keymap.set("", "<right>", "<nop>", opts)

-- Turn off search highlights
vim.keymap.set("n", "<leader>c", "<cmd>nohlsearch<CR>", opts)

-- Moving between split windows
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
