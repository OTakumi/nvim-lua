--------------------------------------
-- color scheme
--------------------------------------

vim.cmd([[
	try
		colorscheme catppuccin-macchiato
	catch /^Vim\%((\a\+)\)\=:E815/
		colorscheme default
		set background=dark
	endtry
]])
