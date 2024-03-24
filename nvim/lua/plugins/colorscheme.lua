-- Colorscheme
return {
    'rebelot/kanagawa.nvim',
    priority = 1000,

    config = function()
        vim.g.adwaita_darker = true
        vim.cmd('colorscheme adwaita')
    end
}
