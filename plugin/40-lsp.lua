vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    local buf = ev.buf

    local bufmap = function(mode, lhs, rhs, desc)
      desc = desc or ""
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
    end

    -- vim.keymap.set("n", "<leader>lf", '<Cmd>lua require("conform").format()<CR>', { desc = "Format" })
    -- vim.keymap.set("n", "<leader>ll", "<Cmd>lua vim.lsp.codelens.run()<CR>", { desc = "Lens" })
    -- vim.keymap.set("x", "<leader>lf", '<Cmd>lua require("conform").format()<CR>', { desc = "Format selection" })
    --
    -- local format = function()
    --   vim.lsp.buf.format({ async = true })
    -- end
    --
    -- local range_format = function()
    --   vim.lsp.buf.range_format({ async = true })
    -- end
    --
    -- -- Formatting keymaps
    -- if client.server_capabilities.documentFormattingProvider then
    --   vim.api.nvim_buf_create_user_command(buf, "Format", format, {})
    --   bufmap("n", "<leader>f", format)
    -- end
    --
    -- if client.server_capabilities.documentRangeFormattingProvider then
    --   bufmap("n", "<leader>F", range_format)
    -- end

    -- Standard LSP keymaps
    if client.server_capabilities.hoverProvider then
      bufmap("n", "<leader>lh", "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover")
    end
    if client.server_capabilities.definitionProvider then
      bufmap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.definition()<CR>", "Source definition")
    end
    if client.server_capabilities.declarationProvider then
      bufmap("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration")
    end
    if client.server_capabilities.implementationProvider then
      bufmap("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", "implementation")
    end
    if client.server_capabilities.typeDefinitionProvider then
      bufmap("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition")
    end
    if client.server_capabilities.referencesProvider then
      bufmap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", "References")
    end
    -- if client.server_capabilities.signatureProvider then
    --   bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    -- end
    if client.server_capabilities.renameProvider then
      bufmap("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename")
    end
    if client.server_capabilities.codeActionProvider then
      bufmap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code actions")
    end
  end,
})
