local foldIcon = ""
local hlgroup = "NonText"
local function foldTextFormatter(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = "  " .. foldIcon .. "  " .. tostring(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, { chunkText, hlGroup })
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        if curWidth + chunkWidth < targetWidth then
                                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                        end
                        break
                end
                curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, hlgroup })
        return newVirtText
end

local function setup(opts)
        -- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
        -- vim.o.foldcolumn = '1' -- use '1' to show foldlevel on left of line numbers
        vim.o.foldcolumn = '0' -- use '1' to show foldlevel on left of line numbers
        vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        require("ufo").setup(opts)

        -- Using ufo provider need remap `zR` and `zM`
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
        -- set foldlevel via z{n}
        for _, lvl in pairs { 1, 2, 3, 4, 5, 6, 7, 8, 9 } do
                local desc = lvl < 4 and "󰘖 Set Fold Level" or "which_key_ignore"
                vim.keymap.set(
                        "n",
                        "z" .. tostring(lvl),
                        function() require("ufo").closeFoldsWith(lvl - 1) end,
                        { desc = desc }
                )
        end
end

return {
        {
                "kevinhwang91/nvim-ufo",
                dependencies = {
                        { "kevinhwang91/promise-async" },
                        -- {
                        --         "luukvbaal/statuscol.nvim",
                        --         config = function()
                        --                 local builtin = require("statuscol.builtin")
                        --                 require("statuscol").setup({
                        --                         -- foldfunc = "builtin",
                        --                         -- setopt = true,
                        --                         relculright = true,
                        --                         segments = {
                        --                                 { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
                        --                                 { text = { "%s" },                  click = "v:lua.ScSa" },
                        --                                 { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                        --                         },
                        --                 })
                        --         end,
                        -- }
                },
                event = "BufReadPost",
                opts = {
                        provider_selector = function(_, ft, _)
                                local lspWithOutFolding = { "markdown", "bash", "sh", "bash", "zsh", "css", "json",
                                        "httpResult" }
                                if vim.tbl_contains(lspWithOutFolding, ft) then
                                        return { "treesitter", "indent" }
                                else
                                        return { "lsp", "indent" }
                                end
                        end,
                        -- open opening the buffer, close these fold kinds
                        -- use `:UfoInspect` to get available fold kinds from the LSP
                        close_fold_kinds = { "imports" },
                        open_fold_hl_timeout = 200,
                        fold_virt_text_handler = foldTextFormatter,
                },
                config = function(_, opts)
                        setup(opts)
                end
        },
}
