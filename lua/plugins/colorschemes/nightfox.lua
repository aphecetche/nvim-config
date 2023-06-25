return {
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
        }
}
