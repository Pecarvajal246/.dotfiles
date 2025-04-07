return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-treesitter/nvim-treesitter" },
	},
	config = function()
		local refactoring = require("refactoring")
		refactoring.setup({})
		vim.keymap.set(
			"n",
			"<leader>rc",
			refactoring.debug.cleanup,
			{ noremap = true, silent = true, desc = "Clean Prints" }
		)
		vim.keymap.set(
			{"n", "x"},
			"<leader>rv",
			refactoring.debug.print_var,
			{ noremap = true, silent = true, desc = "Print Variable" }
		)
		vim.keymap.set(
			{ "n", "x" },
			"<leader>rr",
			function()
				refactoring.select_refactor({prefer_ex_cmd = true})
			end,
			{ noremap = true, silent = true, desc = "Refactor" }
		)
	end,
}
