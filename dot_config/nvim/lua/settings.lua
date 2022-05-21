require("telescope").setup({
	defaults = {
		layout_strategy = "vertical",
		cache_picker = {
			num_pickers = 10,
			limit_entries = 100,
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
		},
	},
})
require("telescope").load_extension("neoclip")
require("telescope").load_extension("ui-select")

require("onedark").setup({
	style = "warm", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = true, -- Show/hide background
})

local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g

--[[ g.bufferline = {
	closable = false,
} ]]

o.updatetime = 400
o.undofile = true

o.tabstop = 2
o.shiftwidth = 2
o.autoindent = true
o.wrap = false

o.foldmethod = "manual"
o.foldlevel = 20

vim.cmd([[colorscheme onedark]])

-- global options
o.swapfile = true
o.autoread = true
o.splitbelow = true
o.splitright = true
o.foldcolumn = "1"
o.mouse = "a"
o.dir = "/tmp"
o.smartcase = true
o.laststatus = 2
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
o.clipboard = "unnamedplus"
o.expandtab = true
o.termguicolors = true
o.autoread = true
o.cursorline = true
o.hlsearch = false
o.signcolumn = "yes"

o.number = true -- Show line numbers

o.linebreak = true -- Stop words being broken on wrap
o.numberwidth = 3 -- Make the gutter wider by default
