return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	opts = {
		workspaces = {
			{
				name = "notes",
				path = "~/Notes",
			},
		},
		daily_notes = {
			-- Optional, if you keep daily notes in a separate directory.
			folder = "work/dailies",
			-- Optional, if you want to change the date format for the ID of daily notes.
			date_format = "/%Y/%m/%Y-%m-%d",
			-- Optional, if you want to change the date format of the default alias of daily notes.
			alias_format = "%B %-d, %Y",
			-- Optional, default tags to add to each new daily note created.
			default_tags = { "daily-notes" },
			-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			template = nil,
		},
		ui = {
			enable = false,
		},
		note_id_func = function(title)
			return title
		end,
	},
	keys = {
		{ "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Obsidian new note" },
		{ "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Obsidian new daily note" },
		{ "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "Obsidian yesterday note" },
	},
}
