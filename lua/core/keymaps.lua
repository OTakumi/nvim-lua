-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
	local options = { noremap=true, silent=true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ','

-----------------------------------------------------------
-- shortcuts
-----------------------------------------------------------
-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', 'nohl<CR>')

-- Move around splits using Ctrl + {h, j, k, l}
map('n', '<C-h>', '<left>')
map('n', '<C-j>', '<down>')
map('n', '<C-k>', '<up>')
map('n', '<C-l>', '<right>')

