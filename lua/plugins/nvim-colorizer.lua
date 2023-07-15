return {
        "NvChad/nvim-colorizer.lua",
        config = function()
                local c = require 'colorizer'
                c.setup {}

                -- nvim-colorizer doesn't work on the initial buffer if we lazy load, so force it to attach
                -- on load.
                local bufnr = vim.api.nvim_get_current_buf()
                if bufnr and not c.is_buffer_attached(bufnr) then
                        c.attach_to_buffer(bufnr)
                end
        end,
        event = 'VeryLazy'
}
