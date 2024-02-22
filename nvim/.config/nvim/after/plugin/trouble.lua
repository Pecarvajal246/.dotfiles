local trouble_status_ok, trouble = pcall(require, "trouble")
if not trouble_status_ok then
	return
end

trouble.setup()
-- Lua
vim.keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end, { noremap = true, silent = true, desc = "Toggle Trouble" })
vim.keymap.set("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end, { noremap = true, silent = true, desc = "Workspace Diagnostics" })
vim.keymap.set("n", "<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end, { noremap = true, silent = true, desc = "Document Diagnostics" })
vim.keymap.set("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end, { noremap = true, silent = true, desc = "Quickfix List" })
vim.keymap.set("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end, { noremap = true, silent = true, desc = "Loc List" })
vim.keymap.set("n", "gR", function()
	require("trouble").toggle("lsp_references")
end, { noremap = true, silent = true, desc = "LSP References" })
