local function setup(opts)
    local ts = require("formatter.filetypes.typescript")
    require("formatter").setup({
        logging = true,
        filetype = {
            typescript = {
                require("formatter.filetypes.typescript").prettierd
            },
            typescriptreact = {
                require("formatter.filetypes.typescriptreact").prettierd
            },
        }
    })
    vim.api.nvim_create_autocmd("BufWritePost", {
        desc = "format on write",
        pattern = { "*.tsx", "*.ts" },
        command = ":FormatWrite"
    })
end

return {
    "mhartington/formatter.nvim",
    opts = {},
    config = function(_, opts)
        setup(opts)
    end
}
