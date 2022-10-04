local refactoring_status_ok, refactoring = pcall(require, "refactoring")
local which_key_status_ok, which_key = pcall(require, "which-key")
if not refactoring_status_ok or not which_key_status_ok then
	return
end

refactoring.setup({})

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	r = {
		name = "Refactoring",
		c = { refactoring.debug.cleanup, "Clean prints" },
		f = { refactoring.debug.printf, "Print function" },
		v = { ":lua require('refactoring').debug.print_var({ normal = true })<CR>", "Print variable" },
	},
}

which_key.register(mappings, opts)

local v_opts = {
	mode = "v", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}


local v_mappings = {
	r = {
		name = "Refactoring",
		r = { ":lua require'telescope'.extensions.refactoring.refactors()<cr>", "Refactor" },
		v = { refactoring.debug.print_var, "Print variable" },
	},
}

which_key.register(v_mappings, v_opts)
