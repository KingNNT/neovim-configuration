require("plugins.manager.lazy")

local core_conf_files = {
    "neodev.lua",
    --
    "aerial.lua",
    "bufferline.lua",
    "Comment.lua",
    "conform.lua",
    "dashboard-nvim.lua",
    "formatter.lua",
    "gitsigns.lua",
    "indent-blankline.lua",
    "lspconfig.lua",
    "lualine.lua",
    "markdown-preview.vim",
    "mason.lua",
    "neogen.lua",
    "neotest.lua",
    "nvim-autopairs.lua",
    "nvim-cmp.lua",
    "nvim-colorizer.lua",
    "nvim-tree.lua",
    "nvim-treesitter.lua",
    "nvim-ts-context-commentstring.lua",
    "nvim-ufo.lua",
    "nvim-web-devicons.lua",
    "rainbow-delimiters.lua",
    "telescope.lua",
    "todo-comments.lua",
    "tokyonight.lua",
    "vim-test.vim",
    "which-key.lua"
}

-- source all the config files
for _, name in ipairs(core_conf_files) do
    local path = string.format("%s/lua/plugins/configs/%s", vim.fn.stdpath("config"), name)
    local source_cmd = "source " .. path
    vim.cmd(source_cmd);
end
