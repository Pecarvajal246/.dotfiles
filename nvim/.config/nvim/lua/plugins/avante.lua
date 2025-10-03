return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	opts = {
		-- provider = "copilot"
		-- providers = {
		-- 	gemini = {
		-- 		model = "gemini-2.5-flash-preview-05-20",
		-- 	},
		-- },
		provider = "gemini-cli",
		{
			acp_providers = {
				["gemini-cli"] = {
					command = "gemini",
					args = { "--experimental-acp" },
					env = {
						NODE_NO_WARNINGS = "1",
						GEMINI_API_KEY = os.getenv("GEMINI_API_KEY"),
					},
				},
			},
		},
	},
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "Avante" },
			},
			ft = { "Avante" },
		},
	},
}
