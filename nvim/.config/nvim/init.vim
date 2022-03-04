"Paste with Ctrl-V and middle click mouse in windows 10
set mouse=a

" set guifont=CaskaydiaCove\ NF:h14
set encoding=utf-8
set number relativenumber
set scrolloff=7
set backspace=indent,eol,start
set nohlsearch
set list
set listchars=tab:>\ ,trail:-
set termguicolors
set autochdir
set updatetime=500
set fileformat=unix
" set autoindent
" set smartindent
" augroup Indentation
"     autocmd!
"     autocmd FileType html set shiftwidth=2 softtabstop=2 expandtab
" augroup END

call plug#begin('~/.local/share/nvim/plugged')
" LSP
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'jose-elias-alvarez/null-ls.nvim'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'saadparwaiz1/cmp_luasnip'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'AckslD/nvim-neoclip.lua'

"Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui'

"Themes
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
source ~/.config/nvim/after/themes/tokyonight.vim

"Dashboard
Plug 'goolord/alpha-nvim'

"Lualine and bufferline
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

"Misc
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'numToStr/Comment.nvim'
Plug 'ggandor/lightspeed.nvim'
Plug 'nvim-neorg/neorg'
" Plug 'Darazaki/indent-o-matic'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tpope/vim-sleuth'

call plug#end()

doautocmd User PlugLoaded

let mapleader = " "
nmap cp :let @* = expand("%:p:h")<cr>
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
