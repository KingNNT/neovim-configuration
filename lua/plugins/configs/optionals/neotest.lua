require("neotest").setup({
    adapters = {
        require('neotest-jest')({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
                return vim.fn.getcwd()
            end,
        }),
        require("neotest-playwright").adapter({
            options = {
                persist_project_selection = true,
                enable_dynamic_test_discovery = true,
            }
        }),
        require("neotest-python")({
            -- Extra arguments for nvim-dap configuration
            -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
            dap = { justMyCode = false },
            -- Command line arguments for runner
            -- Can also be a function to return dynamic values
            args = { "--log-level", "DEBUG" },
            -- Runner to use. Will use pytest if available by default.
            -- Can be a function to return dynamic value.
            runner = "pytest",
            -- Custom python path for the runner.
            -- Can be a string or a list of strings.
            -- Can also be a function to return dynamic value.
            -- If not provided, the path will be inferred by checking for
            -- virtual envs in the local directory and for Pipenev/Poetry configs
            python = ".venv/bin/python",
            -- Returns if a given file path is a test file.
            -- NB: This function is called a lot so don't perform any heavy tasks within it.
            is_test_file = function(file_path)
            end,
            -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
            -- instances for files containing a parametrize mark (default: false)
            pytest_discover_instances = true,
        })
    }
})

-- Config for adapters
require("neotest-playwright").adapter({
    -- default values shown
    options = {
        persist_project_selection = false,

        enable_dynamic_test_discovery = false,

        preset = "none", -- "none" | "headed" | "debug"

        -- get_playwright_binary = function()
        --   return vim.loop.cwd() + "/node_modules/.bin/playwright"
        -- end,

        -- get_playwright_config = function()
        --   return vim.loop.cwd() + "/playwright.config.ts"
        -- end,

        -- Controls the location of the spawned test process.
        -- Has no affect on neither the location of the binary nor the location of the config file.
        -- get_cwd = function()
        --   return vim.loop.cwd()
        -- end,

        -- env = { },

        -- Extra args to always passed to playwright. These are merged with any extra_args passed to neotest's run command.
        -- extra_args = { },

        -- Filter directories when searching for test files. Useful in large projects (see performance notes).
        -- filter_dir = function(name, rel_path, root)
        --   return name ~= "node_modules"
        -- end,
    },
})
