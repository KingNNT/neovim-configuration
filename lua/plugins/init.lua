require("plugins.manager.lazy")

local core_conf_files = {
    "Comment.lua",
    "dashboard-nvim.lua",
    "gitsigns.lua",
    "indent-blankline.lua",
    "lspconfig.lua",
    "lualine.lua",
    "mason.lua",
    "mini.lua",
    "neogen.lua",
    "null-ls.lua",
    "nvim-autopairs.lua",
    "nvim-cmp.lua",
    "nvim-tree.lua",
    "nvim-treesitter.lua",
    "nvim-web-devicons.lua",
    "tagbar.vim",
    "telescope.lua",
    "todo-comments.lua",
    "toggleterm.lua",
    "tokyonight.lua",
    "vim-dadbod-ui.vim",
    "vim-test.vim",
    "which-key.lua"
}

-- source all the config files
for _, name in ipairs(core_conf_files) do
    local path = string.format("%s/lua/plugins/configs/%s", vim.fn.stdpath("config"), name)
    local source_cmd = "source " .. path
    vim.cmd(source_cmd);
end
