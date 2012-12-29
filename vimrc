set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'ctrlp.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'IndentAnything'
Bundle 'Javascript-Indentation'
Bundle 'JavaScript-syntax'

" color
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on

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
syntax enable
set enc=utf-8
set fencs=utf-8,gb2312,gbk,gb18030

set cursorline
set backspace=indent,eol,start

set term=xterm-256color
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

