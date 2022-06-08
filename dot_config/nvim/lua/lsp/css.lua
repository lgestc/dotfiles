local b = require("null-ls").builtins;

local js_filetypes = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"vue",
	"svelte",
	"html",
	"json",
	"yaml",
	"markdown",
	"graphql",
}

local has_stylelint = function(utils)
	return utils.root_has_file(".stylelintrc.json")
end

local no_stylelint = function(utils)
	return false == utils.root_has_file(".stylelintrc.json")
end

return {
	b.formatting.stylelint.with({
		condition = has_stylelint,
	}),
	b.diagnostics.stylelint.with({
		condition = has_stylelint,
	}),
	b.formatting.prettierd.with({
		condition = has_stylelint,
		filetypes = js_filetypes,
	}),
	b.formatting.prettierd.with({
		condition = no_stylelint,
		filetypes = vim.tbl_extend("force", {
			"css",
			"scss",
			"less",
		}, js_filetypes),
	}),
}


