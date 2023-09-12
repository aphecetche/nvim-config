return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = function()
        return {
            view = {
                side = "left",
                width = {
                    max = -1
                }
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                    resize_window = true
                }
            }

        }
    end
}
