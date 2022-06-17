vim.api.nvim_create_autocmd("CursorHold", {
	pattern = "*",
	callback = function()
		vim.diagnostic.open_float(nil, { source = "always", focus = false })
	end,
	desc = "Open diagnostics",
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	pattern = "*",
	callback = function()
		vim.cmd([[silent! :checktime]])
	end,
	desc = "Sync file changes",
})

vim.api.nvim_create_autocmd({ "TextChanged", "FocusLost", "BufEnter", "InsertLeave" }, {
	pattern = "*",
	callback = function()
		vim.cmd([[silent! :update]])
	end,
	desc = "Autosave",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 300, on_visual = true, on_macro = true })
	end,
	desc = "Highlight yanked text",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "plugins.lua",
	callback = function()
		vim.cmd([[so <afile> | :PackerCompile]])
	end,
	desc = "Packer user config",
})
