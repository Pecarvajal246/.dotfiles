local neorg_status_ok, neorg = pcall(require, "neorg")
if not neorg_status_ok then
	return
end
neorg.setup({
	-- Tell Neorg what modules to load
	load = {
		["core.defaults"] = {}, -- Load all the default modules
		-- ["core.keybindings"] = {
		-- 	config = {
		-- 		default_keybindings = true,
		-- 		neorg_leader = " ",
		-- 	},
		-- },
		["core.concealer"] = {}, -- Allows for use of icons
		["core.completion"] = {
			config = {
				engine = "nvim-cmp", -- We current support nvim-compe and nvim-cmp only
			},
		},
		["core.dirman"] = { -- Manage your directories with Neorg
			config = {
				default_workspace = "work",
				workspaces = {
					neorg = "~/neorg/home",
					work = "~/neorg/work",
				},
			},
		},
		["core.summary"] = {},
	},
})
