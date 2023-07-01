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

local function notify_on_attach(client, bufnr)
        -- vim.notify(vim.fn.printf("[on_attach(%s,%d)]", client.name, bufnr), vim.log.levels.DEBUG)
end

M.setup = function(lspServers)
        -- INFO must be before the lsp-config setup of lua-ls
        require("neodev").setup {
                -- plugins are helpful e.g. for plenary, but slow down lsp loading
                library = { plugins = false },
        }

        -- vim.print("lspCapabilities=", lspCapabilities)

        for _, lsp in pairs(lspServers) do
                local config = require("plugins.lsp." .. lsp)
                config.capabilities = lspCapabilities
                local on_attach = config.on_attach
                config.on_attach = function(client, bufnr)
                        notify_on_attach(client, bufnr)
                        if on_attach then
                                on_attach(client, bufnr)
                        end
                end
                require("lspconfig")[lsp].setup(config)
        end
end

return M
