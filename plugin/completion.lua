vim.pack.add({
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/cmp-buffer",
    "https://github.com/hrsh7th/cmp-path",
    "https://github.com/saadparwaiz1/cmp_luasnip",
    "https://github.com/onsails/lspkind.nvim",
    "https://github.com/L3MON4D3/LuaSnip",
})

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
        and vim.api
                .nvim_buf_get_lines(0, line - 1, line, true)[1]
                :sub(col, col)
                :match("%s")
            == nil
end

local setup_cmp = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
        completion = { completeopt = "menu,menuone,noinsert,noselect" },
        experimental = { native_menu = false, ghost_text = false },
        --preselect = cmp.PreselectMode.None, -- 🔑 disables preselection of first item

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
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            -- Accept currently selected item.
            -- Set `select` to `false` to only confirm explicitly selected items.
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
            -- Luasnip super-tab configuration:
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                    -- elseif luasnip.expand_or_jumpable() then
                    --         luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
        }),
        formatting = {
            fields = { "abbr", "kind", "menu" },
            format = require("lspkind").cmp_format({
                mode = "symbol_text",
                maxwidth = 50,
                ellipsis_char = "...",
                menu = {
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    nvim_lua = "[Lua]",
                    latex_symbols = "[Latex]",
                },
            }),
        },
    })
end

require("cmp").setup(setup_cmp())
