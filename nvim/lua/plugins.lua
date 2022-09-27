vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' ' -- Setup leader key


local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	execute 'packadd packer.nvim'
end

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'nvim-lua/popup.nvim'}
		},
	}

	--use 'mfussenegger/nvim-lint'

	use {

		'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		--'saadparwaiz1/cmp_luasnip'
	}

	----call hierarchy, navigation, bookmarks and filetree
	use {
		'ldelossa/litee.nvim',
		'ldelossa/litee-calltree.nvim',
		'ldelossa/litee-symboltree.nvim',
		'ldelossa/litee-filetree.nvim',
		'ldelossa/litee-bookmarks.nvim',
	}

	use {
		"mfussenegger/nvim-dap",
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
		"Pocco81/DAPInstall.nvim"
	}

	use {"p00f/clangd_extensions.nvim"}

	use {"ThePrimeagen/harpoon"}

	use { "nvim-telescope/telescope-file-browser.nvim" }

	use {
		"nvim-treesitter/nvim-treesitter",
		--run = ':TSUpdate',
	}

	use {'kyazdani42/nvim-tree.lua'}

	use { 'sindrets/diffview.nvim' }

	use { 'junegunn/fzf.vim' }

	----Colors
	--use 'bluz71/vim-moonfly-colors'

	use 'folke/tokyonight.nvim'

	--use "savq/melange"

	--use 'marko-cerovac/material.nvim'

	--use 'chriskempson/base16-vim'

	use {'vimwiki/vimwiki', branch = 'dev'}

	use 'christoomey/vim-tmux-navigator'

	use 'preservim/nerdcommenter'

	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	use 'windwp/nvim-autopairs'

	--use 'nvim-treesitter/playground'

	use 'neovim/nvim-lsp'

	use 'williamboman/mason.nvim'

	use "williamboman/mason-lspconfig.nvim"

	use "jose-elias-alvarez/null-ls.nvim" -- for formatters, linters and fixers(maybe)

	----use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}

	use 'L3MON4D3/LuaSnip'

	use 'norcalli/nvim-colorizer.lua'

	use 'nvim-lua/lsp-status.nvim'

end)
