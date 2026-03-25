-- nvim-tree

vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeFindFileToggle!<CR>", {})
vim.keymap.set("n", "-", "<cmd>NvimTreeFindFileToggle!<CR>", {})

vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")

vim.keymap.set("n", "gdp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "gdn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
