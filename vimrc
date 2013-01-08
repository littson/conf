set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent on
syntax enable
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'IndentAnything'
Bundle 'Javascript-Indentation'
""Bundle 'JavaScript-syntax'
Bundle 'AutoClose'
Bundle 'matchit.zip'
Bundle 'jsbeautify'
Bundle 'EasyMotion'

" color
Bundle 'altercation/vim-colors-solarized'

let mapleader = ','

set showcmd
set number
set autoindent
set smartindent
set showmatch
set ruler
set incsearch

set tabstop=4
set shiftwidth=4
set softtabstop=4

set cindent
set nobackup
set enc=utf-8
set fencs=utf-8,gb2312,gbk,gb18030

set cursorline
set backspace=indent,eol,start

" hide buffers instead of closing them while switch between them
set hidden
" change the terminal's title
set title

set term=xterm-256color
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

"let g:EasyMotion_leader_key = '<Leader>'
map <leader>f :FufFile<CR>
map <leader>b :FufBuffer<CR>
"let SHIFT live longer
nnoremap ; :
