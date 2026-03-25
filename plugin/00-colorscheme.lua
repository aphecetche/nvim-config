vim.pack.add({
	"https://github.com/loctvl842/monokai-pro.nvim.git",
})

require("monokai-pro").setup({ filter = "spectrum" })

vim.cmd.colorscheme("monokai-pro")
