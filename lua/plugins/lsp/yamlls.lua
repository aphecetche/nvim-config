-- local util = require("lspconfig.util")

return {
    -- root_dir = function(fname)
    --     if vim.fs.basename(fname) == "spack.yaml" then
    --         vim.notify(vim.print("toto=", vim.fs.dirname(fname)))
    --         return vim.fs.dirname(fname)
    --     end
    --     return util.find_git_ancestor(fname)
    -- end,
    settings = {
        yaml = {
            redhat = { telemetry = { enable = false } },
            validate = true,
            format = {
                enable = true,
            },
            editor = {
                formatOnType = true,
            },
            schemas = {
                kubernetes = { "deploy*/*.yaml" },
                -- the spack-schema.json file is generated using :
                -- spack python -c 'from spack.schema.env import schema; import json; print(json.dumps(schema))' > spack-schema.json
                ["file:///Users/laurent/spack-schema.json"] = "spack.yaml",
                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = { ".gitlab-ci.{yml,yaml}", ".gitlab/ci/*.{yml,yaml}" },
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = { "*docker-compose*.{yml,yaml}" }
            },
            -- customTags = { "!reference sequence" }

        }
    }
}
