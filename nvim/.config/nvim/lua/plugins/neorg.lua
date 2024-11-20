return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- We'd like this plugin to load first out of the rest
		config = true, -- This automatically runs `require("luarocks-nvim").setup()`
	},
	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim" },
		opts = {
			-- Tell Neorg what modules to load
			load = {
				["core.defaults"] = {}, -- Load all the default modules
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
		},
	},
}
