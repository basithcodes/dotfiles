--Window Specific Options

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.wrap = false
vim.wo.colorcolumn = '100'

-- Buffer Specific Options
-- vim.bo.expandtab = true

-- Vim global options
local options = {
termguicolors = true,
shortmess = vim.o.shortmess .. 'c',
clipboard = 'unnamedplus',
mouse = 'a',
scrolloff = 8,
--background = 'dark',
hls = false,
hidden = true,
smarttab = true,
ignorecase = true,
shiftwidth = 2,
softtabstop = 2,
tabstop = 2,
autoindent = true,
autochdir = true,
filetype = 'on',
--moonflyCursorColor = 1,
--moonflyNormalFloat = 1,
--formatoptions:append('**'),
lazyredraw = true,
}

for option, value in pairs(options) do
	vim.opt[option] = value
end

vim.cmd([[
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→,nbsp:␣
set showbreak=↪\
"set list listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set path+=**
]])

vim.cmd "set whichwrap+=<,>[,],h,l" -- wrap to next line when there is nothing at the end

-- Commands
vim.api.nvim_command([[
" Automatically change the current directory
autocmd BufEnter * silent! lcd %:p:h
]])

--vim.g.material_style = "deep ocean"

--colorscheme settings
--vim.g.tokyonight_style = "day"
vim.g.tokyonight_style = "night"

require("lualine").setup {
	options = {
		--lualine configs
		theme = 'tokyonight'
		--lualine configs
	}
}

vim.cmd([[
"colorscheme moonfly
"colorscheme melange
colorscheme tokyonight
" colorscheme base16-bright
" colorscheme base16-atelier-forest-light
]])

