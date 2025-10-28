local opts = {

    winopts = {
        width   = 0.8,
        height  = 0.9,
        preview = {
            hidden       = "nohidden",
            vertical     = "up:45%",
            horizontal   = "right:50%",
            layout       = "flex",
            flip_columns = 120,
            delay        = 10,
            winopts      = { number = true },
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
    -- fzf-vim first to get the fzf-vim eq commands (e.g. Rg)
    -- then telescope for the look
    require('fzf-lua').setup({ "fzf-vim" })
    require('fzf-lua').setup({ "telescope", opts })
    -- require('fzf-lua').setup({ "telescope", opts })
    local wk = require("which-key")
    local fzf = require("fzf-lua")
    wk.add({
    { "<leader>g", group = "git" },
    { "<leader>gs", fzf.git_status, desc = "git status" }})
end

return M
