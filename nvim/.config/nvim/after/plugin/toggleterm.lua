local toggleterm_status_ok, toggleterm = pcall(require, "toggleterm")
if not toggleterm_status_ok then
	return
end
toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", "<cmd>ToggleTerm direction=float<cr>", opts)
	vim.api.nvim_buf_set_keymap(0, "t", "jk", "<cmd>ToggleTerm direction=float<cr>", opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

vim.keymap.set(
	"n",
	"<leader>tf",
	"<cmd>ToggleTerm direction=float<cr>",
	{ noremap = true, silent = true, desc = "Float Terminal" }
)
vim.keymap.set(
	"n",
	"<leader>th",
	"<cmd>ToggleTerm direction=horizontal<cr>",
	{ noremap = true, silent = true, desc = "Horizontal Terminal" }
)
vim.keymap.set(
	"n",
	"<leader>tv",
	"<cmd>ToggleTerm size=80 direction=vertical<cr>",
	{ noremap = true, silent = true, desc = "Vertical Terminal" }
)
