set nocompatible               " be iMproved
filetype off                   " required!
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
Bundle 'JavaScript-syntax'
Bundle 'AutoClose'
Bundle 'matchit.zip'
Bundle 'jsbeautify'
Bundle 'EasyMotion'
Bundle 'scrooloose/nerdtree'

" color
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on

set showcmd
set number
set autoindent
set smartindent
set showmatch
set ruler

set tabstop=4
set shiftwidth=4
set softtabstop=4

set cindent
set nobackup
set enc=utf-8
set fencs=utf-8,gb2312,gbk,gb18030

set cursorline
set backspace=indent,eol,start
" display how far away each line is from the current one
"set relativenumber

" hide buffers instead of closing them while switch between them
set hidden
" change the terminal's title
set title

" search options
set ignorecase
set smartcase
set incsearch

set term=xterm-256color
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

let mapleader = ','

"let g:EasyMotion_leader_key = '<Leader>'
map <leader>f :FufFile<CR>
map <leader>b :FufBuffer<CR>
"let SHIFT live longer
nnoremap ; :
" move between split windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" shortcut for command line editing
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>
