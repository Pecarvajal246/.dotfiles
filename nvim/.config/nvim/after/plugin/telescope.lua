local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end
local actions = require("telescope.actions")

telescope.setup({
	pickers = {
		find_files = {
			hidden = false,
		},
	},
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})

telescope.load_extension("neoclip")
telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("repo")
telescope.load_extension("possession")
telescope.load_extension("refactoring")
