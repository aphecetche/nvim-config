local M = {}

M.setup = function(lspServers)
	-- INFO must be before the lsp-config setup of lua-ls
	require("neodev").setup {
		-- plugins are helpful e.g. for plenary, but slow down lsp loading
		library = { plugins = false }, 
	}

	for _, lsp in pairs(lspServers) do
		local config = require("plugins.lsp."..lsp)
        config.capabilities = lspCapabilities,
		require("lspconfig")[lsp].setup(config)
	end
end

return M
