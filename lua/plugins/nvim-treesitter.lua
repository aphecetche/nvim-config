return {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        main = "nvim-treesitter.configs",
        build = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
        opts = {
                ensure_installed = { "http", "json" },
                highlight = {
                        enable = true
                },
                indentation = {
                        enable = true,
                }
        }
}
