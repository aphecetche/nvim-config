local M = {}

M.config = function()
	-- Sign Icons
	local diagnosticTypes = { Error = "", Warn = "▲", Info = "", Hint = "" }
	for type, icon in pairs(diagnosticTypes) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	-- Underlines
	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = function()
			for type, _ in pairs(diagnosticTypes) do
				vim.cmd.highlight("DiagnosticUnderline" .. type .. " gui=underdouble cterm=underline")
			end
		end,
	})

	-- Floats & Virtual Text
	require("lspconfig.ui.windows").default_options.border = "rounded"
	vim.lsp.handlers["textDocument/hover"] =
		vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded"})
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded"})

	local function fmt(diag)
		local source = diag.source and " (" .. diag.source:gsub("%.$", "") .. ")" or ""
		local msg = diag.message
		return msg .. source
	end

	vim.diagnostic.config {
		virtual_text = {
			severity = { min = vim.diagnostic.severity.WARN }, -- not text for hints
			source = false, -- already handled by format function
			format = function(diag) return fmt(diag) end,
			spacing = 1,
		},
		float = {
			format = function(diag) return fmt(diag) end,
			focusable = true,
			border = "rounded",
			max_width = 70,
			header = "", -- remove "Diagnostics:" heading
		},
	}
end

return M

