return function()
    local navic = require("nvim-navic")

    require("mason-lspconfig").setup({
        ensure_installed = {
            -- "dockerls", -- format has bug
            "pyright",
            "gopls",
            "golangci_lint_ls",
            "dotls",
            "lua_ls",
            "rust_analyzer",
            "jsonls",
            "yamlls",
        },
        automatic_installation = true,
    })
    require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
                on_attach = function(client, bufnr)
                    if client.server_capabilities.documentSymbolProvider then
                        navic.attach(client, bufnr)
                    end
                end
            }
        end,
        -- Next, you can provide targeted overrides for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
            ["rust_analyzer"] = function()
            require("rust-tools").setup {
                tools = {
                    autoSetHints = true,
                    runnables = {
                        use_telescope = true
                    },
                    inlay_hints = {
                        show_parameter_hints = false,
                        parameter_hints_prefix = "",
                        other_hints_prefix = "",
                    },
                },

                -- all the opts to send to nvim-lspconfig
                -- these override the defaults set by rust-tools.nvim
                -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
                server = {
                    -- on_attach is a callback called when the language server attachs to the buffer
                    -- on_attach = on_attach,
                    settings = {
                        -- to enable rust-analyzer settings visit:
                        -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
                            ["rust-analyzer"] = {
                            -- enable clippy on save
                            checkOnSave = {
                                command = "clippy"
                            },
                        }
                    },
                    on_attach = function(client, bufnr)
                        if client.server_capabilities.documentSymbolProvider then
                            navic.attach(client, bufnr)
                        end
                    end,
                },
            }
        end,
            ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            }
        end,
    }
end
