vim.keymap.set("n", "<leader>r", "<Plug>RestNvim", { desc = "Run http request under cursor", buffer = true })
vim.keymap.set("n", "<leader>rp", "<Plug>RestNvimPreview", { desc = "Preview curl request", buffer = true })
vim.keymap.set("n", "<leader>lr", "<Plug>RestNvimLast", { desc = "Re-run last request", buffer = true })
