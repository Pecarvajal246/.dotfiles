return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	opts = {
		preview = {
			icon_provider = "devicons", -- "mini" or "devicons"
			enable = true,
			filetypes = { "markdown" },
			ignore_buftypes = { "nofile" },
			ignore_previews = {},
			modes = { "i", "n", "no", "c" },
			debounce = 50,
			draw_range = { vim.o.columns, vim.o.columns },
			edit_range = { 0, 0 },
			callbacks = {},
			splitview_winopts = { split = "left" },
			linewise_hyrbid_mode = true,
			hybrid_modes = { "i", "n", "no", "c" },
		},
	},
}
