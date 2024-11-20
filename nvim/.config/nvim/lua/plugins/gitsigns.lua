return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end
			map("n", "<leader>gp", gs.prev_hunk, { desc = "[G]o to [P]revious Hunk" })
			map("n", "<leader>gn", gs.next_hunk, { desc = "[G]o to [N]ext Hunk" })
			-- Actions
			map("n", "<leader>Hs", gs.stage_hunk, { desc = "Hunk Stage" })
			map("n", "<leader>Hr", gs.reset_hunk, { desc = "Hunk Reset" })
			map("v", "<leader>Hs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Hunk Stage" })
			map("v", "<leader>hr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Hunk Reset" })
			map("n", "<leader>Hu", gs.undo_stage_hunk, { desc = "Hunk Undo Stage" })
			map("n", "<leader>Hp", gs.preview_hunk, { desc = "[P]review [H]unk" })
			map("n", "<leader>Hb", function()
				gs.blame_line({ full = true })
			end, { desc = "Hunk Blame" })
			map("n", "<leader>Tb", gs.toggle_current_line_blame, { desc = "Toggle Blame" })
			map("n", "<leader>Td", gs.toggle_deleted, { desc = "Toggle Deleted" })
		end,
	},
}
