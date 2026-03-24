return {
  -- -- Configure LazyVim to load gruvbox
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "monokai-pro-spectrum",
  --   },
  -- },
  -- "folke/tokyonight.nvim",

  -- the colorscheme should be available when starting Neovim
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme monokai-pro-spectrum]])
    end,
  },
}

-- return {
--   "loctvl842/monokai-pro.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("monokai-pro").setup()
--     vim.cmd.colorscheme("monokai-pro-spectrum")
--   end,
-- }
