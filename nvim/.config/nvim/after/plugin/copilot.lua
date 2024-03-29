local copilot_ok, copilot = pcall(require, "copilot")
if not copilot_ok then
	return
end

copilot.setup({
	 suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<C-CR>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = true
  },
	-- cmp = {
	-- 	enabled = true,
	-- 	method = "getPanelCompletions",
	-- },
})
