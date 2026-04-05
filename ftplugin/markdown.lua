vim.keymap.set(
  "n",
  "<leader>mv",
  "<cmd>silent !open -a Marked\\ 2.app '%:p'<cr>",
  { buffer = true, desc = "Open in Marked 2" }
)
