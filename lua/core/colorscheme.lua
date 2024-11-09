--------------------------------------
-- color scheme
--------------------------------------

vim.cmd([[
	try
		colorscheme catppuccin-mocha
	catch /^Vim\%((\a\+)\)\=:E815/
		colorscheme default
		set background=dark
	endtry
]])
