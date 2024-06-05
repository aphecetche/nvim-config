return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    main = "nvim-treesitter.configs",
    build = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
    opts = {
        ensure_installed = {
            --                         "bash",
            "http",
            "lua",
            "css",
            "go",
            "javascript",
            "json",
            "markdown",
            "tsx",
            "typescript",
            "yaml",
            "vimdoc"
        },
        highlight = {
            enable = true,
            disable = function(lang, bufnr)
                -- Disable in large json buffers
                -- return lang == "json" and vim.fn.getfsize(vim.fn.expand('%')) > 1024
                return lang == "json"
                -- return false
            end,
        },
        indentation = {
            enable = true,
            disable = function(lang, bufnr)
                return lang == "json"
            end,
        }
    }
}
