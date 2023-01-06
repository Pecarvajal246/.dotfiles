local telescope_status_ok, telescope = pcall(require, "telescope")
local which_key_status_ok, which_key = pcall(require, "which-key")
if not telescope_status_ok or not which_key_status_ok then
	return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

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
				["<A-h>"] = "which_key",
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "ignore_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		repo = {
			list = {
				search_dirs = { "~/Documents", "~/python_scripts", "~/Work" },
			},
			cached_list = {
				file_ignore_patterns = { "/%.cache/", "/%.cargo/", "/%.dotfiles", "/%.local/" },
			},
		},
	},
})

telescope.load_extension("neoclip")
telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("repo")
telescope.load_extension("refactoring")
telescope.load_extension("glyph")

function SearchDotfiles()
	builtin.find_files({
		prompt_title = "Dotfiles",
		hidden = true,
		cwd = "~/.config",
		search_dirs = { "mpv", "mpd", "qtile", "streamlink", "twofi", "sxhkd", "rofi", "kitty" },
	})
end

function SearchConfigfiles()
	builtin.find_files({
		prompt_title = "Config files",
		hidden = true,
		cwd = "~/.config",
		search_dirs = { "nvim" },
	})
end

function SearchNotes()
	builtin.find_files({
		prompt_title = "Notes",
		theme = themes.get_dropdown(),
		cwd = "~/neorg",
	})
end

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
		c = { SearchConfigfiles, "Config Files" },
		d = { SearchDotfiles, "Dot Files" },
		f = { builtin.find_files, "Find File" },
		g = { builtin.git_files, "Find Git Files" },
		h = { builtin.oldfiles, "File History" },
		n = { SearchNotes, "Notes" },
		p = {
			"<cmd>Telescope repo cached_list<cr>",
			"Projects",
		},
	},
	s = {
		name = "Search",
		c = { "<cmd>Telescope neoclip<cr>", "Search Clipboard" },
		f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search current buffer" },
		g = { "<cmd>Telescope live_grep<cr>", "Grep search" },
		k = { "<cmd>Telescope keymaps<cr>", "Search Keymaps" },
		w = { "<cmd>Telescope grep_string<cr>", "Search word under cursor" },
	},
}

which_key.register(mappings, opts)
