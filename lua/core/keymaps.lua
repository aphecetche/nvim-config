-- here should put general keymaps
-- note that keymaps that do depend on LSP capabilites (e.g. formatting)
-- are to be found under autocmds instead

vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeFindFileToggle!<CR>", {})
vim.keymap.set("n", "-", "<cmd>NvimTreeFindFileToggle!<CR>", {})
