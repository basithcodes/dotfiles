" 
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ ]
" Taking care of empty buffers(i guess)
"let g:startify_session_delete_buffers = 1

" Keep sessions in this directory
let g:startify_session_dir = '~/.config/nvim/sessions'

" sticking to root directory(i guess)
let g:startify_change_to_vcs_root = 1

" Automatically update sessions
let g:startify_session_persistence = 1

" Get rid of empty buffer and quit
let g:startify_enable_special = 0

" Bookmarks
let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ { 'd': '~/.config/dwm/config.h' },
            \ '~/Coding/c_programming',
            \ '~/Coding/kernel_programming',
            \ '~/Coding/system_programming',
            \ ]
