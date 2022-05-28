local indent_blankline_status_ok, indent_blinkline = pcall(require, "indent_blankline")
if not indent_blankline_status_ok then
  return
end

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#bb9af7 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#7dcfff gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#e0af68 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#7aa2f7 gui=nocombine]]

indent_blinkline.setup {
    space_char_blankline = " ",
    -- use_treesitter = true,
    show_current_context = true,
    show_current_context_start = true,
    context_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
    },
    filetype_exclude = {'alpha'}
}

