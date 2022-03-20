require'nvim-treesitter.configs'.setup {
	ensure_installed =  {
		"c",
		"lua",
		"cpp",
		"html",
		"bash",
		"rust",
	},  -- one of "all", "maintained" (parsers with maintainers), or a list of languages

	highlight = {
		enable = true,              -- false will disable the whole extension
	},

	indent = {
		enable = true,
	},
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

