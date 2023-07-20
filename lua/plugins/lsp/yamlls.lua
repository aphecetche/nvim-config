return {
    settings = {
        yaml = {
            validate = true,
            format = {
                enable = true,
            },
            editor = {
                formatOnType = true,
            },
            schemas = {
                kubernetes = "*.yaml",
                -- the spack-schema.json file is generated using :
                -- spack python -c 'from spack.schema.env import schema; import json; print(json.dumps(schema))' > spack-schema.json
                ["file:///Users/laurent/spack-schema.json"] = "spack.yaml",
                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab*.{yml,yaml}",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
            }

        }
    }
}
