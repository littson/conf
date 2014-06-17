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
"Bundle 'IndentAnything'
"Bundle 'Javascript-Indentation'
"Bundle 'JavaScript-syntax'
Bundle 'AutoClose'
Bundle 'matchit.zip'
Bundle 'JavaScript-Indent'
Bundle 'EasyMotion'
Bundle 'scrooloose/nerdtree'
Bundle 'taglist.vim'
Bundle 'groovy.vim'
Bundle 'groovy.vim--Ruley'
Bundle 'surround.vim'
Bundle 'Emmet.vim'
" colorscheme
Bundle 'gilsondev/lizard'
"Bundle 'nanotech/jellybeans.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jeroenbourgois/vim-actionscript'

filetype plugin indent on

au BufRead,BufNewFile *.vm setfiletype html
au BufRead,BufNewFile *.as set syntax=actionscript

" Set to auto read when a file is changed from the outside
set autoread

set showcmd
set number
"set autoindent
set showmatch
set ruler

set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set expandtab

set enc=utf-8
set fencs=utf-8,gb2312,gbk,gb18030
set nobomb
" Use Unix as the standard file type
set ffs=unix,dos,mac

set nobackup
set noswapfile

set cursorline
set nostartofline
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

"set clipboard=unnamed

set term=xterm-256color
let g:solarized_termcolors=256
syntax enable
"set background=light
set background=dark
colorscheme solarized
"colorscheme lizard

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

" tagslist
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Ctags_Cmd ='/usr/local/Cellar/ctags/5.8/bin/ctags'
let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'
map t :TlistToggle<CR>

" python
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype javascript setlocal expandtab tabstop=4 shiftwidth=4

if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif
