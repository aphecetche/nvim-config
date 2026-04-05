vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
    },
})

require("nvim-treesitter").install({ "yaml" })
