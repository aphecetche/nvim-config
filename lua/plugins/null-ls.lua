local lintersAndFormatters = {
        "eslint",
        "prettier",
        "jq"
}

local function nullSources()
        local builtins = require("null-ls").builtins

        return {
                builtins.code_actions.eslint.with({
                        prefer_local = "node_modules/.bin",
                        condition = function(utils)
                                return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
                        end,
                        -- filetypes = { "ts", "tsx" }
                }),
                builtins.formatting.prettier.with({
                        prefer_local = "node_modules/.bin",
                        condition = function(utils)
                                return utils.root_has_file({ ".prettierrc", ".prettierrc.js", ".prettierrc.json" })
                        end,
                        -- filetypes = { "js", "ts", "tsx", "css" }
                }),
                builtins.formatting.jq.with({ filetypes = { "json", "httpResult" } }),
                builtins.code_actions.gitsigns,
        }
end

return {
        {
                "jose-elias-alvarez/null-ls.nvim",
                event = "VeryLazy",
                dependencies = { "nvim-lua/plenary.nvim" },
                config = function()
                        require("null-ls").setup {
                                border = "rounded",
                                sources = nullSources(),
                        }
                end,
        },
        {
                "jay-babu/mason-null-ls.nvim",
                event = { "BufReadPre", "BufNewFile" },
                dependencies = {
                        "williamboman/mason.nvim",
                        "jose-elias-alvarez/null-ls.nvim",
                },
                opts = { ensure_installed = lintersAndFormatters },
        },
}
