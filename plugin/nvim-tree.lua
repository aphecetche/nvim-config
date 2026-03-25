vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons.git",
	"https://github.com/nvim-tree/nvim-tree.lua.git",
})

-- pass to setup along with your other config
require("nvim-tree").setup({
	actions = {
		open_file = {
			quit_on_open = true,
			resize_window = true,
		},
	},
})
