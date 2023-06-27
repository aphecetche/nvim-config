local function setup_clangd(lspconfig)
        if not lspconfig.clangd then
                return
        end
        lspconfig.clangd.setup({
                on_attach = function()
                        -- make it buffer local keymap so it's only defined for cpp buffers !
                        vim.keymap.set('n', '<leader>a', "<cmd>ClangdSwitchSourceHeader<CR>", { buffer = true })
                end
        })
end

local function setup_julials(lspconfig)
        if not lspconfig.julials then
                return
        end
        lspconfig.julials.setup({})
end

local function setup_lua_ls(lspconfig)
        if not lspconfig.lua_ls then
                return
        end
        lspconfig.lua_ls.setup({
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

        vim.lsp.set_log_level("debug")

        setup_lua_ls(lspconfig)
        setup_clangd(lspconfig)
        setup_julials(lspconfig)

        local has_cmp_nvim_lsp, _ = pcall(require, "cmp_nvim_lsp")
        if has_cmp_nvim_lsp then
                lsp_defaults.capabilities =
                    vim.tbl_deep_extend("force", lsp_defaults.capabilities,
                            require("cmp_nvim_lsp").default_capabilities())
        end
end

return M
