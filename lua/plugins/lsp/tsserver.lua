return {
    on_init = function(client)
        -- disable formatting by LSP as we use Prettier (through
        -- https://github.com/mhartington/formatter.nvim instead)
        vim.print("on_init for tsserver: disable formatting")
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end
}
