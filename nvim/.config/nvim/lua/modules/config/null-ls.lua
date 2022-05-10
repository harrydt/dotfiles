return function()
    --[[ local lsp_formatting = function(bufnr)
        vim.lsp.buf.format({
            filter = function(clients)
                -- filter out clients that you don't want to use
                return vim.tbl_filter(function(client)
                    return client.name ~= "tsserver"
                end, clients)
            end,
            bufnr = bufnr,
        })
    end ]]

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require("null-ls")
    null_ls.setup({
        sources = {
            null_ls.builtins.completion.spell,
        },
        -- you can reuse a shared lspconfig on_attach callback here
        on_attach = function(client, bufnr)
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                })
            end
        end,

        debug = true,
    })
end
