vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.completeopt = 'menuone,noselect'
vim.wo.signcolumn = 'yes'
vim.o.mouse = "a"
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff=7
vim.o.hlsearch = false
vim.o.undofile = true
vim.o.cursorline = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.guifont = "Iosevka"
vim.o.conceallevel = 3
vim.o.list = true
vim.opt.listchars = {tab = '▸ ', trail = '·'}
vim.o.termguicolors = true
vim.o.autochdir = true
vim.o.clipboard = 'unnamedplus'

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- update time
vim.o.updatetime=250
vim.o.timeout=true
vim.o.timeoutlen=300


-- fold
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99

-- yank highlight
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
