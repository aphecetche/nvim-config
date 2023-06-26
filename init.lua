-- disable netrw (in favor of nvim-tree)
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- Set leader(s)
--   make sure to set `mapleader` before lazy so our mappings are correct
vim.g.mapleader          = ","

-- Install package manager
require("core.install-lazy")

-- install plugins
--   using a directory (./lua/plugins, simply referenced as 'plugins',
--   the lua prefix is implied) where all *.lua files will be merged by lazy
require("lazy").setup("plugins")

-- my keymaps
require("core.keymaps")

-- my autocommands
require("core.autocmds")

-- my options
require("core.options")

-- my commands
require("core.commands")

-- TODO: how to unmap a key with lua ?
-- vim.cmd("source " .. vim.fn.stdpath("config") .. "/netrw.vim")

-- choose a colorscheme
vim.cmd.colorscheme("monokai-pro-spectrum")
