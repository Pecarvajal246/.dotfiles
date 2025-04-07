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
			template = "Daily.md",
		},
		ui = {
			enable = false,
		},
		note_id_func = function(title)
			return title
		end,
		templates = {
			folder = "Templates/nvim",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			substitutions = {
				demo_title = function()
					local now = os.time()
					local day = os.date("%w", now)
					local diff = (5 - day) % 7
					local next_friday = now + (diff + 7) * 24 * 60 * 60
					return "Demo " .. os.date("%B %-d, %Y", next_friday)
				end,
				demo_date = function()
					local now = os.time()
					local day = os.date("%w", now)
					local diff = (5 - day) % 7
					local next_friday = now + (diff + 7) * 24 * 60 * 60
					return os.date("%Y-%m-%d", next_friday)
				end,
				daily_title = function()
					return os.date("%B %-d, %Y")
				end,
			},
		},
	},
	keys = {
		{ "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Obsidian new note" },
		{ "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Obsidian new daily note" },
		{ "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "Obsidian yesterday note" },
		{ "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Obsidian new template" },
		{ "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Obsidian backlinks" },
		{ "<leader>ol", "<cmd>ObsidianLinkNew<cr>", mode = "v", desc = "Obsidian link new" },
	},
}
