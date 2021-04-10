cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
syntax enable
syntax on
if (has("termguicolors"))
	set termguicolors
	hi LineNr ctermbg=NONE guibg=NONE
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1     " True gui colors in terminal
set colorcolumn=80 
set t_Co=256                          " Support 256 colors
let base16colorspace=256              " Access colors present in 256 colorspace
" colorscheme base16-synth-midnight-dark
colorscheme nvcode 
" colorscheme base16-atelier-cave-light
" colorscheme base16-gruvbox-dark-hard
" colorscheme torte
"
autocmd BufEnter * silent! lcd %:p:h    " Automatically change the current directory
map <F6> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>lcd $VIM_DIR<CR>
set signcolumn=yes
set nohlsearch
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set scrolloff=8
set encoding=utf-8                      " The encoding displayed
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number relativenumber               " Hybrid line numbering
set showtabline=2                       " Always show tabs
set updatetime=300                      " Faster completion
set timeoutlen=1000                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set path+=**
filetype plugin on
" highlight Normal guibg=none
set autoread | au CursorHold * checktime        " Auto reload file
let g:airline#extensions#whitespace#enabled = 0
nnoremap <Leader>n :NERDTreeToggle<CR>
" autocmd Filetype vimwiki inoremap <leader>nw *<CR><ESC>!!date<CR>A*<ESC>kJxA<CR><CR>
" au FileType c,cpp,objc,objcpp call rainbow#load()
set cindent 
set list lcs=tab:\┆\ 
" set list
" set foldmethod=syntax
" filetype plugin indent on " required
" autocmd Filetype c AnyFoldActivate " activate for a specific filetype
