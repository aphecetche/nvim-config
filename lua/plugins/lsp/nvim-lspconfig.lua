local function setup_lua_ls(lspconfig)
        local lua_ls = lspconfig.lua_ls
        lua_ls.setup({
                settings = {
                        Lua = {
                                runtime = {
                                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                                        version = "LuaJIT",
                                },
                                diagnostics = {
                                        -- Get the language server to recognize the `vim` global
                                        globals = { "vim" },
                                },
                                -- Do not send telemetry data containing a randomized but unique identifier
                                telemetry = {
                                        enable = false,
                                },
                                format = {
                                        enable = true,
                                        defaultConfig = {
                                                indent_style = "space",
                                                indent_size = "2",
                                                quote_style = "single"
                                        }
                                },
                        },
                },
        })
        vim.print("lua_ls=", lua_ls) --.default_capabilities())
end

local M = {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                { "williamboman/mason-lspconfig.nvim" },
        },
}

M.config = function()
        local lspconfig = require("lspconfig")
        local lsp_defaults = lspconfig.util.default_config

        vim.print(lsp_defaults.capabilities)

        vim.lsp.set_log_level("debug")

        -- local has_cmp_nvim_lsp, _ = pcall(require, "cmp_nvim_lsp")
        -- if has_cmp_nvim_lsp then
        --   lsp_defaults.capabilities =
        --     vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())
        -- end
        setup_lua_ls(lspconfig)
end

return M
