return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-file-browser.nvim",
		"AckslD/nvim-neoclip.lua",
		"cljoly/telescope-repo.nvim",
		"ghassan0/telescope-glyph.nvim",
		{ "kevinhwang91/nvim-bqf", ft = "qf" },
	},
	config = function()
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		local themes = require("telescope.themes")
		local telescope = require("telescope")

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
						["<C-Down>"] = actions.cycle_history_next,
						["<C-Up>"] = actions.cycle_history_prev,
					},
				},
				cache_picker = {
					num_pickers = 3,
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
				search_dirs = {
					"mpv",
					"mpd",
					"qtile",
					"streamlink",
					"twofi",
					"sxhkd",
					"rofi",
					"kitty",
					"beets",
					"wezterm",
				},
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
			builtin.find_files(themes.get_dropdown({
				prompt_title = "Notes",
				cwd = "~/neorg",
				previewer = false,
			}))
		end

		vim.keymap.set(
			"n",
			"<leader>fb",
			"<cmd>Telescope file_browser<cr>",
			{ noremap = true, silent = true, desc = "File Browser" }
		)
		vim.keymap.set("n", "<leader>fc", SearchConfigfiles, { noremap = true, silent = true, desc = "Config Files" })
		vim.keymap.set("n", "<leader>fd", SearchDotfiles, { noremap = true, silent = true, desc = "Dot Files" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true, desc = "Find Files" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { noremap = true, silent = true, desc = "Find Git Files" })
		vim.keymap.set("n", "<leader>fh", builtin.oldfiles, { noremap = true, silent = true, desc = "File History" })
		vim.keymap.set("n", "<leader>fn", SearchNotes, { noremap = true, silent = true, desc = "Notes" })
		vim.keymap.set("n", "<leader>fr", builtin.resume, { noremap = true, silent = true, desc = "Resume Search" })
		vim.keymap.set("n", "<leader>fp", builtin.pickers, { noremap = true, silent = true, desc = "Pickers" })
		vim.keymap.set(
			"n",
			"<leader>fP",
			"<cmd>Telescope repo cached_list<cr>",
			{ noremap = true, silent = true, desc = "Projects" }
		)

		vim.keymap.set(
			"n",
			"<leader>sc",
			"<cmd>Telescope neoclip<cr>",
			{ noremap = true, silent = true, desc = "Search Clipboard" }
		)
		vim.keymap.set(
			"n",
			"<leader>sb",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			{ noremap = true, silent = true, desc = "Search Current Buffer" }
		)
		vim.keymap.set(
			"n",
			"<leader>sg",
			"<cmd>Telescope live_grep<cr>",
			{ noremap = true, silent = true, desc = "Grep Search" }
		)
		vim.keymap.set(
			"n",
			"<leader>sk",
			"<cmd>Telescope keymaps<cr>",
			{ noremap = true, silent = true, desc = "Search Keymaps" }
		)
		vim.keymap.set(
			"n",
			"<leader>sw",
			"<cmd>Telescope grep_string<cr>",
			{ noremap = true, silent = true, desc = "Search Word Under Cursor" }
		)

			vim.keymap.set(
				"n",
				"<leader>bl",
				"<cmd>Telescope buffers<cr>",
				{ noremap = true, silent = true, desc = "List Buffers" }
			)
	end,
}
