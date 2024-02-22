mason_tool_installer_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
if not mason_tool_installer_ok then
	return
end

mason_tool_installer.setup({
	ensure_installed = { "stylua", "black", "prettierd", "yamllint" },
	auto_update = true,
})
