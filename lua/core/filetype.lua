local M = {}

local function set_indent(tab_length, is_hard_tab)
	if is_hard_tab then
		vim.bo.expandtab = false
	else
		vim.bo.expandtab = true
	end

	vim.bo.shiftwidth	= tab_length
	vim.bo.softtabstop	= tab_length
	vim.bo.tabstop		= tab_length
end

M.python = function()
	set_indent(4, true)
end

M.rs = function()
	set_indent(4, true)
end

M.go = function()
	set_indent(4, true)
end

M.cs = function()
	set_indent(4, true)
end

M.html = function()
	set_indent(2, true)
end

M.css = function()
	set_indent(2, true)
end

M.scss = function()
	set_indent(2, true)
end

M.sass = function()
	set_indent(2, true)
end

M.javascript = function()
	set_indent(2, true)
end

M.typescript = function()
	set_indent(2, true)
end

M.lua = function()
	set_indent(4, true)
end

return setmetatable(M, {
	__index = function()
		return function()
			print('Unexpected filetype')
			set_indent(2, false)
		end
	end
})
