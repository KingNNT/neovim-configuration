return {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
        library = { "nvim-dap-ui" },
        integrations = {
            lspconfig = true,
            cmp = true,
            coq = false,
        },
        enabled = function(root_dir)
            return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
        end,
    },
}
