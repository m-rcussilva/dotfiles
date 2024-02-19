vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.incsearch = true
vim.opt.inccommand = "split"

vim.opt.showmatch = true

vim.opt.cursorline = true

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 10

vim.opt.virtualedit = "block"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.foldmethod = 'manual'

vim.cmd([[
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
]])

vim.cmd('set inccommand=split')
