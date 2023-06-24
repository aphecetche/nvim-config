return {
	{
		{
			"williamboman/mason.nvim",
			cmd = "Mason",
			opts = {
				ensure_installed = {
					"stylua",
					"shfmt",
					-- "flake8",
				},
			},
			config = function(_, opts)
				require("mason").setup(opts)
			end,
		},
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		{
			"jose-elias-alvarez/null-ls.nvim",
			dependencies = { "nvim-lua/plenary.nvim", "williamboman/mason.nvim" },
			opts = function()
				local null_ls = require("null-ls")
				return {
					sources = {
						null_ls.builtins.formatting.stylua,
						--   null_ls.builtins.diagnostics.eslint,
						--   null_ls.builtins.completion.spell,
					},
					border = "rounded",
				}
			end,
		},
	},
}
