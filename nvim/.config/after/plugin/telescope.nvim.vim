lua<<EOF
require('telescope').load_extension('neoclip')
require("telescope").load_extension "file_browser"
EOF
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>lr <cmd>Telescope lsp_references<cr>
nnoremap <leader>yl <cmd>Telescope neoclip<cr>
nnoremap <leader>fh <cmd>Telescope oldfiles<cr>
