set mouse=a
set number relativenumber
set scrolloff=7
set nohlsearch
set ignorecase
set list
set listchars=tab:>\ ,trail:-
set termguicolors
set autochdir
set updatetime=500
set fileformat=unix
set undofile
set cursorline
set hidden
set smartindent
set tabstop=2 shiftwidth=2 expandtab

call plug#begin('~/.local/share/nvim/plugged')

" Misc
Plug 'lewis6991/impatient.nvim'
Plug 'nathom/filetype.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'
Plug 'ggandor/lightspeed.nvim'
Plug 'nvim-neorg/neorg'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'folke/which-key.nvim'
Plug 'nmac427/guess-indent.nvim'
Plug 'mvllow/modes.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'stevearc/dressing.nvim'

" git
Plug 'lewis6991/gitsigns.nvim'
Plug 'TimUntersberger/neogit'

" LSP
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'folke/trouble.nvim'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'mattn/emmet-vim'

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

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-ts-autotag'
Plug 'RRethy/nvim-treesitter-endwise'

call plug#end()

lua require('impatient')

doautocmd User PlugLoaded

let mapleader = " "
nmap cp :let @* = expand("%:p:h")<cr>
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
" autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
" autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
