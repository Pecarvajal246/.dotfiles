return {
	"stevearc/dressing.nvim",
	{ "sindrets/diffview.nvim", config = true },

	-- Debugging and testing
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
}
