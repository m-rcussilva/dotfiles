syntax on
set number
let mapleader = "\<Space>"
set modelines=0
set ruler
set encoding=utf-8

" set t_Co=16
set background=dark

set nowrap

" Automatically saves changes made to a file before performing certain operations
" helping to prevent data loss
set autowrite

" FUZZY SEARCH
" Disable vi compatibility mode and limit search to your project
set nocompatible
" Search all subdirectories and recursively
set path+=**
" Shows multiple matches on one line
set wildmenu

" Automatically indent new lines
set autoindent

" Enable Status Line
set statusline=%F\ %y\ %l/%L\ %p%%\ %=

set textwidth=80
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Split Window to the right side and below
set splitright
set splitbelow

" Handle Makefile correctly when using tab
autocmd BufRead,BufNewFile Makefile* setlocal noexpandtab

" Change Block Cursor when in Insert Mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.

" Otimiza exp. de edição deixando-a mais suave em terminais mais lentos
set ttyfast

" See the last 5 five lines below the cursor
set scrolloff=5

set backspace=indent,eol,start

" Use % to jump between pairs
set matchpairs+=<:>

runtime! macros/matchit.vim

set hidden
set showmode
set showcmd

" Disable beep and flash
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" set cursorline
au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
au WinLeave * setlocal nocursorline

" :noh executado automaticamente após salvar o arquivo
autocmd BufWritePost * :nohlsearch

" Salvar visualização (incluindo a posição do cursor) ao sair
autocmd BufWinLeave * mkview

" Restaurar visualização (incluindo a posição do cursor) ao abrir
autocmd BufRead * silent! loadview

" Quickly switch between tabs
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>

" Folding functionality that allows you to collapse or fold code blocks
" Use 'za' to toggle folding for the current fold
" You can also use 'zc' to close and 'zo' to open
" set foldmethod=indent

" Automatically insert closing delimiters
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Copy and paste
map <leader> ggVG
map <leader> "+y

" For Split Navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
