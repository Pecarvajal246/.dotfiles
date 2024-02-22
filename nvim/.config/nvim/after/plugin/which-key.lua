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
	},
	f = {
		name = "Files",
	},
	g = {
		name = "Go to",
		b = { "<cmd>BufferLinePick<cr>", "Go To Buffer" },
	},
	t = {
		name = "Terminal",
	},
	l = { "<cmd>BufferLineCycleNext<cr>", "Cycle Next Buffer" },
	h = { "<cmd>BufferLineCyclePrev<cr>", "Cycle Previous Buffer" },
	-- gr = {"<cmd>TroubleToggle lsp_references<cr>", "Open References List"},
	p = {
		name = "Plugins",
		u = { "<cmd>PackerUpdate<cr>", "Update Plugins" },
	},
  x = {
    name = "Trouble",
  },
	r = {
		name = "Refactoring",
	},
	s = {
		name = "Search",
		s = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Search and replace word under cursor" },
	},
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
