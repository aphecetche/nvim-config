-- =========================
-- LSP Servers Configuration
-- =========================
local lspServers = {
        "clangd",
        "gopls",
        "julials",
        "lua_ls",
        "ts_ls",
        "yamlls",
        "marksman",
        "pylsp",
        "fortls",
        "cssls",
        "vhdl_ls"
}

-- =========================
-- JSONLS: special config
-- =========================
-- Define JSONLS if not already defined
if not vim.lsp.configs.jsonls then
        vim.lsp.configs.jsonls = {
                default_config = {
                        cmd = { "vscode-json-languageserver", "--stdio" },
                        filetypes = { "json", "jsonc" },
                        root_dir = vim.loop.cwd,
                        settings = {},
                }
        }
end

-- Start JSONLS with custom settings
vim.lsp.start({
        name = "jsonls",
        cmd = { "vscode-json-languageserver", "--stdio" },
        filetypes = { "json", "jsonc" },
        root_dir = vim.loop.cwd,
        settings = {
                json = {
                        format = {
                                enable = true,
                                indent = 2, -- number of spaces
                        },
                        validate = { enable = true },
                },
        },
})

-- =========================
-- Attach other servers
-- =========================
for _, server in ipairs(lspServers) do
        vim.lsp.start({ name = server })
end

-- =========================
-- Buffer-local JSON indent enforcement
-- =========================
vim.api.nvim_create_autocmd("FileType", {
        pattern = "json",
        callback = function()
                vim.bo.shiftwidth = 2
                vim.bo.tabstop = 2
                vim.bo.expandtab = true
        end,
})

-- =========================
-- LspAttach: Keymaps and Formatting
-- =========================
vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                local buf = args.buf

                local bufmap = function(mode, lhs, rhs)
                        vim.keymap.set(mode, lhs, rhs, { buffer = buf })
                end

                local format = function()
                        vim.lsp.buf.format({ async = true })
                end

                local range_format = function()
                        vim.lsp.buf.range_format({ async = true })
                end

                -- JSON: ensure formatting uses the LSP settings
                if client.name == "jsonls" then
                        vim.bo.shiftwidth = 2
                        vim.bo.tabstop = 2
                        vim.bo.expandtab = true
                end

                -- clangd special mapping
                if client.name == "clangd" then
                        bufmap("n", "<leader>a", "<cmd>LspClangdSwitchSourceHeader<CR>")
                end

                -- Disable formatting for tsserver
                if client.name == "ts_ls" then
                        client.server_capabilities.documentFormattingProvider = false
                        client.server_capabilities.documentRangeFormattingProvider = false
                end

                -- Formatting keymaps
                if client.server_capabilities.documentFormattingProvider then
                        vim.api.nvim_buf_create_user_command(buf, "Format", format, {})
                        bufmap("n", "<leader>f", format)
                end

                if client.server_capabilities.documentRangeFormattingProvider then
                        bufmap("n", "<leader>F", range_format)
                end

                -- Standard LSP keymaps
                if client.server_capabilities.hoverProvider then bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>") end
                if client.server_capabilities.definitionProvider then
                        bufmap("n", "gd",
                                "<cmd>lua vim.lsp.buf.definition()<CR>")
                end
                if client.server_capabilities.declarationProvider then
                        bufmap("n", "gD",
                                "<cmd>lua vim.lsp.buf.declaration()<CR>")
                end
                if client.server_capabilities.implementationProvider then
                        bufmap("n", "gi",
                                "<cmd>lua vim.lsp.buf.implementation()<CR>")
                end
                if client.server_capabilities.typeDefinitionProvider then
                        bufmap("n", "go",
                                "<cmd>lua vim.lsp.buf.type_definition()<CR>")
                end
                if client.server_capabilities.referencesProvider then
                        bufmap("n", "gr",
                                "<cmd>lua vim.lsp.buf.references()<CR>")
                end
                if client.server_capabilities.signatureProvider then
                        bufmap("n", "gs",
                                "<cmd>lua vim.lsp.buf.signature_help()<CR>")
                end
                if client.server_capabilities.renameProvider then bufmap("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>") end
                if client.server_capabilities.codeActionProvider then
                        bufmap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
                        bufmap("x", "ga", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")
                end
                bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
                bufmap("n", ">d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
                bufmap("n", "<d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
        end,
})
