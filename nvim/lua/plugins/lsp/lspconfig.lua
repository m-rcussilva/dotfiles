return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },

    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local util = require("lspconfig/util")

        local keymap = vim.keymap

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            -- set keybinds
            opts.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

            opts.desc = "Show LSP type definitions"
            keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

            opts.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

            opts.desc = "Smart rename"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = "Show buffer diagnostics"
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- HTML server
        lspconfig["html"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- TypeScript server with plugin
        lspconfig["tsserver"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- CSS server
        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- Emmet language server
        lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })

        -- Python server
        lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- Lua server
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        -- C server
        lspconfig["clangd"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        })

        -- Go server
        lspconfig["gopls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
            root_dir = util.root_pattern("go.work", "go.mod", ".git"),
            settings = {
                gopls = {
                    usePlaceholders = true,
                    gofumpt = true,
                    analyses = {
                        nilness = true,
                        unusedparams = true,
                        unusedwrite = true,
                        useany = true,
                    },
                    codelenses = {
                        gc_details = false,
                        generate = true,
                        regenerate_cgo = true,
                        run_govulncheck = true,
                        test = true,
                        tidy = true,
                        upgrade_dependency = true,
                        vendor = true,
                    },
                    experimentalPostfixCompletions = true,
                    completeUnimported = true,
                    staticcheck = true,
                    directoryFilters = { "-.git", "-node_modules" },
                    semanticTokens = true,
                    hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                    },
                },
            },
        })

        -- Clojure server
        lspconfig["clojure_lsp"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "clojure", "edn" },
        })

        -- HTMX server
        lspconfig["htmx"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html" },
        })

        -- Ruby
        lspconfig["solargraph"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "ruby", "eruby" },
            root_dir = util.root_pattern("Gemfile, ", ".git"),
            settings = {
                solargraph = {
                    useBundler = true,
                    diagnostic = true,
                    completion = true,
                    hover = true,
                    formatting = true,
                    symbols = true,
                    definitions = true,
                    rename = true,
                    references = true,
                    folding = true
                }
            }
        })

        -- Templ HTML
        lspconfig["templ"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "templ" },
            root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        })

        -- Java
        lspconfig["jdtls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "java" },
            cmd = {
                "jdtls",
                "-configuration",
                "~/Users/ms/.cache/jdtls/config",
                "-data", "~/Users/ms/.cache/jdtls/workspace"
            },
            single_file_support = { true },
            settings = {
                java = {
                    -- home = "/path/to/your/java/home",
                    eclipse = {
                        downloadSources = true
                    },
                    configuration = {
                        updateBuildConfiguration = "interactive"
                    },
                    maven = {
                        downloadSources = true
                    },
                    implementationsCodeLens = {
                        enabled = true
                    },
                    referencesCodeLens = {
                        enabled = true
                    },
                    references = {
                        includeDecompiledSources = true
                    },
                    format = {
                        enabled = true
                    }
                }
            },
        })
    end,
}
