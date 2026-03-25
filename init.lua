-- disable netrw at the very start of your init.lua (recommended by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("config.autocmds")
require("config.keymaps")
require("config.options")
