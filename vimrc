call plug#begin()

" Go development plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Provides support for expanding abreviation similar to emmet (HTML5, CSS3)
Plug 'mattn/emmet-vim'

" Retro groove color scheme for Vim
Plug 'morhetz/gruvbox'

" A tree explorer plugin for Vim
Plug 'scrooloose/nerdtree'

" Nodejs extension host for Vim e Neovim and host language servers
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" JavaScript Plugins
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'

" CSS3 Prewview colors
Plug 'ap/vim-css-color'

call plug#end()

syntax on
set number
let mapleader = "\<Space>"
set modelines=0
set ruler
set encoding=utf-8

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

" The tab character to: unicode u2192 →
" The end of line character to: unicode u21b2 ↲
set listchars=eol:↲

" :noh executado automaticamente após salvar o arquivo
autocmd BufWritePost * :nohlsearch

" Salvar visualização (incluindo a posição do cursor) ao sair
autocmd BufWinLeave * mkview

" Restaurar visualização (incluindo a posição do cursor) ao abrir
autocmd BufRead * silent! loadview

" CSS3 Language Server extension for coc.nvim
autocmd FileType scss setl iskeyword+=@-@
autocmd FileType css setl iskeyword+=-

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

" NERDTree
let g:NERDTreeWinPos = "right"

" Go
let g:go_fmt_fail_silently = 0
" let g:go_fmt_command = 'goimports'
let g:go_fmt_autosave = 1
let g:go_gopls_enabled = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1

" OCaml
set rtp^="/Users/ms/.opam/testing/share/ocp-indent/vim"

" Key mappings

" Copy and paste
map <C-a> ggVG
map <C-c> "+y

" For Split Navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Save the current file
nnoremap <Leader>s :w<CR>

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>

" CoC
nnoremap <silent> K :call CocAction('doHover')<CR>

function! ShowDocIfNoDiagnostic(timer_id)
    if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
        silent call CocActionAsync('doHover')
    endif
endfunction

function! s:show_hover_doc()
    call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
