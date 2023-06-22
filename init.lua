-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end
vim.opt.runtimepath:prepend(lazypath)

-- Set leader(s)
--
vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct

-- install plugins
--   using a directory (./lua/plugins, simply referenced as 'plugins', the lua prefix is implied) 
--   where all *.lua files will be merged
--   by lazy
require('lazy').setup('plugins')

-- select a colorscheme here (or not...)
vim.cmd.colorscheme('catppuccin-mocha')

-- TODO: how to unmap a key with lua ? 
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/netrw.vim')
