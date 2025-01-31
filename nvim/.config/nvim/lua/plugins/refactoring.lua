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
			"n",
			"<leader>rv",
			refactoring.debug.print_var,
			{ noremap = true, silent = true, desc = "Print Variable" }
		)
		vim.keymap.set(
			{ "n", "x" },
			"<leader>rr",
			-- "<cmd>lua require'telescope'.extensions.refactoring.refactors()<cr>",
			function()
				require("refactoring").select_refactor()
			end,
			{ noremap = true, silent = true, desc = "Refactor" }
		)

		vim.keymap.set(
			"v",
			"<leader>rv",
			refactoring.debug.print_var,
			{ noremap = true, silent = true, desc = "Print Variable" }
		)
	end,
}
