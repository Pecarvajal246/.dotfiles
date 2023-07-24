local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
--
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("ggandor/lightspeed.nvim")
	use("nvim-neorg/neorg")
	use("folke/which-key.nvim")
	use("nmac427/guess-indent.nvim")
	use("akinsho/toggleterm.nvim")
	use("stevearc/dressing.nvim")
	use({
		"zbirenbaum/copilot.lua",
		-- cmd = "Copilot",
		-- event = "InsertEnter",
		-- config = function()
		-- 	require("copilot").setup({
		-- 		suggestion = {
		-- 			enabled = true,
		-- 			auto_trigger = true,
		-- 			debounce = 75,
		-- 			keymap = {
		-- 				accept = "<C-CR>",
		-- 				accept_word = false,
		-- 				accept_line = false,
		-- 				next = "<M-]>",
		-- 				prev = "<M-[>",
		-- 				dismiss = "<C-]>",
		-- 			},
		-- 		},
		-- 		-- cmp = {
		-- 		-- 	enabled = true,
		-- 		-- 	method = "getPanelCompletions",
		-- 		-- },
		-- 	})
		-- end,
	})

	-- git
	use("lewis6991/gitsigns.nvim")
	use("TimUntersberger/neogit")
	use("sindrets/diffview.nvim")

	-- LSP
	use({
		"williamboman/mason-lspconfig.nvim",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
		},
	})
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	use("folke/trouble.nvim")
	use("ray-x/lsp_signature.nvim")
	use("j-hui/fidget.nvim")

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	-- use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip")

	-- Telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("AckslD/nvim-neoclip.lua")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("cljoly/telescope-repo.nvim")
	use("ghassan0/telescope-glyph.nvim")

	-- Debugging and testing
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- Themes
	use("folke/tokyonight.nvim")

	-- Dashboard
	use("goolord/alpha-nvim")

	-- Lualine and bufferline
	use("nvim-lualine/lualine.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("akinsho/bufferline.nvim")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("m-demare/hlargs.nvim")
	use("HiPhish/rainbow-delimiters.nvim")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
