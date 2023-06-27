return {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
                "nvim-tree/nvim-web-devicons",
        },
        opts = function()
                return {
                        view = {
                                side = "left"
                        },
                        actions = {
                                open_file = {
                                        quit_on_open = true
                                }
                        }

                }
        end
}
