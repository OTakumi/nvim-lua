--------------------------------------
-- color scheme
--------------------------------------

vim.cmd([[
	try
		colorscheme tokyonight
	catch /^Vim\%((\a\+)\)\=:E815/
		colorscheme default
		set background=dark
	endtry
]])
