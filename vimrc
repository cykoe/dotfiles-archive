set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'valloric/youcompleteme'
Plugin 'vim-python/python-syntax'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

let g:python_highlight_all = 1

syntax enable
" nerd tree toggle
map <C-n> :NERDTreeToggle<CR>

" line number
set number

" fold indent functions
set foldmethod=indent

set foldlevel=99

nnoremap <space> za

set encoding=utf-8

nnoremap <C-J> <C-W><C-J>

nnoremap <C-K> <C-W><C-K>

nnoremap <C-L> <C-W><C-L>

nnoremap <C-H> <C-W><C-H>
let g:SimpylFold_docstring_preview=1

" Dark
let g:material_style='oceanic'
set background=dark
colorscheme solarized 
