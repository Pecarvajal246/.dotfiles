local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local which_key_status_ok, which_key = pcall(require, "which-key")
if not which_key_status_ok then
	return
end

require("dap-python").setup("~/.venvs/debugpy/bin/python")
require("nvim-dap-virtual-text").setup()
local dapui = require("dapui")
dapui.setup()

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}


local mappings = {
	d = {
		name = "Debug",
		t = { dapui.toggle, "Close UI" },
		b = { dap.toggle_breakpoint, "Breakpoint" },
	},
}

which_key.register(mappings, opts)

local bufopts = { noremap = true, silent = true }
vim.keymap.set("n", "<F5>", dap.continue, bufopts)
vim.keymap.set("n", "<F10>", dap.step_over, bufopts)
vim.keymap.set("n", "<F11>", dap.step_into, bufopts)
vim.keymap.set("n", "<F12>", dap.step_out, bufopts)
