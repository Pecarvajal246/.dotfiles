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
		notify_on_error = false,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = {  "prettierd", "prettier", stop_after_first = true },
			markdown = {  "prettierd", "prettier", stop_after_first = true },
		},
	},
}
