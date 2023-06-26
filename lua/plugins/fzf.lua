local M = {
        "ibhagwan/fzf-lua",
        dependencies = {
                "nvim-tree/nvim-web-devicons",
                { "junegunn/fzf", build = "./install --bin" },
        },
        keys = { { "<c-p>", function() require("fzf-lua").files() end, } },
        cmd = { "Rg", "FzfLua" }
}

M.config = function()
        vim.api.nvim_create_user_command("Rg", function(opts)
                require("fzf-lua").grep({ search = opts.fargs[1] })
        end, { nargs = "*" })
end

return M
