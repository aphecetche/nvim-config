local opt = vim.opt

opt.number = true
opt.tabstop = 4 -- number of visual spaces per TAB (\t)
opt.expandtab = true -- TABs are spaces

opt.ignorecase = true -- case insensitive search
opt.smartcase = true -- case-sensitive if expression contains a capital letter

opt.path:append(vim.fn.getcwd() .. "/**")

opt.completeopt = {'menu', 'menuone', 'noselect'}
