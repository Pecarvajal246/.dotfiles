local which_key_status_ok, which_key = pcall(require, "which-key")
if not which_key_status_ok then
	return
end
local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<cr>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
		["<cr>"] = { "<Plug>RestNvim", "Run request under cursor" },
		["<c-enter>"] = { "<Plug>RestNvimLast", "Run previous request"}
}
which_key.register(mappings, opts)
