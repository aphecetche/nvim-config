-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

-- wk.register({
--   f = {
--     name = "file", -- optional group name
--     f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
--     n = { "New File" }, -- just a label. don't create any mapping
--     e = "Edit File", -- same as above
--     ["1"] = "which_key_ignore",  -- special label to hide it in the popup
--     b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
--   },
-- }, { prefix = "<leader>" })

vim.api.nvim_create_autocmd("FileType", {
        desc = "Markdown keymaps",
        callback = function(args)
                if args.match == "markdown" then
                        local wk = require("which-key")
                        wk.add({
                                { "<leader>m",  group = "Markdown" },
                                { "<leader>mv", "<cmd>silent !open -a Marked\\ 2.app '%:p'<cr>", desc = "Open in Marked 2" } })
                end
        end
})

--:nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p'<cr>

-- colors

-- vim.api.nvim_create_autocmd("BufWinEnter", {
--     callback = function()
--         vim.cmd.match([[ExtraWhitespace /\s\+$/]])
--         --        vim.cmd.match([[Tab /\t/]])
--     end
-- })

vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
                vim.opt.colorcolumn = "80"

                vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#5b595d" })
                vim.api.nvim_set_hl(0, "ExtraWhitespace", { bg = "red" })
                vim.api.nvim_set_hl(0, "Tab", { bg = "red" })
                vim.cmd.match([[ExtraWhitespace /\s\+$/]])
                vim.cmd([[2match Tab /\t/]])
        end
})
