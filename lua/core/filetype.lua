local M = {}

local function set_indent(tab_length)
	vim.bo.shiftwidth	= tab_length
	vim.bo.softtabstop	= tab_length
	vim.bo.tabstop		= tab_length
end

M.c = function()
	set_indent(4)
end

M.python = function()
	set_indent(4)
end

M.rs = function()
	set_indent(4)
end

M.go = function()
	set_indent(4)
end

M.cs = function()
	set_indent(4)
end

M.html = function()
	set_indent(2)
end

M.css = function()
	set_indent(2)
end

M.scss = function()
	set_indent(2)
end

M.sass = function()
	set_indent(2)
end

M.js = function()
	set_indent(2)
end

M.ts = function()
	set_indent(2, false)
end

M.jsx = function()
	set_indent(2, false)
end

M.tsx = function()
	set_indent(2, false)
end

M.lua = function()
	set_indent(4, false)
end

return setmetatable(M, {
	__index = function()
		return function()
			print('Unexpected filetype')
			set_indent(2, false)
		end
	end
})
