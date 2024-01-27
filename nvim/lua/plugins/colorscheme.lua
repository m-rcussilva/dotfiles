-- Colorscheme
return {
    "Mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,

    config = function()
        vim.g.adwaita_darker = true
        vim.cmd('colorscheme adwaita')
    end
}
