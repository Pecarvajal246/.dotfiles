local refactoring_status_ok, refactoring = pcall(require, "refactoring")
if not refactoring_status_ok then
	return
end

refactoring.setup({})

vim.keymap.set("n", "<leader>rc",refactoring.debug.cleanup, { noremap = true, silent = true, desc = "Clean Prints" })
vim.keymap.set("n", "<leader>rf",refactoring.debug.printf, { noremap = true, silent = true, desc = "Print Function" })
vim.keymap.set("n", "<leader>rv",refactoring.debug.print_var, { noremap = true, silent = true, desc = "Print Variable" })
vim.keymap.set("n", "<leader>rr", "<cmd>lua require'telescope'.extensions.refactoring.refactors()<cr>", { noremap = true, silent = true, desc = "Refactor" })

vim.keymap.set("v", "<leader>rr", "<cmd>lua require'telescope'.extensions.refactoring.refactors()<cr>", { noremap = true, silent = true, desc = "Refactor" })
vim.keymap.set("v", "<leader>rv",refactoring.debug.print_var, { noremap = true, silent = true, desc = "Print Variable" })
