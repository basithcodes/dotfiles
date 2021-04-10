" To stop Rooter echoing the project directory:
let g:rooter_silent_chdir = 1

" To specify the root has a certain directory as an ancestor (useful for
" excluding directories), prefix it with `^`:
" let g:rooter_patterns = ['^java_udemy', '^owaisClass','^Projects', '^Challenges']

"To specify the root is a certain directory, prefix it with =.
let g:rooter_patterns = ['=java_udemy','=owaisClass','=Projects','=src']

" let g:rooter_patterns = ['>Projects', '>Challenges']
" use lcd(for current window working directory) instead of cd(for all directory) 
let g:rooter_cd_cmd = 'lcd'

" Directories, c and java files(rooter targets)
" let g:rooter_targets = '/,*.java, *.c'

" Change to file's directory (similar to 'autochdir').
let g:rooter_change_directory_for_non_project_files = 'current'


