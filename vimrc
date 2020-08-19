set nocompatible               " be iMproved
filetype off                   " required!
syntax enable
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

Plugin 'L9'
Plugin 'FuzzyFinder'
"Plugin 'IndentAnything'
"Plugin 'Javascript-Indentation'
"Plugin 'JavaScript-syntax'
"Plugin 'AutoClose'
Plugin 'Raimondi/delimitMate'
Plugin 'matchit.zip'
"Plugin 'JavaScript-Indent'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'EasyMotion'
Plugin 'scrooloose/nerdtree'
Plugin 'taglist.vim'
Plugin 'groovy.vim'
Plugin 'groovy.vim--Ruley'
Plugin 'surround.vim'
Plugin 'Emmet.vim'
" colorscheme
Plugin 'gilsondev/lizard'
"Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jeroenbourgois/vim-actionscript'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim'

"Plugin 'fatih/vim-go'

call vundle#end() 
filetype plugin indent on

au BufRead,BufNewFile *.vm set filetype=html
"au BufRead,BufNewFile *.vm set syntax=javascript
au BufRead,BufNewFile *.as set syntax=actionscript
au BufRead,BufNewFile *.gradle set syntax=groovy
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.py set filetype=python

" python
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 smarttab softtabstop=4
autocmd FileType javascript setlocal expandtab tabstop=4 shiftwidth=4 smarttab softtabstop=4
autocmd FileType html setlocal expandtab tabstop=4 shiftwidth=4 smarttab softtabstop=4

" Set to auto read when a file is changed from the outside
set autoread

set showcmd
set number
"set autoindent
set showmatch
set ruler

set expandtab
set tabstop=4
set shiftwidth=4

"set smartindent

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
set hlsearch

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
map T :TlistToggle<CR>

autocmd FileType javascript setlocal expandtab tabstop=4 shiftwidth=4

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

" powerline
set laststatus=2
"let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set guifont=Menlo\ Regular:h14
"set guifont=Source\ Code\ Pro\ For\ Powerline:h14

" syntastic 
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

