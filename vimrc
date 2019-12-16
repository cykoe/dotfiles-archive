"----------------------------------------------------------
" Features
"
" avoid unexpected things that your distro might have made
set nocompatible

" attempt to determine the type of a file based on its name
" allow intelligent auto-indenting for each filetype
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
let g:airline_theme='papercolor'
let g:airline_section_b='%{strftime("%c")}'
let g:airline_powerline_fonts = 1
" fold indent functions
set foldmethod=indent

set foldlevel=99
set clipboard=unnamed

let g:SimpylFold_docstring_preview=1
let g:move_map_keys = 0

" vimwiki setup
let g:vimwiki_list = [{
  \'path': '/mnt/c/Users/charlie/Documents/notes/',
  \ 'syntax': 'markdown', 
  \ 'ext': '.md'}] 


"----------------------------------------------------------
" Plugins (Vundle)

"
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'matze/vim-move'
Plugin 'morhetz/gruvbox'
Plugin 'Chiel92/vim-autoformat'
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

"----------------------------------------------------------
" Mappings
"

" map folding and unfolding all
nnoremap <C-]> <Nop>
nnoremap <C-]> zM 
nnoremap <space> za

noremap <A-Up> <C-W><C-K>
nnoremap <A-Right> <C-W><C-L>
nnoremap <A-Left> <C-W><C-H>
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
let g:material_style='oceanic'
set background=dark
colorscheme gruvbox 
