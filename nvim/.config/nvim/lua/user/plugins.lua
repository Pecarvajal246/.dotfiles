local fn = vim.fn

-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install your plugins here
require('lazy').setup({
	-- "wbthomason/packer.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"windwp/nvim-autopairs",
	"numToStr/Comment.nvim",
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- We'd like this plugin to load first out of the rest
        config = true, -- This automatically runs `require("luarocks-nvim").setup()`
    },
    {
        "nvim-neorg/neorg",
        dependencies = { "luarocks.nvim" },
    },
	"folke/which-key.nvim",
	-- "nmac427/guess-indent.nvim",
	"akinsho/toggleterm.nvim",
	"stevearc/dressing.nvim",
		"zbirenbaum/copilot.lua",

	-- git
	"lewis6991/gitsigns.nvim",
	"TimUntersberger/neogit",
	"sindrets/diffview.nvim",

	-- LSP
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies= {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
		},
	},
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	},
	"folke/trouble.nvim",
	"ray-x/lsp_signature.nvim",
	"j-hui/fidget.nvim",

	-- Formatting & linting
	"stevearc/conform.nvim",
	"mfussenegger/nvim-lint",

	-- Completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	-- "hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",

	-- Telescope
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"AckslD/nvim-neoclip.lua",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"cljoly/telescope-repo.nvim",
	"ghassan0/telescope-glyph.nvim",
	{ "kevinhwang91/nvim-bqf", ft = "qf" },

	-- File explorer
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-tree.lua",
		},
	},
	-- Debugging and testing
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	-- Themes
	"folke/tokyonight.nvim",

	-- Dashboard
	"goolord/alpha-nvim",

	-- Lualine and bufferline
	"nvim-lualine/lualine.nvim",
	"kyazdani42/nvim-web-devicons",
	"akinsho/bufferline.nvim",

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"m-demare/hlargs.nvim",
	"HiPhish/rainbow-delimiters.nvim",
	"nvim-treesitter/nvim-treesitter-context",
})
