-- pick up one of the lua file from colorschemes subdir
local colorscheme = require("plugins.colorschemes.monokai-pro")

-- a colorscheme is VeryLazy
local t = vim.tbl_deep_extend("force",colorscheme,{event="VeryLazy"})

return t

