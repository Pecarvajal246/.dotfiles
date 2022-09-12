local treesitter_status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status_ok then
	return
end
treesitter.setup({
	ensure_installed = {
		"python",
		"lua",
		"vim",
		"json",
		"yaml",
		"toml",
		"regex",
		"html",
		"css",
		"javascript",
		"bash",
		"norg",
		"http",
	},
	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = {
			"#7aa2f7",
			"#bb9af7",
			"#7dcfff",
			"#9ece6a",
			"#e0af68",
			"#ff9e64",
			"#f7768e",
		}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	endwise = {
		enable = true,
	},
	textsubjects = {
		enable = true,
		prev_selection = ",", -- (Optional) keymap to select the previous selection
		keymaps = {
			["."] = "textsubjects-smart",
			[";"] = "textsubjects-container-outer",
			["i;"] = "textsubjects-container-inner",
		},
	},
	-- indent = {
	--   enable = true,
	--   disable = {"python"}
	-- }
})
