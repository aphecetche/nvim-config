vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim.git" })

local on_attach = function(bufnr)
	local gs = require("gitsigns")
	local wk = require("which-key")
	local function map(mode, l, r, opts)
		opts = opts or {}
		opts.buffer = bufnr
		vim.keymap.set(mode, l, r, opts)
	end

	-- Navigation
	map("n", ">c", function()
		if vim.wo.diff then
			return "]c"
		end
		vim.schedule(function()
			gs.next_hunk()
		end)
		return "<Ignore>"
	end, { expr = true })

	map("n", "<c", function()
		if vim.wo.diff then
			return "[c"
		end
		vim.schedule(function()
			gs.prev_hunk()
		end)
		return "<Ignore>"
	end, { expr = true })

	wk.add({
		{ "<leader>", group = "git" },
		{ "<leader>gb", group = "blame" },
		{
			"<leader>gbb",
			function()
				gs.blame_line({ full = true })
			end,
			desc = "blame line",
		},
		{ "<leader>gbd", gs.toggle_deleted, desc = "toggle deleted" },
		{ "<leader>gbl", gs.toggle_current_line_blame, desc = "toggle current line blame" },
		{ "<leader>gd", group = "diff" },
		{ "<leader>gdD", gs.diffthis, desc = "diff this ~" },
		{
			"<leader>gdd",
			function()
				gs.diffthis("~")
			end,
			desc = "diff this",
		},
		{ "<leader>gh", group = "hunks" },
		{ "<leader>ghR", gs.reset_buffer, desc = "reset buffer" },
		{ "<leader>ghS", gs.stage_buffer, desc = "stage buffer" },
		{ "<leader>ghp", gs.preview_hunk, desc = "preview hunk" },
		{ "<leader>ghr", gs.reset_hunk, desc = "reset hunk" },
		{ "<leader>ghs", gs.stage_hunk, desc = "stage hunk" },
		{ "<leader>ghu", gs.undo_stage_hunk, desc = "undo stage hunk" },
		{
			mode = { "v" },
			{ "<leader>gh", group = "gitsigns (visual mode)" },
			{
				"<leader>ghr",
				function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end,
				desc = "reset hunk",
			},
			{
				"<leader>ghs",
				function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end,
				desc = "stage hunk",
			},
		},
	})

	-- -- Text object
	-- map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end

require("gitsigns").setup({
	on_attach = on_attach,
	signs = {
		add = { text = "│" },
		change = { text = "│" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 300,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})
