local M = {}
--
--------------------------------------------------------------------------------
-- SETUP ALL LSP
-- enable capabilities for plugins
local lspCapabilities = vim.lsp.protocol.make_client_capabilities()

-- Enable snippets-completion (for nvim_cmp)
lspCapabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable folding (for nvim-ufo)
lspCapabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

M.setup = function(lspServers)
    -- INFO must be before the lsp-config setup of lua-ls
    require("neodev").setup {
        -- plugins are helpful e.g. for plenary, but slow down lsp loading
        library = { plugins = false },
    }

    for _, lsp in pairs(lspServers) do
        local config = require("plugins.lsp." .. lsp)
        config.capabilities = lspCapabilities
        require("lspconfig")[lsp].setup(config)
    end

    local notify = vim.notify
    vim.notify = function(msg, ...)
        if msg:match("warning: multiple different client offset_encodings") then
            return
        end

        notify(msg, ...)
    end
end

return M
