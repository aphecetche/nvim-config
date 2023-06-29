local lintersAndFormatters = {
        -- "yamllint", -- only for diagnostics, not for formatting
        -- "shellcheck", -- needed for bash-lsp
        -- "shfmt", -- shell
        -- "markdownlint",
        -- "cbfmt", -- use other linters to format codeblocks in markdown
        -- "black", -- python formatter
        -- "vale", -- natural language
        -- "codespell", -- superset of `misspell`, therefore only using codespell
        -- "selene", -- lua
        "eslint",
        "prettier", -- only used for yaml and html https://github.com/mikefarah/yq/issues/515
        -- 	"rome", -- also an LSP; the lsp does diagnostics, the CLI via null-ls does formatting
        -- 	-- "stylelint", -- included in mason, but not its plugins, which then cannot be found https://github.com/williamboman/mason.nvim/issues/695
        --
        -- 	"yq", -- ensure installation via mason, but only used by rest.nvim
        -- 	"gh", -- gh cli
}

local function nullSources()
        local builtins = require("null-ls").builtins

        return {
                builtins.code_actions.eslint.with({
                        prefer_local = "node_modules/.bin",
                }),
                builtins.formatting.prettier.with({
                        prefer_local = "node_modules/.bin",
                }),
        }
end

return {
        {
                "jose-elias-alvarez/null-ls.nvim",
                event = "VeryLazy",
                dependencies = { "nvim-lua/plenary.nvim", "jayp0521/mason-null-ls.nvim" },
                config = function()
                        require("null-ls").setup {
                                border = "rounded",
                                sources = nullSources(),
                        }
                end,
        },
        {
                "jayp0521/mason-null-ls.nvim",
                lazy = true,
                opts = { ensure_installed = lintersAndFormatters },
        },
}
