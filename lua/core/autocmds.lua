-- LSP keymapping

vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(args)
                -- vim.notify(vim.fn.printf("LspAttach for client %s %d", client.name, client.id), vim.log.levels.DEBUG)

                local bufmap = function(mode, lhs, rhs)
                        local opts = { buffer = true }
                        vim.keymap.set(mode, lhs, rhs, opts)
                end

                local client = vim.lsp.get_client_by_id(args.data.client_id)

                if client.server_capabilities.documentFormattingProvider then
                        local FormatOnWriteGroup = vim.api.nvim_create_augroup("FormatOnWriteGroup", { clear = true })
                        -- create format on write autocmd only if LSP server actually support formatting
                        vim.api.nvim_create_autocmd("BufWritePre", {
                                command = "silent! lua vim.lsp.buf.format()",
                                -- pattern = "*.lua",
                                group = FormatOnWriteGroup,
                        })
                        vim.keymap.set("n", "<leader>f", require("core.functions").format, {})
                end

                if client.server_capabilities.documentRangeFormattingProvider then
                        vim.api.nvim_set_keymap("n", "<leader>F", ":lua vim.lsp.buf.range_formatting()<CR>", {})
                end
                if client.server_capabilities.hoverProvider then
                        -- Displays hover information about the symbol under the cursor
                        bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
                end
                if client.server_capabilities.definitionProvider then
                        -- Jump to the definition
                        bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
                end
                if client.server_capabilities.declarationProvider then
                        -- Jump to declaration
                        bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
                end
                if client.server_capabilities.implementationProvider then
                        -- Lists all the implementations for the symbol under the cursor
                        bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
                end
                if client.server_capabilities.typeDefinitionProvider then
                        -- Jumps to the definition of the type symbol
                        bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
                end
                if client.server_capabilities.referencesProvider then
                        -- Lists all the references
                        bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
                end
                if client.server_capabilities.signatureProvider then
                        -- Displays a function's signature information
                        bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
                end
                if client.server_capabilities.renameProvider then
                        -- Renames all references to the symbol under the cursor
                        bufmap("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>")
                end
                if client.server_capabilities.codeActionProvider then
                        -- Selects a code action available at the current cursor position
                        bufmap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>")
                        bufmap("x", "ga", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")
                end
                -- if client.server_capabilities.diagnosticProvider then -- this is for diag pull model only
                -- Show diagnostics in a floating window
                bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
                -- Move to the previous diagnostic
                bufmap("n", ">d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
                -- Move to the next diagnostic
                bufmap("n", "<d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
                -- end
        end,
})
