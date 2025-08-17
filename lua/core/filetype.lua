-- Change tab settings according to file type
-- default settings are tab size 4, expand tab is false

local M = {}

local function set_indent(tab_size, expand_tab)
  if expand_tab then
    vim.bo.expandtab = false
  else
    vim.bo.expandtab = true
  end

  vim.bo.shiftwidth = tab_size
  vim.bo.tabstop = tab_size
  vim.bo.softtabstop = tab_size
end

M.python = function()
  set_indent(4, false)
end

M.lua = function()
  set_indent(2, false)
end

M.typescript = function()
  set_indent(2, false)
end

M.javascript = function()
  set_indent(2, false)
end

M.typescriptreact = function()
  set_indent(2, false)
end

M.javascriptreact = function()
  set_indent(2, false)
end

M.html = function()
  set_indent(2, false)
end

M.css = function()
  set_indent(2, false)
end

M.json = function()
  set_indent(2, false)
end

M.yaml = function()
  set_indent(2, false)
end

M.tf = function()
  set_indent(2, false)
end

return setmetatable(M, {
  __index = function()
    return function()
      set_indent(4, false)
    end
  end,
})
