local which_key_status_ok, which_key = pcall(require, "which-key")
if not which_key_status_ok then
  return
end

which_key.setup {
  plugins = {
    presets = {
      operators = true,
    },
  },
}
local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  f = {
    name = "file",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope oldfiles<cr>", "Open File History"},
    b = { "<cmd>Telescope file_browser<cr>", "Open File Browser"},
    c = { "<cmd>Telescope neoclip<cr>", "Open Clipboard"},
    k = { "<cmd>Telescope keymaps<cr>", "Open Keymaps"},
  },
  t = {
    name = "Terminal",
    -- n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    -- u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    -- t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    -- p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
  l = {"<cmd>BufferLineCycleNext<cr>", "Cycle Next Buffer"},
  h = {"<cmd>BufferLineCyclePrev<cr>", "Cycle Previous Buffer"},
  bd = {"<cmd>bd<cr>", "Delete Buffer"},
  gb = {"<cmd>BufferLinePick<cr>", "Go To Buffer"},
}
which_key.register (mappings, opts)
