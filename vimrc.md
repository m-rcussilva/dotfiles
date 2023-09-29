call plug#begin()

" Go development plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Provides support for expanding abreviation similar to emmet (HTML5, CSS3)
Plug 'mattn/emmet-vim'

" Retro groove color scheme for Vim
Plug 'morhetz/gruvbox'

call plug#end()

syntax on
set number
let mapleader = "\<Space>"
set modelines=0
set ruler
set encoding=utf-8
set nocompatible

" Enable Status Line
" set laststatus=2
set statusline=%F\ %y\ %l/%L\ %p%%\ %=

set textwidth=80
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Handle Makefile correctly when using tab
autocmd BufRead,BufNewFile Makefile* setlocal noexpandtab

" Change Block Cursor when in Insert Mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast " Otimiza exp. de edição deixando-a mais suave em terminais mais lentos 

set scrolloff=5 " See the last 5 five lines below the cursor
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

set background=dark
colorscheme gruvbox

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

" Quickly switch between tabs
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>

" Automatically insert closing delimiters
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" OCaml
set rtp^="/Users/ms/.opam/testing/share/ocp-indent/vim"

" Key mappings

" Copy and paste
map <C-a> ggVG
map <C-c> "+y

" Save the current file
nnoremap <Leader>s :w<CR>
