local wk = require("which-key")
wk.add({
	{ "<leader>m", group = "Markdown" },
	{ "<leader>mv", "<cmd>silent !open -a Marked\\ 2.app '%:p'<cr>", desc = "Open in Marked 2" },
})
