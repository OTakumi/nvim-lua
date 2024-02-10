require('core/keymaps')
require('core/options')
require('core/filetype')
require('core/colorscheme')
require('plugins/plugins')
require('plugins/cmp-config')
require('mason/mason')
require('plugins/nvim-tree')
require('dap/dap')
require('core/lualine')


local my_filetype = require('core.filetype')

vim.api.nvim_create_augroup('vimrc_augroup', {})
vim.api.nvim_create_autocmd('FileType', {
	group = 'vimrc_augroup',
	pattern = '*',
	callback = function(args) my_filetype[args.match]() end
})
