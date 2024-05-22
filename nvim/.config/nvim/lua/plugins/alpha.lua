return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		local function button(sc, txt, keybind, keybind_opts)
			local b = dashboard.button(sc, txt, keybind, keybind_opts)
			b.opts.hl = "Function"
			b.opts.hl_shortcut = "Type"
			return b
		end

		local function footer()
			local datetime = os.date("%d-%m-%Y  %H:%M:%S")
			return datetime
		end

		dashboard.section.header.val = {
			[[                               __                ]],
			[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
			[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
			[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
			[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
			[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],

			-- [[                                                     ]],
			-- [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
			-- [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
			-- [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
			-- [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
			-- [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
			-- [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
			-- [[                                                     ]],
			--
			--
		}
		dashboard.section.header.opts.hl = "Identifier"--[[ pick_color() ]]

		dashboard.section.buttons.val = {
			button("SPC f h", "  Recently opened files"),
			button("SPC f f", "  Find file"),
			button("SPC f s", "  Open session"),
			button("SPC c n", "  New file"),
			button("q", "  Quit", "<Cmd>qa<CR>"),
		}

		dashboard.section.footer.val = footer()
		dashboard.section.footer.opts.hl = "Identifier"
		return dashboard
	end,
	config = function(_, dashboard)
		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				once = true,
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		require("alpha").setup(dashboard.opts)
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local v = vim.version()
				local dev = ""
				if v.prerelease == "dev" then
					dev = "-dev+" .. v.build
				else
					dev = ""
				end
				local version = v.major .. "." .. v.minor .. "." .. v.patch .. dev
				local stats = require("lazy").stats()
				local plugins_count = stats.loaded .. "/" .. stats.count
				local ms = math.floor(stats.startuptime + 0.5)
				local time = vim.fn.strftime("%H:%M:%S")
				local date = vim.fn.strftime("%d.%m.%Y")
				local line1 = " " .. plugins_count .. " plugins loaded in " .. ms .. "ms"
				local line2 = "󰃭 " .. date .. "  " .. time
				local line3 = " " .. version

				local line1_width = vim.fn.strdisplaywidth(line1)
				local line2Padded = string.rep(" ", (line1_width - vim.fn.strdisplaywidth(line2)) / 2) .. line2
				local line3Padded = string.rep(" ", (line1_width - vim.fn.strdisplaywidth(line3)) / 2) .. line3

				dashboard.section.footer.val = {
					line1,
					line2Padded,
					line3Padded,
				}
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
		vim.cmd([[
augroup alpha_tabline
  au!
  au FileType alpha set showtabline=0 | au BufUnload <buffer> set showtabline=2
augroup END
]])
	end,
}
