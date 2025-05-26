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
					local current_year = tonumber(os.date("%Y", now))
					local current_month = tonumber(os.date("%m", now))
					local current_day = tonumber(os.date("%d", now))

					local first_day_of_month_ts = os.time({ year = current_year, month = current_month, day = 1 })
					local first_day_weekday = tonumber(os.date("%w", first_day_of_month_ts))
					local first_friday_day = 1 + (5 - first_day_weekday + 7) % 7
					local third_friday_day = first_friday_day + 14

					local target_year
					local target_month
					local target_friday_day

					if current_day > third_friday_day then
						local next_month = current_month + 1
						local next_year = current_year
						if next_month > 12 then
							next_month = 1
							next_year = next_year + 1
						end
						local first_day_of_next_month_ts = os.time({ year = next_year, month = next_month, day = 1 })
						local first_day_next_month_weekday = tonumber(os.date("%w", first_day_of_next_month_ts))
						target_friday_day = 1 + (5 - first_day_next_month_weekday + 7) % 7
						target_year = next_year
						target_month = next_month
					else
						target_friday_day = third_friday_day
						target_year = current_year
						target_month = current_month
					end
					local target_friday_ts =
						os.time({ year = target_year, month = target_month, day = target_friday_day })
					return "Demo " .. os.date("%B %-d, %Y", target_friday_ts)
				end,
				demo_date = function()
					local now = os.time()
					local current_year = tonumber(os.date("%Y", now))
					local current_month = tonumber(os.date("%m", now))
					local current_day = tonumber(os.date("%d", now))

					-- Get the timestamp for the first day of the current month
					local first_day_of_month_ts = os.time({ year = current_year, month = current_month, day = 1 })
					-- Get the weekday of the first day (0=Sunday, 6=Saturday)
					local first_day_weekday = tonumber(os.date("%w", first_day_of_month_ts))

					-- Calculate the day of the month for the first, second, and third Fridays
					-- Formula: 1 + (target_weekday - first_day_weekday + 7) % 7
					-- Target weekday for Friday is 5.
					local first_friday_day = 1 + (5 - first_day_weekday + 7) % 7
					local second_friday_day = first_friday_day + 7
					local third_friday_day = first_friday_day + 14

					local target_year
					local target_month
					local target_friday_day

					-- Check if the current day is after the third Friday
					if current_day > third_friday_day then
						-- Calculate next month's details
						local next_month = current_month + 1
						local next_year = current_year
						if next_month > 12 then
							next_month = 1
							next_year = next_year + 1
						end

						-- Get the timestamp for the first day of the next month
						local first_day_of_next_month_ts = os.time({ year = next_year, month = next_month, day = 1 })
						-- Get the weekday of the first day of the next month
						local first_day_next_month_weekday = tonumber(os.date("%w", first_day_of_next_month_ts))

						-- Calculate the day of the month for the first Friday of the next month
						target_friday_day = 1 + (5 - first_day_next_month_weekday + 7) % 7
						target_year = next_year
						target_month = next_month
					else
						-- Use existing logic for current month:
						-- If the current day is on or before the second Friday, use the first Friday.
						-- Otherwise, use the third Friday.
						if current_day <= second_friday_day then
							target_friday_day = first_friday_day
						else
							target_friday_day = third_friday_day
						end
						target_year = current_year
						target_month = current_month
					end

					-- Create a timestamp for the target Friday
					local target_friday_ts =
						os.time({ year = target_year, month = target_month, day = target_friday_day })

					-- Format the date string
					return "Demo " .. os.date("%B %-d, %Y", target_friday_ts)
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
