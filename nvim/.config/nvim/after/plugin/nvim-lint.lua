nvim_lint_ok, nvim_lint = pcall(require, "lint")
if not nvim_lint_ok then
	return
end

nvim_lint.linters_by_ft = {
	yaml = { "yamllint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
