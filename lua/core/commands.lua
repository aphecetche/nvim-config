-- vim.api.nvim_create_user_command("Format",":lua vim.lsp.buf.format()<CR>",{})
vim.api.nvim_create_user_command("Format",require("core.functions").format,{})
