-- disable netrw at the very start of your init.lua (recommended by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ","

require("config.autocmds")
require("config.keymaps")
require("config.options")
