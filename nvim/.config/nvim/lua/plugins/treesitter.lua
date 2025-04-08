return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { "OXY2DEV/markview.nvim" },
		opts = {
			ensure_installed = {
				"python",
				"lua",
				"vim",
				"json",
				"yaml",
				"toml",
				"regex",
				"html",
				"css",
				"javascript",
				"bash",
				"http",
				"sql",
				"ruby",
				"dart",
				"markdown",
				"markdown_inline",
				"solidity",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
				disable = { "python" },
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"m-demare/hlargs.nvim",
		opts = {
			color = "#ef9062",
			highlight = {},
			excluded_filetypes = {},
			-- disable = function(lang, bufnr) -- If changed, `excluded_filetypes` will be ignored
			-- 	return vim.tbl_contains(opts.excluded_filetypes, lang)
			-- end,
			paint_arg_declarations = true,
			paint_arg_usages = true,
			hl_priority = 10000,
			excluded_argnames = {
				declarations = {},
				usages = {
					python = { "self", "cls" },
					lua = { "self" },
				},
			},
			performance = {
				parse_delay = 1,
				slow_parse_delay = 50,
				max_iterations = 400,
				max_concurrent_partial_parses = 30,
				debounce = {
					partial_parse = 3,
					partial_insert_mode = 100,
					total_parse = 700,
					slow_parse = 5000,
				},
			},
		},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")
			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
				},
				query = {
					[""] = "rainbow-delimiters",
				},
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			}
		end,
	},
	"nvim-treesitter/nvim-treesitter-context",
}
