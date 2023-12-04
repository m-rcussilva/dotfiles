call plug#begin()

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }      " Go
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " CoC
Plug 'scrooloose/nerdtree'                              " NERD Tree
Plug 'morhetz/gruvbox'                                  " Gruvbox Theme
Plug 'vim-airline/vim-airline'                          " Vim Airline
Plug 'ryanoasis/vim-devicons'                           " Dev Icons
Plug 'tpope/vim-commentary'                             " Comment stuff out

Plug 'mattn/emmet-vim'                                  " Emmet for HTML5
Plug 'othree/html5.vim'                                 " HTML5 syntax, indent
Plug 'elzr/vim-json'                                    " JSON highlighting
Plug 'stephpy/vim-yaml'                                 " For yaml files

Plug 'pangloss/vim-javascript'                          " JS indentantion and syntax support
Plug 'leafgarland/typescript-vim'                       " TypeScript syntax files
Plug 'peitalin/vim-jsx-typescript'                      " React JSX syntax highlighting for vim and TS
Plug 'maxmellon/vim-jsx-pretty'                         " JSX and TSX highlighting
Plug 'ap/vim-css-color'                                 " Color highlighter
Plug 'ollykel/v-vim'                                    " V syntax highlighting
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " A command-line fuzzy finder
Plug 'junegunn/fzf.vim'                                 " Fzf

call plug#end()

syntax on
set number
set relativenumber
let mapleader = "\<Space>"
set modelines=0
set ruler
set encoding=utf-8

set background=dark
colorscheme gruvbox

set nowrap

set nobackup
set noswapfile
set nowritebackup

" Automatically saves changes made to a file before performing certain operations
" helping to prevent data loss
set autowrite

" Fuzzy Search
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
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

" Handle Makefile correctly when using tab
autocmd BufRead,BufNewFile Makefile* setlocal noexpandtab

" Change Block Cursor when in Insert Mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.

" Otimiza exp. de edição deixando-a mais suave em terminais mais lentos
set ttyfast

" See the last 5 five lines below the cursor
set scrolloff=10

set backspace=indent,eol,start

" Use % to jump between pairs
set matchpairs+=<:>

runtime! macros/matchit.vim

set cinoptions+=:0

set hidden
set showmode
set showcmd

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

if has("syntax")
  syntax enable
endif

" Disable beep and flash
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

" set cursorline
au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
au WinLeave * setlocal nocursorline

" :noh executado automaticamente após salvar o arquivo
autocmd BufWritePost * :nohlsearch

" Salvar visualização (incluindo a posição do cursor) ao sair
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

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

" For Split Navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Emmet Vim
" The trailing , still needs to be entered, so the new keymap would be <C-Z>,
let g:user_emmet_leader_key='<C-Z>'

" Fuzzy Finder
nnoremap <leader>ff :Files<CR>

" Moving Lines
" Normal mode mappings
" Insert mode mappings
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
" Visual mode mappings
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" + ------------------------------------------ + "
" | Gruvbox Dark Friendly From github.com/rwxrob |
" + ------------------------------------------ + "

" Base default color changes (gruvbox dark friendly)
hi StatusLine ctermfg=black ctermbg=NONE
hi StatusLineNC ctermfg=black ctermbg=NONE
hi Normal ctermbg=NONE
hi Special ctermfg=cyan
hi LineNr ctermfg=black ctermbg=NONE
hi SpecialKey ctermfg=black ctermbg=NONE
hi ModeMsg ctermfg=black cterm=NONE ctermbg=NONE
hi MoreMsg ctermfg=black ctermbg=NONE
hi NonText ctermfg=black ctermbg=NONE
hi vimGlobal ctermfg=black ctermbg=NONE
hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
hi Error ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
hi Search ctermbg=236 ctermfg=darkred
hi vimTodo ctermbg=236 ctermfg=darkred
hi Todo ctermbg=236 ctermfg=darkred
hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
hi MatchParen ctermbg=236 ctermfg=darkred

" Color overrides
au FileType * hi StatusLine ctermfg=black ctermbg=NONE
au FileType * hi StatusLineNC ctermfg=black ctermbg=NONE
au FileType * hi Normal ctermbg=NONE
au FileType * hi Special ctermfg=cyan
au FileType * hi LineNr ctermfg=238 ctermbg=NONE
au FileType * hi SpecialKey ctermfg=black ctermbg=NONE
au FileType * hi ModeMsg ctermfg=black cterm=NONE ctermbg=NONE
au FileType * hi MoreMsg ctermfg=black ctermbg=NONE
au FileType * hi NonText ctermfg=black ctermbg=NONE
au FileType * hi vimGlobal ctermfg=black ctermbg=NONE
au FileType * hi goComment ctermfg=244 ctermbg=NONE
au FileType * hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi Error ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi Search ctermbg=236 ctermfg=darkred
au FileType * hi vimTodo ctermbg=236 ctermfg=darkred
au FileType * hi Todo ctermbg=236 ctermfg=darkred
au FileType * hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
au FileType * hi MatchParen ctermbg=236 ctermfg=darkred
au FileType markdown,pandoc hi Title ctermfg=yellow ctermbg=NONE
au FileType markdown,pandoc hi Operator ctermfg=yellow ctermbg=NONE
au FileType markdown,pandoc set tw=0
au FileType markdown,pandoc set wrap
au FileType yaml hi yamlBlockMappingKey ctermfg=NONE
au FileType yaml set sw=2
au FileType bash set sw=2
au FileType c set sw=8
au FileType markdown,pandoc noremap j gj
au FileType markdown,pandoc noremap k gk
au FileType sh set noet

" + --------- + "
" | NERD Tree |
" + --------- + "

let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden = 1

nnoremap <leader>e :NERDTreeToggle<CR>

" + --------------------- + "
" | Go Programming Langauge |
" + --------------------- + "

" Ativar o vim-go
filetype plugin on

" Formate o código automaticamente ao salvar
" autocmd BufWritePre *.go :silent! Fmt

let g:go_fmt_fail_silently = 0
let g:go_fmt_command = 'goimports'

" Ativar realce de sintaxe para arquivos de teste Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1

" Configurar as ferramentas Go (certifique-se de que o caminho esteja correto)
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_gofmt = "gofumpt"
let g:go_metalinter_fast = 1
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_enabled = ['errcheck', 'unparam', 'gofmt', 'golint', 'goconst', 'vet', 'ineffassign', 'maligned']

" Mostrar informações de documentação ao passar o mouse sobre identificadores
let g:go_auto_type_info = 1

" Ativar o linting automático
let g:go_autosave = 1

" Gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" + --- + "
" | CoC |
" + --- + "

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nnoremap <C-j> <Plug>(coc-diagnostic-prev)
nnoremap <C-k> <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

" To enable highlight current symbol on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> <leader>rn <Plug>(coc-rename)
nmap <silent> <leader>td  <Plug>(coc-type-definition)
nmap <silent> <leader>fi  <Plug>(coc-implementation)
nmap <silent> <leader>fr  <Plug>(coc-references)
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"
