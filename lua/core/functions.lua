local M = {}

M.format = function()
  -- vim.lsp.buf.format({
  --         -- prevents typescript-language-server for formatting
  --         filter = function(client) return client.name ~= "tsserver" end
  -- })
  vim.lsp.buf.format()
end

return M
