return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 960,
    config = function()
        vim.cmd.colorscheme("tokyonight")
    end,
}
