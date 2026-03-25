vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim.git",
	"https://github.com/mason-org/mason-lspconfig.nvim.git",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim.git",
})

require("mason").setup({})
require("mason-lspconfig").setup({})
require("mason-tool-installer").setup({
	ensure_installed = {
		"clang-format",
		"prettier",
		"prettierd",
		"lua_ls",
		"ts_ls",
		"clangd",
		"gopls",
		"julials",
		"yamlls",
		"pylsp",
		"cssls",
	},
})

-- vim.lsp.enable("basedpyright")
-- vim.lsp.enable("lua_ls")

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		local buf = ev.buf

		local bufmap = function(mode, lhs, rhs)
			vim.keymap.set(mode, lhs, rhs, { buffer = buf })
		end

		local format = function()
			vim.lsp.buf.format({ async = true })
		end

		local range_format = function()
			vim.lsp.buf.range_format({ async = true })
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
		if client.server_capabilities.hoverProvider then
			bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
		end
		if client.server_capabilities.definitionProvider then
			bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
		end
		if client.server_capabilities.declarationProvider then
			bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
		end
		if client.server_capabilities.implementationProvider then
			bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
		end
		if client.server_capabilities.typeDefinitionProvider then
			bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
		end
		if client.server_capabilities.referencesProvider then
			bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
		end
		if client.server_capabilities.signatureProvider then
			bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
		end
		if client.server_capabilities.renameProvider then
			bufmap("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>")
		end
		if client.server_capabilities.codeActionProvider then
			bufmap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
			bufmap("x", "ga", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")
		end
	end,
})
