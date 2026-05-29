return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>F",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = true,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = {  "prettierd", "prettier", stop_after_first = true },
			typescript = {  "prettierd", "prettier", stop_after_first = true },
			markdown = {  "prettierd", "prettier", stop_after_first = true },
			yaml = {  "prettierd", "prettier", stop_after_first = true },
			sql = { "sql_formatter" },
			["*"]= { "injected"}
		},
		formatters = {
			-- Set the options field
			injected = {
				-- Set individual option values
				options = {
					-- Set individual option values
					ignore_errors = true,
					lang_to_formatters = {
						sql = { "sql_formatter" },
					},
				},
			},
			sql_formatter = {
				append_args = { "-l", "postgresql" },
			},
		},
	},
}
