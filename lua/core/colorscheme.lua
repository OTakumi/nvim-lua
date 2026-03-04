--------------------------------------
-- color scheme
--------------------------------------

vim.cmd([[
	try
		colorscheme terafox
	catch /^Vim\%((\a\+)\)\=:E815/
		colorscheme default
		set background=dark
	endtry
]])
