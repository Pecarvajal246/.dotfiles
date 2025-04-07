return {
  "ThePrimeagen/harpoon",
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup({
      save_on_toggle = true,
    })
    vim.keymap.set("n", "<leader>H", require("harpoon.ui").toggle_quick_menu, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>A", require("harpoon.mark").add_file, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>h", require("harpoon.ui").nav_prev, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>l", require("harpoon.ui").nav_next, { noremap = true, silent = true })
  end,
}
