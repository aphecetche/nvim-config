return {
	{ "junegunn/fzf", build = "./install --bin" },
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<c-p>",
				function()
					require("fzf-lua").files()
				end,
			},
		},
		cmd = "Rg",
		config = function()
			vim.api.nvim_create_user_command("Rg", function(opts)
				require("fzf-lua").grep({ search = opts.fargs[1] })
			end, { nargs = "*" })
		end,
	},
}
