return {
	{
		"loctvl842/monokai-pro.nvim",
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
		opts = {
			options = {
				dim_inactive = true,
			},
			styles = {
				comments = "italic",
				keywords = "bold",
				types = "italic,bold",
			},
			palettes = {
				nordfox = {
					-- A palette also defines the following:
					--   bg0, bg1, bg2, bg3, bg4, fg0, fg1, fg2, fg3, sel0, sel1, comment
					--
					-- These are the different foreground and background shades used by the theme.
					-- The base bg and fg is 1, 0 is normally the dark alternative. The others are
					-- incrementally lighter versions.
					-- bg0 = "#030303",
					-- bg1 = "#060606",

					-- sel is different types of selection colors.
					sel0 = "#3e4a5b", -- Popup bg, visual selection bg
					sel1 = "#4f6074", -- Popup sel bg, search bg

					-- comment is the definition of the comment color.
					comment = "#60728a",
				},
			},
		},
	},
	{
		"RRethy/nvim-base16",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {
			base00 = "#16161D",
			-- base00 = '#030303',
			base01 = "#2c313c",
			base02 = "#3e4451",
			base03 = "#6c7891",
			base04 = "#565c64",
			base05 = "#abb2bf",
			base06 = "#9a9bb3",
			base07 = "#c5c8e6",
			base08 = "#e06c75",
			base09 = "#d19a66",
			base0A = "#e5c07b",
			base0B = "#98c379",
			base0C = "#56b6c2",
			base0D = "#0184bc",
			base0E = "#c678dd",
			base0F = "#a06949",
		},
		config = function(_, opts)
			require("base16-colorscheme").setup(opts)
			vim.opt.colorcolumn = "80"
		end,
	},
	-- tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = { style = "moon" },
	},

	-- catppuccin
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		opts = {
			integrations = {
				alpha = true,
				cmp = true,
				gitsigns = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				lsp_trouble = true,
				mini = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				navic = { enabled = true },
				neotest = true,
				noice = true,
				notify = true,
				nvimtree = true,
				semantic_tokens = true,
				telescope = true,
				treesitter = true,
				which_key = true,
			},
		},
	},
}
