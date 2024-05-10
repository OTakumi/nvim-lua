--------------------------------------
-- color scheme
--------------------------------------

vim.cmd([[
	try
		colorscheme tokyonight-night
	catch /^Vim\%((\a\+)\)\=:E815/
		colorscheme default
		set background=dark
	endtry
]])
