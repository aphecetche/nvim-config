vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim.git",
    "https://github.com/mason-org/mason-lspconfig.nvim.git",
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim.git",
})

require("mason").setup({})
require("mason-lspconfig").setup({})
require("mason-tool-installer").setup({
    ensure_installed = {
        "clang-format",
        "clangd",
        "cssls",
        "gopls",
        "julials",
        "lua_ls",
        "prettier",
        "prettierd",
        "ruff",
        "stylua",
        "tree-sitter-cli",
        "ts_ls",
        "yamlls",
    },
})
