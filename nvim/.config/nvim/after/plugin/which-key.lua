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
	f = {
		name = "files",
		b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
		c = { "<cmd>lua require('telescope.builtin').find_files{cwd='~/.config/nvim'}<cr>", "Config files" },
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		g = { "<cmd>Telescope git_files<cr>", "Find Git Files" },
		h = { "<cmd>Telescope oldfiles<cr>", "File History" },
		p = {
			"<cmd>:lua require'telescope'.extensions.repo.list{search_dirs = {'~/Documents', '~/python_scripts'}}<cr>",
			"Projects",
		},
		s = { "<cmd>:Telescope possession list<cr>", "Sessions" },
	},
	p = {
		name = "Plugins",
		u = { "<cmd>PackerUpdate<cr>", "Update Plugins" },
	},
	s = {
		name = "Search",
		c = { "<cmd>Telescope neoclip<cr>", "Search Clipboard" },
		f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search current buffer" },
		k = { "<cmd>Telescope keymaps<cr>", "Search Keymaps" },
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
	bd = { "<cmd>bd<cr>", "Delete Buffer" },
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

local v_mappings = {
}
which_key.register(mappings, opts)
which_key.register(v_mappings, v_opts)
