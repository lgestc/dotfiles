local conf = require("nvim-treesitter.configs")

conf.setup({
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	indent = {
		enable = false,
	},
})

require("nvim-treesitter.configs").setup({
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["gnf"] = "@function.outer",
				["gnc"] = "@class.outer",
			},
			goto_next_end = {
				["gfe"] = "@function.outer",
				["gce"] = "@class.outer",
			},
			goto_previous_start = {
				["gfs"] = "@function.outer",
				["gcs"] = "@class.outer",
			},
		},
	},
})
