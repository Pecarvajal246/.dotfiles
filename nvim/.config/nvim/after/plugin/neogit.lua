local neogit_status_ok, neogit = pcall(require, "neogit")
if not neogit_status_ok then
	return
end

neogit.setup()

vim.keymap.set("n", "<leader>gg", function()
	neogit.open()
end, { noremap = true, silent = true, desc = "Open Neogit" })
