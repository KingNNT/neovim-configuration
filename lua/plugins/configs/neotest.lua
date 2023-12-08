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
    },
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
