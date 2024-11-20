return {
	"folke/which-key.nvim",
	config = function()
		require("which-key").add({
      { "<leader>b", group = "Buffers" },
      { "<leader>f", group = "Files" },
      { "<leader>g", group = "Go to" },
      { "<leader>H", group = "Hunks" },
      { "<leader>r", group = "Refactor" },
			{ "<leader>s", group = "Search" },
      { "<leader>t", group = "Terminal" },
      { "<leader>T", group = "Toggle" },
		})
	end,
}
