-- Themes
return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({})
		require("user.colorscheme")
	end,
}
