return function()
    require("mason-lspconfig").setup({
        ensure_installed = {
            -- "dockerls", -- format has bug
            "pylsp", -- maybe extra setup here
            "gopls",
            "golangci_lint_ls",
            "dotls",
            "sumneko_lua",
            "rust_analyzer",
            "jsonls",
            "ocamllsp",
            "buf",
            "buf-language-server",
            "typescript-language-server",
        },
        automatic_installation = true,
    })
    require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
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
                    }
                },
            }
        end,
        ["sumneko_lua"] = function()
            require("lspconfig").sumneko_lua.setup {
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
