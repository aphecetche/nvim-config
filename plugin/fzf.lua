vim.pack.add({ "https://github.com/nvim-tree/nvim-web-devicons.git", "https://github.com/ibhagwan/fzf-lua.git" })

local opts = {
	winopts = {
		width = 0.8,
		height = 0.9,
		preview = {
			hidden = "nohidden",
			vertical = "up:45%",
			horizontal = "right:50%",
			layout = "flex",
			flip_columns = 120,
			delay = 10,
			winopts = { number = true },
		},
	},
}

-- fzf-vim first to get the fzf-vim eq commands (e.g. Rg)
-- then telescope for the look
require("fzf-lua").setup({ "fzf-vim" })
require("fzf-lua").setup({ "telescope", opts })

vim.keymap.set("n", "<C-p>", function()
	require("fzf-lua").files(opts)
end)
