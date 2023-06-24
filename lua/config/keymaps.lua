vim.api.nvim_set_keymap("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>F", ":lua vim.lsp.buf.range_formatting()<CR>", {})
