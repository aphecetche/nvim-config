local on_attach = function(bufnr)
    local gs = require("gitsigns")
    local wk = require("which-key")
    local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', '>c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
    end, { expr = true })

    map('n', '<c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
    end, { expr = true })

    wk.register({
        name = "+git",
        g = {
            h = {
                name = "hunks",
                s = { gs.stage_hunk, "stage hunk" },
                r = { gs.reset_hunk, "reset hunk" },
                S = { gs.stage_buffer, "stage buffer" },
                u = { gs.undo_stage_hunk, "under stage hunk" },
                R = { gs.reset_buffer, "reset buffer" },
                p = { gs.preview_hunk, "preview hunk" },
            },
            d = {
                name = "diff",
                d = { gs.diffthis, "diff this" },
                D = { function() gs.diffthis('~') end, "diff this ~" },
            },
            b = {
                name = "blame",
                b = { function() gs.blame_line { full = true } end, "blame line" },
                l = { gs.toggle_current_line_blame, "toggle current line blame" },
                d = { gs.toggle_deleted, "toggle deleted" },
            }
        }
    }, { prefix = "<leader>" })

    wk.register({
        g = {
            h = {
                name = "+gitsigns (visual mode)",
                s = { function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, "stage hunk" },
                r = { function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, "reset hunk" },
            }
        }
    }, { mode = "v", prefix = "<leader>" })

    -- -- Text object
    -- map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end

return {
    "lewis6991/gitsigns.nvim",
    opts = {
        on_attach                    = on_attach,
        signs                        = {
            add          = { text = '│' },
            change       = { text = '│' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
            follow_files = true
        },
        attach_to_untracked          = true,
        current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 300,
            ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil,   -- Use default
        max_file_length              = 40000, -- Disable if file is longer than this (in lines)
        preview_config               = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },
        yadm                         = {
            enable = false
        },
    },
}
