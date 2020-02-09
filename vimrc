"----------------------------------------------------------
" Features
"
" avoid unexpected things that your distro might have made
set nocompatible

" attempt to determine the type of a file based on its name
" allow intelligent auto-indenting for each filetype
"
filetype plugin indent on

" enable syntax highlighting
syntax on

"----------------------------------------------------------
" Options
"
" highlight searches
set hlsearch

" use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set autoindent
set showcmd
set noswapfile
set nobackup
set nowritebackup
set history=50
set ruler
set confirm
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set completeopt-=preview
" line number
set number
set linebreak

let g:python_highlight_all = 1
let g:airline_theme='cool'
let g:airline_powerline_fonts = 1
let g:ycm_key_list_stop_completion = ['<TAB>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" fold indent functions
set foldmethod=indent

set foldlevel=99
set clipboard=unnamed

let g:SimpylFold_docstring_preview=1
let g:move_map_keys = 0
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_sign_error = '🔥'
let g:ale_sign_warning = '⚡'
let g:ale_fix_on_save = 1


" vimwiki setup
let g:vimwiki_list = [{
  \'path': '/mnt/c/Users/charlie/Documents/notes/',
  \ 'syntax': 'markdown', 
  \ 'ext': '.md'}] 

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

"----------------------------------------------------------
" Plugins (Vundle)

"
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'dense-analysis/ale'
Plugin 'matze/vim-move'
Plugin 'morhetz/gruvbox'
Plugin 'mattn/emmet-vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdcommenter'
Plugin 'valloric/youcompleteme'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'vim-python/python-syntax'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vimwiki/vimwiki'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'plasticboy/vim-markdown'

call vundle#end()

call glaive#Install()

Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /mnt/c/Users/charlie/google-java-format-1.7-all-deps.jar"

"----------------------------------------------------------
" Mappings
"

" map folding and unfolding all
nnoremap <C-]> <Nop>
nnoremap <C-]> zM 
nnoremap <space> za

nnoremap <C-L> :nohl<CR><C-L>
map <C-\> :NERDTreeToggle<CR>

vmap <C-Down> <Plug>MoveBlockDown
vmap <C-Up> <Plug>MoveBlockUp
nmap <C-Up> <Plug>MoveLineUp
nmap <C-Right> <Plug>MoveLineRight
nmap <C-Left> <Plug>MoveLineLeft
nmap <C-Down> <Plug>MoveLineDown
nnoremap <F2> :set invpaste paste?<CR>
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>

" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

set pastetoggle=<F2>
set showmode

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
  autocmd FileType javascript AutoFormatBuffer prettier
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

"---------------------------------------------------------
" Themes

" Dark
set background=dark
colorscheme gruvbox 
