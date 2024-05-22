return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local neogit = require("neogit")
		neogit.setup{}

		vim.keymap.set("n", "<leader>gg", function()
			neogit.open()
		end, { noremap = true, silent = true, desc = "Open Neogit" })
	end,
}
