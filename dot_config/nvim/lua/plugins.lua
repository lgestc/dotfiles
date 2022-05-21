local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd("packadd packer.nvim")
end

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- Lsp
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use("jose-elias-alvarez/null-ls.nvim")
	use("arkav/lualine-lsp-progress")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			plugins,
		},
	})
	use({
		"ray-x/lsp_signature.nvim",
	})

	-- Editing
	use("windwp/nvim-autopairs")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("tpope/vim-surround") -- (o_o) -> ca([ -> [o_o]
	use({ -- Add matching HTML tag
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})

	use("navarasu/onedark.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-live-grep-raw.nvim" } },
	})
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use({
		"AckslD/nvim-neoclip.lua",
		config = function()
			require("neoclip").setup()
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v1.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			-- See ":help neo-tree-highlights" for a list of available highlight groups
			vim.cmd([[
        hi link NeoTreeDirectoryName Directory
        hi link NeoTreeDirectoryIcon NeoTreeDirectoryName
      ]])

			require("neo-tree").setup({
				popup_border_style = "rounded",
				enable_git_status = true,
				enable_diagnostics = true,
				filesystem = {
					filters = { --These filters are applied to both browsing and searching
						show_hidden = true,
						respect_gitignore = true,
					},
					follow_current_file = false, -- This will find and focus the file in the
					-- active buffer every time the current file is changed while the tree is open.
					use_libuv_file_watcher = true, -- This will use the OS level file watchers
					-- to detect changes instead of relying on nvim autocmd events.
					window = {
						position = "left",
						mappings = {
							["<2-LeftMouse>"] = "open",
							["<cr>"] = "open",
							["o"] = "open",
							["S"] = "open_split",
							["s"] = "open_vsplit",
							["C"] = "close_node",
							["<bs>"] = "navigate_up",
							["."] = "set_root",
							["H"] = "toggle_hidden",
							["I"] = "toggle_gitignore",
							["R"] = "refresh",
							["/"] = "filter_as_you_type",
							--["/"] = "none" -- Assigning a key to "none" will remove the default mapping
							["f"] = "filter_on_submit",
							["<c-x>"] = "clear_filter",
							["a"] = "add",
							["d"] = "delete",
							["r"] = "rename",
							["c"] = "copy_to_clipboard",
							["x"] = "cut_to_clipboard",
							["p"] = "paste_from_clipboard",
						},
					},
				},
			})
			vim.cmd([[nnoremap \ :NeoTreeReveal<cr>]])
		end,
	})

	--[[ use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	}) ]]
end)
