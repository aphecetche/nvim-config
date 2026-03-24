return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      local lint = require("lint")

      -- Keep existing config if any
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.python = { "flake8" }

      -- Detect Spack package file
      local function is_spack_package()
        local filepath = vim.api.nvim_buf_get_name(0)
        local m = filepath:match("/spack_repo/.+/packages/.+")
        local result = m ~= nil
        print("DEBUG:", filepath, m, result)
        return result
      end

      -- Locate Spack Python module path
      local function get_spack_python_path()
        local spack_bin = vim.fn.exepath("spack")
        if spack_bin == "" then
          return nil
        end

        local spack_root = vim.fn.fnamemodify(spack_bin, ":h:h")
        return spack_root .. "/lib/spack"
      end

      -- Inject PYTHONPATH per buffer (only when needed)
      local function setup_spack_env()
        if not is_spack_package() then
          return
        end

        local spack_path = get_spack_python_path()
        if spack_path then
          vim.env.PYTHONPATH = spack_path .. ":" .. (vim.env.PYTHONPATH or "")
        end
      end

      -- Apply env when entering buffer
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
        callback = setup_spack_env,
      })

      -- Use condition to enable flake8 only for Spack packages
      lint.linters.flake8.condition = is_spack_package

      return opts
    end,
  },
}
