-- Keymappings for splitright and splitbelow
vim.api.nvim_set_keymap('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sb', ':split<CR>', { noremap = true, silent = true })

-- Move between panes
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

