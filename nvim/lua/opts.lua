--Window Specific Options
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.wrap = false
vim.wo.colorcolumn = '100'

-- Buffer Specific Options
-- vim.bo.expandtab = true

-- Vim global options
vim.o.termguicolors = true
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.clipboard = 'unnamedplus'
vim.o.mouse = 'a'
vim.o.scrolloff = 8
vim.o.background = 'dark'
vim.o.hls = false
vim.o.hidden = true
vim.o.smarttab = true
vim.o.ignorecase = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.autoindent = true
vim.o.autochdir = true
vim.o.filetype = 'on'
vim.g.nvim_system_wide = true
vim.g.moonflyCursorColor = 1
vim.g.moonflyNormalFloat = 1
--vim.opt.formatoptions:append('**')
vim.opt.lazyredraw = true
--vim.g.completeopt = "menu,menuone,noselect"


vim.cmd([[
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→,nbsp:␣
set showbreak=↪\
"set list listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set path+=**
]])

-- Commands
vim.api.nvim_command([[
" Automatically change the current directory
autocmd BufEnter * silent! lcd %:p:h
]])


--vim.g.material_style = "deep ocean"
vim.cmd([[
colorscheme moonfly
" colorscheme morning
" colorscheme material
 " highlight clear SignColumn
 " highlight clear CursorLineNr
 " highlight clear SignColumn
 " highlight clear LineNr
]])

