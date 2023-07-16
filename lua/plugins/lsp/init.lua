local lspServers = {
        "clangd",
        "gopls",
        "julials",
        "lua_ls",
        "tsserver",
        "yamlls",
        "jsonls",
}

return {
        { -- package manager
                "williamboman/mason.nvim",
                lazy = true,
                opts = {
                        ui = {
                                border = "rounded",
                                icons = { package_installed = "✓", package_pending = "󰔟", package_uninstalled = "✗" },
                        },
                },
        },
        { -- auto-install lsp servers
                "williamboman/mason-lspconfig.nvim",
                event = "VeryLazy",
                dependencies = "williamboman/mason.nvim",
                opts = { ensure_installed = lspServers },
        },
        { -- configure LSPs
                "neovim/nvim-lspconfig",
                lazy = false,
                priority = 1000,
                dependencies = "folke/neodev.nvim", -- lsp for nvim-lua config
                init = function()
                        require("plugins.lsp.setup").setup(lspServers)
                end,
                config = require("plugins.lsp.diagnostics").config
        },
}
