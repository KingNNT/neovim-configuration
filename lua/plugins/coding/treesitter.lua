return {
    "romus204/tree-sitter-manager.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("tree-sitter-manager").setup({
            ensure_installed = {
                'css', 'html', 'javascript', 'lua', 'php', 'python', 'scss', 'tsx', 'typescript', 'vim', 'vue',
            },
            auto_install = true,
            highlight = true,
        })
    end,
}
