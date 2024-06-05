local util = require("lspconfig.util")
local augroup = vim.api.nvim_create_augroup("GoPlsFormatting", {})
return {
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true
        }
    },
    --  on_attach = function(client, bufnr)
    on_attach = function(client, bufnr)
        --  if client.supports_method("textDocument/formatting") then
        -- vim.keymap.set('n', '<leader>zz', "<cmd>ZZ<CR>", { buffer = true })
        --  end
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end
        })
    end
}
