-- Nvim Treesitter
return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { 
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "java",
                "go",
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
            },
            auto_install = true,
            highlight = {
                enable = true,
            },
        })
    end,
}
