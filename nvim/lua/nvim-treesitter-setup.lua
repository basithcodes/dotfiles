require'nvim-treesitter.configs'.setup {
		--ensure_installed = "maintained",
		highlight = {
			enable = true,              -- false will disable the whole extension
		},

		indent = {
			enable = true,
		},
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

