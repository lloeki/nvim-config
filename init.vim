"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

source ~/.config/nvim/plugged.vim

" Security measure
set modelines=0
let g:secure_modelines_leave_modeline=1
let g:secure_modelines_verbose=1

" OS clipboard integration
set clipboard^=unnamed

" Terminal title
set title
set t_ts=]6;
set t_fs=
if !exists("autocmd_terminal_title")
  let autocmd_terminal_title = 1
  autocmd BufEnter,BufRead * let &titlestring = "file://" . hostname() . expand("%:p")
endif

" Airline
let g:airline_theme='raven'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.whitespace = ''

" Mouse
set mouse=n
if has("mouse_sgr")
  set ttymouse=sgr
end

" Theme
set background=light
"let g:nofrils_strbackgrounds=0
"colorscheme nofrils-light

" Appearance tweaks
"hide vsp background
hi VertSplit term=NONE cterm=NONE gui=NONE ctermbg=NONE
set fillchars+=vert:│

" Linters
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:go_fmt_command = "goimports"

" Ignore some files
set wildignore+=*.o,*.obj
set wildignore+=.git,.svn
set wildignore+=,*.pyc,env,venv*
set wildignore+=node_modules
set wildignore+=pkg
set wildignore+=vendor

" Search tweaks
set ignorecase      "ignore case when searching
set smartcase       "... but be nice when actually typing caps

" Invisibles
set listchars=eol:¬,tab:→\ ,nbsp:•,trail:·,extends:>,precedes:<
set list

" Tabbing settings
set shiftwidth=4            "indent size
set shiftround              "round indent to next offset
set tabstop=4               "size of tab character
set expandtab               "insert spaces instead of tab
set softtabstop=4           "... and that much spaces are inserted

" Buffer management
set swb=usetab      "make :sb <filename> go to tabs too

" SuperTab options
let g:SuperTabDefaultCompletionType = "context"
" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=10

" Key mappings
let mapleader = ','

" Useful panels
nmap <leader>c :call ToggleQuickfixList()<CR>
nmap <leader>l :call ToggleLocationList()<CR>

nmap <F1> :nohlsearch<CR>
nmap <F5> :set number!<CR>
nmap <F6> :set list!<CR>
inoremap <F5> <C-O>:set number!<CR>
inoremap <F6> <C-O>:set list!<CR>

" Diff before save
nmap <leader>d :w !diff -u % -<CR>

" Zen mode
nmap <leader>z :set nolist<CR>:Goyo<CR>

" Code navigation
map <leader>t :Sexplore<CR>
map <leader>b :Buffers<CR>
map <leader>r :Tags<CR>
map <leader>p :Files<CR>

" Terminal remap for non-US keyboard
"tnoremap <C-b> <C-\>

" Unimpaired remap for non-US keyboard
"nmap ( [
"nmap ) ]
"omap ( [
"omap ) ]
"xmap ( [
"xmap ) ]

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

" Filetype/language specific settings
augroup vimrc
  autocmd! *                             " clear for reload
  autocmd FileType make                  setl noexpandtab
  autocmd FileType ruby                  setl softtabstop=2 shiftwidth=2
  autocmd FileType eruby                 setl softtabstop=2 shiftwidth=2
  autocmd FileType coffee                setl softtabstop=4 shiftwidth=4
  autocmd BufRead,BufNewFile Guardfile   setf ruby
  autocmd BufRead,BufNewFile *.skim      setf slim
  autocmd BufRead,BufNewFile *.opal      setf ruby
  autocmd FileType go                    setl nolist
  autocmd! BufNewFile,BufRead crontab.* setl nobackup | setl nowritebackup   " Fix for crontab -e
augroup END

" Go tools path
let g:go_bin_path = expand('~') .. "/.local/libexec/go/bin"

if expand('%:t') =~? 'rfc\d\+' || expand('%:t') =~? 'draft-.*-\d\{2,}'
  setfiletype rfc
  setl textwidth=72
endif
