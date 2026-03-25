return {
	settings = {
		Lua = {
			workspace = {
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths
					-- here.
					-- '${3rd}/luv/library',
					-- '${3rd}/busted/library',
				},
			},
		},
	},
	-- on_attach = function()
	-- 	vim.notify("TOTO!")
	-- end,
}
