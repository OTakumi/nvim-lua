vim.api.nvim_exec ('language en_US.utf8', true)
vim.api.nvim_exec ('language message en_US.utf8', true)

local options = {
	encoding = "utf-8",
	fileencoding = "utf-8",
	title = true,
	backup = false,
	clipboard = "unnamed",
	autoindent = true,
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	colorcolumn = '80',
	termguicolors = true,
	number = true,
	list = true,
	ignorecase = true,
	smartcase = true,
	wrapscan = true,
	hlsearch = true,
	incsearch = true,
	inccommand = 'split',
	cursorcolumn = true
}

vim.opt.shortmess:append("c")
for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.listchars = {
	space = '_',
	tab = '>-'
}
