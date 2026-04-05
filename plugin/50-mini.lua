vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.clue").setup({
  clues = {
    -- { mode = "n", keys = "<Leader>b", desc = "+Buffer" },
    -- { mode = "n", keys = "<Leader>e", desc = "+Explore/Edit" },
    -- { mode = "n", keys = "<Leader>f", desc = "+Find" },
    -- { mode = "n", keys = "<Leader>g", desc = "+Git" },
    { mode = "n", keys = "<Leader>l", desc = "+Language" },
    -- { mode = "n", keys = "<Leader>m", desc = "+Map" },
    -- { mode = "n", keys = "<Leader>o", desc = "+Other" },
    -- { mode = "n", keys = "<Leader>s", desc = "+Session" },
    -- { mode = "n", keys = "<Leader>t", desc = "+Terminal" },
    -- { mode = "n", keys = "<Leader>v", desc = "+Visits" },
    --
    -- { mode = "x", keys = "<Leader>g", desc = "+Git" },
    { mode = "x", keys = "<Leader>l", desc = "+Language" },
  },
  -- Explicitly opt-in for set of common keys to trigger clue window
  triggers = {
    { mode = { "n", "x" }, keys = "<Leader>" }, -- Leader triggers
    -- { mode = "n", keys = "\\" }, -- mini.basics
    -- { mode = { "n", "x" }, keys = "[" }, -- mini.bracketed
    { mode = { "n", "x" }, keys = "]" },
    { mode = "i", keys = "<C-x>" }, -- Built-in completion
    { mode = { "n", "x" }, keys = "g" }, -- `g` key
    { mode = { "n", "x" }, keys = "'" }, -- Marks
    { mode = { "n", "x" }, keys = "`" },
    { mode = { "n", "x" }, keys = '"' }, -- Registers
    { mode = { "i", "c" }, keys = "<C-r>" },
    { mode = "n", keys = "<C-w>" }, -- Window commands
    { mode = { "n", "x" }, keys = "s" }, -- `s` key (mini.surround, etc.)
    { mode = { "n", "x" }, keys = "z" }, -- `z` key
  },
})
