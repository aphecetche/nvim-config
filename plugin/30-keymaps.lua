-- nvim-tree

vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeFindFileToggle!<CR>", {})
vim.keymap.set("n", "-", "<cmd>NvimTreeFindFileToggle!<CR>", {})

vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")

vim.keymap.set("n", "gdp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "gdn", "<cmd>lua vim.diagnostic.goto_next()<CR>")

--
-- disable default global LSP mappings (we do set our own in ./XX-lsp.lua)
--
for _, lhs in ipairs({ "gra", "gri", "grn", "grr", "grt", "grx" }) do
  pcall(vim.keymap.del, "n", lhs)
end

-- gra also exists in visual mode
pcall(vim.keymap.del, { "x", "v" }, "gra")

-- optional: disable insert-mode signature-help mapping too
pcall(vim.keymap.del, "i", "<C-S>")
