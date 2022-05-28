local guess_indent_status_ok, guess_indent = pcall(require, "guess-indent")
if not guess_indent_status_ok then
  return
end
guess_indent.setup {
  auto_cmd = true,  -- Set to false to disable automatic execution
  filetype_exclude = {  -- A list of filetypes for which the auto command gets disabled
    "netrw",
    "tutor",
    "",
  },
  buftype_exclude = {  -- A list of buffer types for which the auto command gets disabled
    "help",
    "nofile",
    "terminal",
    "prompt",
  },
}
