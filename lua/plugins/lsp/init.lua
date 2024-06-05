local lspServers = {
    "clangd",
    "gopls",
    "julials",
    "lua_ls",
    "tsserver",
    "yamlls",
    "jsonls",
    "marksman",
    "pylsp",
    "fortls",
    "cssls"
}

return {
    { -- package manager
        "williamboman/mason.nvim",
        opts = {
            ui = {
                border = "rounded",
                icons = { package_installed = "✓", package_pending = "󰔟", package_uninstalled = "✗" },
            },
        },
    },
    { -- auto-install lsp servers
        "williamboman/mason-lspconfig.nvim",
        --  event = "VeryLazy",
        dependencies = "williamboman/mason.nvim",
        opts = { ensure_installed = lspServers },
    },
    { -- configure LSPs
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        priority = 1000,
        dependencies = "folke/neodev.nvim", -- lsp for nvim-lua config
        init = function()
            require("plugins.lsp.setup").setup(lspServers)
        end,
        config = require("plugins.lsp.diagnostics").config
    },
    {
        -- https://github.com/p00f/clangd_extensions.nvim
        "p00f/clangd_extensions.nvim",
        event = { "BufReadPre", "BufNewFile" },
        -- The `filetypes` come from the default `filetypes` specified for
        -- `clangd` in `lspconfig` documentation
        ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        opts = {
            inlay_hints = {
                only_current_line = true,
                only_current_line_autocmd = { "CursorHold" },
            },
        },
    },
}
