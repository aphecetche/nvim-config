-- https://github.com/LuaLS/lua-language-server/wiki/Annotations#annotations
-- https://github.com/LuaLS/lua-language-server/wiki/Settings

return {
        settings = {
                Lua = {
                        runtime = {
                                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                                version = "LuaJIT",
                        },
                        diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = { "vim" },
                                disable = { "trailing-space" }, -- formatter already does that
                        },
                        telemetry = {
                                enable = false,
                        },
                        format = {
                                enable = true,
                                defaultConfig = {
                                        indent_style = "space",
                                        indent_size = "2",
                                        quote_style = "single"
                                }
                        },
                },
        }
}
