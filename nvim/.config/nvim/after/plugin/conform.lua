local conform_status_ok, conform = pcall(require, "conform")
if not conform_status_ok then
	return
end

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier" } },
	},
})
