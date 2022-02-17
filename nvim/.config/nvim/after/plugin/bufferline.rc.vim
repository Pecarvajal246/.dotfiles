lua << EOF
require("bufferline").setup{
options = {
  separator_style = "padded_slant",
  diagnostics = "nvim_lsp",
  diagnostics_indicator = function(count, level)
    local icon = level:match("error") and " " or " "
    return "" .. icon .. count
  end
  }}
EOF

nnoremap <silent><leader>l :BufferLineCycleNext<CR>
nnoremap <silent><leader>h :BufferLineCyclePrev<CR>
nnoremap <silent><leader>bd :bd<CR>
nnoremap <silent><leader>gb :BufferLinePick<CR>
