return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "haydenmeade/neotest-jest",
        "thenbe/neotest-playwright",
        "nvim-neotest/neotest-python",
    },
    cmd = "Neotest",
    config = function()
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
                    },
                }),
                require("neotest-python")({
                    dap = { justMyCode = false },
                    args = { "--log-level", "DEBUG" },
                    runner = "pytest",
                    python = ".venv/bin/python",
                    is_test_file = function(file_path) end,
                    pytest_discover_instances = true,
                }),
            },
        })

        require("neotest-playwright").adapter({
            options = {
                persist_project_selection = false,
                enable_dynamic_test_discovery = false,
                preset = "none",
            },
        })
    end,
}
