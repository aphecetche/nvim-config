return {
        on_attach = function()
                -- make it buffer local keymap so it's only defined for cpp buffers !
                vim.keymap.set('n', '<leader>a', "<cmd>ClangdSwitchSourceHeader<CR>", { buffer = true })
        end
}

--     local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.offsetEncoding = { "utf-16" }
-- require('lspconfig').clangd.setup({capabilities = capabilities})
