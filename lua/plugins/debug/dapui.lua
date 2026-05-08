return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
    },
    cmd = { "DapContinue", "DapToggleBreakpoint" },
    config = function()
        require("dapui").setup()
    end,
}
