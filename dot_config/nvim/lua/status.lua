require("lualine").setup({
	options = {
		disabled_filetypes = { "NvimTree" },
		section_separators = "",
		component_separators = "",
	},
	sections = {
		lualine_a = { {
			"mode",
			fmt = function(str)
				return str:sub(1, 1)
			end,
		} },
		lualine_b = { "branch" },
		lualine_c = { { "filename", file_status = true, path = 1 } },
		lualine_x = {
			"lsp_progress",
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn", "info", "hint" },
				diagnostics_color = {
					-- Same values like general color option can be used here.
					error = "DiagnosticError", -- changes diagnostic's error color
					warn = "DiagnosticWarn", -- changes diagnostic's warn color
					info = "DiagnosticInfo", -- changes diagnostic's info color
					hint = "DiagnosticHint", -- changes diagnostic's hint color
				},
				symbols = { error = "E", warn = "W", info = "I", hint = "H" },
				colored = true, -- displays diagnostics status in color if set to true
				update_in_insert = false, -- Update diagnostics in insert mode
				always_visible = false, -- Show diagnostics even if count is 0, boolean or function returning boolean
			},
		},
		lualine_y = { "progress" },
		lualine_z = { "filetype" },
	},
	inactive_sections = {
		lualine_c = { { "filename", path = 1 } },
	},
})
