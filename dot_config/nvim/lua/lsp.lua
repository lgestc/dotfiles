local nvim_lsp = require("lspconfig")
require("lsp_signature").setup({
	hint_enable = false,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lsp = vim.lsp
local handlers = lsp.handlers

vim.diagnostic.config({ virtual_text = false })

-- Hover doc popup
local pop_opts = { border = "rounded", max_width = 80 }
handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)

-- Autoformat
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				vim.lsp.buf.formatting_sync()
			end,
		})
	end
end

nvim_lsp.cssls.setup({
	capabilities = capabilities,
})

-- typescript ls
nvim_lsp.tsserver.setup({
	capabilities = capabilities,
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
})

nvim_lsp.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

local null_ls = require("null-ls")
local b = null_ls.builtins

-- to update or install dependencies:
-- npm install -g @fsouza/prettierd stylelint postcss postcss-scss typescript-language-server typescript vscode-langservers-extracted eslint_d

local style_sources = require('lsp/css')

null_ls.setup({
	sources = vim.tbl_extend("force", {
		b.code_actions.gitsigns,
		b.formatting.terraform_fmt,
		b.formatting.stylua,
		b.code_actions.eslint_d,
		b.diagnostics.eslint_d.with({
			extra_args = {
				"--rule",
				"import/no-extraneous-dependencies: warn",
			},
		}),
	}, style_sources),
	on_attach = on_attach,
})
