local api = vim.api

api.nvim_set_keymap("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", {})
api.nvim_set_keymap("n", "<leader>F", ":lua vim.lsp.buf.range_formatting()<CR>", {})

-- format on write
local FormatOnWriteGroup = api.nvim_create_augroup("FormatOnWriteGroup", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
  command = "silent! lua vim.lsp.buf.format()",
  group = FormatOnWriteGroup
})
