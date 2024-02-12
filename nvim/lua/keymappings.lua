local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Keymappings for splitright and splitbelow
vim.api.nvim_set_keymap('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sb', ':split<CR>', { noremap = true, silent = true })

-- Move between panes
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Normal mode mappings
vim.api.nvim_set_keymap('n', '<C-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':m .-2<CR>==', { noremap = true, silent = true })
-- Insert mode mappings
vim.api.nvim_set_keymap('i', '<C-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
-- Visual mode mappings
vim.api.nvim_set_keymap('x', '<C-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<C-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })

-- Move to next and previous tab, also, close the current tab
-- vim.api.nvim_set_keymap('n', '<leader>l', ':tabnext<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>h', ':tabprevious<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>w', ':tabclose<CR>', { noremap = true, silent = true })

-- -------------------------
-- Config for Barbar Plugin |
-- -------------------------
map('n', '<leader>h', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>l', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<leader><', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<leader>>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<leader>0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<leader>p', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<leader>c', '<Cmd>BufferClose<CR>', opts)

