local copilot_ok, copilot = pcall(require, "copilot.lua")
if not copilot_ok then
	return
end

copilot.setup({
	cmp = {
		enabled = true,
		method = "getPanelCompletions",
	},
})
