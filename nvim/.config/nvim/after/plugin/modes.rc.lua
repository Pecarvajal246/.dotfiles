local modes_status_ok, modes = pcall(require, "modes")
if not modes_status_ok then
  return
end

modes.setup{
    colors = {
    copy = "#f5c359",
    delete = "#c75c6a",
    insert = "#78ccc5",
    visual = "#9745be",
  },

  -- Cursorline highlight opacity
  line_opacity = 0.1,

  -- Highlight cursor
  set_cursor = true,

  -- Highlight in active window only
  focus_only = false
}

-- Exposed highlight groups, useful for themes
vim.cmd('hi ModesCopy guibg=#f5c359')
vim.cmd('hi ModesDelete guibg=#c75c6a')
vim.cmd('hi ModesInsert guibg=#78ccc5')
vim.cmd('hi ModesVisual guibg=#9745be')
