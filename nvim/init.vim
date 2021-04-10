let mapleader = " "
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'preservim/nerdcommenter'
Plug 'ThePrimeagen/vim-be-good'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Plug 'michal-h21/vim-zettel'
" Plug 'mattn/calendar-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' } " Use Vimwiki
" Plug 'jiangmiao/auto-pairs'
" Plug 'airblade/vim-rooter'
Plug 'nvim-treesitter/nvim-treesitter',{'do': ':TSUpdate'}
" Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'nvim-treesitter/playground'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
" Plug 'pseewald/anyfold'
" Plug 'neovim/nvim-lsp'
call plug#end()
" Sourcing the files 
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/plug-config/vimwiki.vim
" source $HOME/.config/nvim/plug-config/calendar.vim
" source $HOME/.config/nvim/plug-config/airline_theme.vim
source $HOME/.config/nvim/plug-config/coc-config.vim
source $HOME/.config/nvim/plug-config/nerdcommenter.vim
source $HOME/.config/nvim/plug-config/nerdtree.vim
" source $HOME/.config/nvim/plug-config/telescope.vim
source $HOME/.config/nvim/plug-config/my_startify_config.vim
source $HOME/.config/nvim/plug-config/fzf.vim
" source $HOME/.config/nvim/plug-config/rooter.vim
source $HOME/.config/nvim/plug-config/rainbow_parentheses.vim
luafile $HOME/.config/nvim/lua/plug-colorizer.lua
" luafile $HOME/.config/nvim/lua/nvim-treesitter-setup.lua
" source $HOME/.config/nvim/plug-config/nvim-treesitter-setup.vim
" luafile $HOME/.config/nvim/plug-config/treesitter.lua
" source $HOME/.config/nvim/plug-config/nvimlsp.vim
