require('mason').setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

require('mason-lspconfig').setup({
	ensure_installed = {
		"sumneko_lua",
		"rust_analyzer",
		"omnisharp",
		"clangd",
		"cmake",
		"dockerls",
	}
})

require('mason-lspconfig').setup_handlers({
	function(server)
		local opt = {
			capabilities = require('cmp_nvim_lsp').default_capabilities(
				vim.lsp.protocol.make_client_capabilities()
			)
		}

		require('lspconfig')[server].setup(opt)
	end,

	["rust_analyzer"] = function ()
		require("rust-tools").setup {
			tools = {
				executor = require("rust-tools/executors").termopen,
				reload_workspace_from_cargo_toml = true,
			}
		}
	end,
	
	["sumneko_lua"] = function ()
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" }
				}
			}
		}
	end,
})

-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)
-- Reference highlight
vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]]
