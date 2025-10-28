-- disable netrw (in favor of nvim-tree)
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- Set leader(s)
--   make sure to set `mapleader` before lazy so our mappings are correct
vim.g.mapleader          = ","

--try to require the module, and do not error when one of them cannot be
---loaded, but do notify if there was an error.
---@param module string module to load
local function safeRequire(module)
        local success, _ = pcall(require, module)
        if success then return end
        local msg = "Error loading " .. module
        local notifyLoaded, _ = pcall(require, "notify")
        if notifyLoaded then
                vim.notify(" " .. msg, vim.log.levels.ERROR)
        else
                vim.cmd(('echohl Error | echo "%s" | echohl None'):format(msg))
        end
end

-- Install package manager
safeRequire("core.install-lazy")

-- install plugins
--   using a directory (./lua/plugins, simply referenced as 'plugins',
--   the lua prefix is implied) where all *.lua files will be merged by lazy
require("lazy").setup({ import = "plugins" },
        {
                change_detection = {
                        -- automatically check for config file changes and reload the ui
                        enabled = true,
                        notify = true, -- get a notification when changes are found
                },
        })

-- my keymaps
safeRequire("core.keymaps")

-- my autocommands
safeRequire("core.autocmds")

-- my options
safeRequire("core.options")

-- my commands
-- safeRequire("core.commands")

-- choose a colorscheme
vim.cmd.colorscheme("monokai-pro-spectrum")

safeRequire("lsp")
