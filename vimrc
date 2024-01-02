syntax on
let mapleader = "\<Space>"
set number
set relativenumber
set modelines=0
set ruler
set encoding=utf-8

" Indenting and code formatting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Change Block Cursor when in Insert Mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" See the last N five lines below the cursor
set scrolloff=10

" Disable beep and flash
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

" Config for dark themes
set background=dark

" Disable automatic line breaks
set nowrap

" Disable the creation of backup files and exchange files. (because Git)
set nobackup
set noswapfile
set nowritebackup

" Fuzzy Search
" Disable vi compatibility mode and limit search to your project
set nocompatible
" Search all subdirectories and recursively
set path+=**
" Shows multiple matches on one line
set wildmenu

" Automatically indent new lines
set autoindent
