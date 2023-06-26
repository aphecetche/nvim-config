local M = {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
}

M.config = function()
        local mason_lspconfig = require("mason-lspconfig")
        local opts = {
                ensure_installed = {
                        "clangd",
                        "lua_ls",
                },
        }
        mason_lspconfig.setup(opts)
end

return M
