-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	print("Installing lazy.nvim....")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
	print("Done.")
end
vim.opt.runtimepath:prepend(lazypath)

-- Set leader(s)
--
-- Make sure to set `mapleader` before lazy so our mappings are correct
vim.g.mapleader = ","

-- install plugins
--   using a directory (./lua/plugins, simply referenced as 'plugins',
--   the lua prefix is implied) where all *.lua files will be merged by lazy
require("lazy").setup("plugins")

-- general configuration (all but plugins)
require("config").init()

-- TODO: how to unmap a key with lua ?
vim.cmd("source " .. vim.fn.stdpath("config") .. "/netrw.vim")

-- choose a colorscheme
vim.cmd.colorscheme("monokai-pro-spectrum")
