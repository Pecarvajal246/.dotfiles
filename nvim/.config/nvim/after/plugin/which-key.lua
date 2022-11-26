local which_key_status_ok, which_key = pcall(require, "which-key")
if not which_key_status_ok then
	return
end

which_key.setup({
	plugins = {
		presets = {
			operators = true,
		},
	},
})

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	b = {
		name = "buffers",
		d = { "<cmd>bd<cr>", "Delete Buffer" },
		l = { "<cmd>Telescope buffers<cr>", "List all buffers" },
	},
	p = {
		name = "Plugins",
		u = { "<cmd>PackerUpdate<cr>", "Update Plugins" },
	},
	t = {
		name = "Terminal",
		-- n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		-- u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		-- t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		-- p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
	g = {
		name = "Go to",
		b = { "<cmd>BufferLinePick<cr>", "Go To Buffer" },
		g = { "<cmd>Neogit<cr>", "Go To Git" },
	},
	l = { "<cmd>BufferLineCycleNext<cr>", "Cycle Next Buffer" },
	h = { "<cmd>BufferLineCyclePrev<cr>", "Cycle Previous Buffer" },
	-- gr = {"<cmd>TroubleToggle lsp_references<cr>", "Open References List"},
}

local v_opts = {
	mode = "v", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local v_mappings = {}
which_key.register(mappings, opts)
which_key.register(v_mappings, v_opts)
