return {
    {"romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            clickable = true,
            highlight_inactive_file_icons = false,
            highlight_visible = true,
            icons = {
                buffer_index = false,
                buffer_number = false,
                button = '',
                -- Enables / disables diagnostic symbols
                diagnostics = {
                    [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
                    [vim.diagnostic.severity.WARN] = {enabled = false},
                    [vim.diagnostic.severity.INFO] = {enabled = false},
                    [vim.diagnostic.severity.HINT] = {enabled = true},
                },
                gitsigns = {
                    added = {enabled = true, icon = '+'},
                    changed = {enabled = true, icon = '~'},
                    deleted = {enabled = true, icon = '-'},
                },
                separator = {left = '▎', right = ''},
                separator_at_end = true,
                modified = {button = '●'},
                pinned = {button = '', filename = true},
            },
            maximum_padding = 1,
            minimum_padding = 1,
            maximum_length = 30,
            minimum_length = 0,
        },
    },
}
