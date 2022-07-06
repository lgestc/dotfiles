local map = vim.api.nvim_set_keymap

options = { noremap = true }
silent_noremap = { noremap = true, silent = true }

-- map the leader key
map("n", ",", "", {})
vim.g.mapleader = "," -- 'vim.g' sets global variables
-- map S to :w
map("n", "S", "<cmd>:w<cr>", options)

map("n", "<Leader>p", "<cmd>Telescope find_files<cr>", options)
map("n", "<Leader>b", "<cmd>Telescope buffers<cr>", options)
map("n", "<Leader>f", [[<cmd>lua require("telescope").extensions.live_grep_args.live_grep_raw()<cr>]], options)
-- Show recent yanks
map("n", "<Leader>gc", [[<cmd>Telescope neoclip<cr>]], options)
-- Show git status
map("n", "<Leader>gg", [[<cmd>Telescope git_status<cr>]], options)
-- Show 5 last pickers and allow revisiting them
map("n", "<Leader>gh", [[<cmd>Telescope pickers<cr>]], options)

-- Code actions
map("n", "<Leader>ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", options)
map("v", "<Leader>ga", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", options)

custom_hover = function()
	vim.lsp.buf.hover()
	vim.lsp.buf.hover()
end

map("n", "K", "<cmd>lua custom_hover()<cr>", options)
map("n", "R", "<cmd>lua vim.lsp.buf.rename()<cr>", options)

-- Show diagnostic using Telescope
map("n", "<Leader>xd", "<cmd>Telescope diagnostics bufnr=0<cr>", options)
map("n", "<Leader>xw", "<cmd>Telescope diagnostics<cr>", options)
map("n", "<Leader>gd", "<cmd>Telescope lsp_definitions<cr>", options)
map("n", "<Leader>gr", "<cmd>Telescope lsp_references<cr>", options)

-- Close buffer
map("n", "<Leader>w", "<cmd>bp|bd #<cr>", silent_noremap)
map("n", "<Leader>W", "<cmd>bufdo! bd<cr>", silent_noremap)

-- Prevent paste register from being cleared on visual replacement
vim.cmd([[
  xnoremap <expr> p 'pgv"'.v:register.'y`>'
  xnoremap <expr> P 'Pgv"'.v:register.'y`>'
]])

vim.api.nvim_create_user_command("CopyFilePath", function(args)
	vim.cmd([[:let @+ = expand("%") | echo "Copied file path to clipboard"]], options)
end, {
	nargs = "*",
	desc = "",
})

vim.api.nvim_create_user_command("EditSnippets", function(args)
	vim.cmd([[:edit ~/.config/nvim/lua/snippets/main.lua]], options)
end, {
	nargs = "*",
	desc = "",
})

vim.api.nvim_create_user_command("ReloadSnippets", function(args)
	vim.cmd([[:luafile ~/.config/nvim/lua/snippets/main.lua]], options)
end, {
	nargs = "*",
	desc = "",
})

-- file tree
map("n", "<Leader>e", "<cmd>NnnPicker %:p:h<cr>", options)
