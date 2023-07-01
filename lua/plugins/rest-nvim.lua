return {
        "rest-nvim/rest.nvim",
        ft = "http",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
                result_split_in_place = true,
                result = {
                        show_curl_command = true,
                        show_url = true,
                        show_http_info = true,
                        show_headers = true,
                        -- formatters = {
                        --         json = "jq", }
                }
        }

}
