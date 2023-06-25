local M = {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "saadparwaiz1/cmp_luasnip",
                "onsails/lspkind.nvim",
                "L3MON4D3/LuaSnip",
        }
}

M.opts = function()
        print("setup_cmp")
        local cmp = require("cmp")
        local select_opts = { behavior = cmp.SelectBehavior.Select }
        return {
                completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1 },
                experimental = { native_menu = false, ghost_text = false },

                snippet = {
                        expand = function(args)
                                require("luasnip").lsp_expand(args.body)
                        end,
                },
                window = {
                        completion = cmp.config.window.bordered(),
                        documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                        ["<C-f>"] = cmp.mapping.scroll_docs(4),
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ["<C-e>"] = cmp.mapping.abort(),
                        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                        { name = "path" },
                        { name = "nvim_lsp", keyword_length = 1 },
                        { name = "buffer",   keyword_length = 3 },
                        { name = "luasnip",  keyword_length = 2 },
                }),
                formatting = {
                        fields = { "abbr", "kind", "menu" },
                        format = require("lspkind").cmp_format({
                                mode = "symbol_text",
                                maxwidth = 50,
                                ellipsis_char = '...',
                                menu = {
                                        buffer = "[Buffer]",
                                        nvim_lsp = "[LSP]",
                                        luasnip = "[LuaSnip]",
                                        nvim_lua = "[Lua]",
                                        latex_symbols = "[Latex]",
                                },
                        }),
                },
        }
end

return M
