local opts = {
    winopts = {
        preview = {
            -- do not show the preview window
            hidden = "hidden"
        }
    }
}

local M = {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        { "junegunn/fzf", build = "./install --bin" },
    },
    opts = opts,
    keys = { { "<c-p>", function() require("fzf-lua").files(opts) end, } },
    cmd = { "Rg", "FzfLua" },
}

M.config = function()
    -- vim.api.nvim_create_user_command("Rg", function(opts)
    --     require("fzf-lua").grep({ search = table.concat(opts.fargs, " ") })
    -- end, { nargs = "*" })
    require('fzf-lua').setup({ 'fzf-vim' })
    local wk = require("which-key")
    local fzf = require("fzf-lua")
    wk.register({
        g = {
            name = "+git",
            s = { fzf.git_status, "git status" },
        },
    }, { prefix = "<leader>" })
end

return M
