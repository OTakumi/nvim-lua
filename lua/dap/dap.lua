require('dap/csharp')
local dap = require("dap")

require("mason-nvim-dap").setup({
		automatic_setup = true,
		ensure_installed = {
			'cppdbg',
			'coreclr',
			'codelldb',
			'node2',
			'chrome',
			'dart',
		}
	}
)

-- C#
dap.adapters.coreclr = {
	type = 'executable',
	command = DOTNET_DEBUGGER_LOCATION .. "\\netcoredbg",
	args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input('Path to DLL > ', vim.fn.getcwd() .. '\\bin\\Debug', 'file')
		end,
	},
}

