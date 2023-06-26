local null_ls = require("plugins.lsp.null-ls")
local mason = require("plugins.lsp.mason")
local mason_lspconfig = require("plugins.lsp.mason-lspconfig")
local mason_null_ls = require("plugins.lsp.mason-null-ls")
local nvim_lspconfig = require("plugins.lsp.nvim-lspconfig")
local neodev = require("plugins.lsp.neodev")

local t = { neodev, null_ls, mason, mason_lspconfig, mason_null_ls, nvim_lspconfig }

return t
