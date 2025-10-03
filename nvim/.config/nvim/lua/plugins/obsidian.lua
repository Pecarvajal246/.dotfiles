local function get_next_friday_timestamp()
	local now = os.time()
	-- In Lua, %w is day of week, Sun=0, Mon=1, ..., Fri=5, Sat=6
	local current_weekday = tonumber(os.date("%w", now))

	-- Calculate days to add to get to the next Friday.
	-- If today is Friday, days_to_add will be 0.
	local days_to_add = (5 - current_weekday + 7) % 7

	-- Add the calculated number of days in seconds to the current time
	local next_friday_timestamp = now + (days_to_add * 24 * 60 * 60)

	return next_friday_timestamp
end

return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependancies = {
		"saghen/blink.cmp",
	},
	opts = {
		legacy_commands = false,
		completion = {
			nvim_cmp = false,
			blink = true,
		},
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
					return "Demo " .. os.date("%B %-d, %Y", get_next_friday_timestamp())
				end,
				demo_date = function()
					return os.date("%Y-%m-%d", get_next_friday_timestamp())
				end,
				daily_title = function()
					return os.date("%B %-d, %Y")
				end,
			},
		},
	},
	keys = {
		{ "<leader>on", "<cmd>Obsidian new<cr>", desc = "Obsidian new note" },
		{ "<leader>od", "<cmd>Obsidian today<cr>", desc = "Obsidian new daily note" },
		{ "<leader>oy", "<cmd>Obsidian yesterday<cr>", desc = "Obsidian yesterday note" },
		{ "<leader>ot", "<cmd>Obsidian template<cr>", desc = "Obsidian new template" },
		{ "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Obsidian backlinks" },
		{ "<leader>ol", "<cmd>Obsidian link<cr>", mode = "v", desc = "Obsidian link new" },
	},
}
