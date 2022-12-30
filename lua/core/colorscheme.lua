--------------------------------------
-- color scheme
--------------------------------------

vim.cmd [[
	try
		colorscheme molokai
	catch /^Vim\%((\a\+)\)\=:E815/
		colorscheme default
		set background=dark
	endtry
]]
