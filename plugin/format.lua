vim.pack.add({ "https://github.com/stevearc/conform.nvim.git" })

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua", lsp_format = false },
        python = { "ruff" },
        cpp = { "clang-format", lsp_format = "fallback" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
        async = false,
    },
})

vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line =
            vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({
        async = true,
        lsp_format = "fallback",
        range = range,
    })
end, { range = true })
