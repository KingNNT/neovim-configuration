require("plugins.manager.lazy")

local core_conf_files = {
    "Comment.lua",
    "dashboard-nvim.lua",
    "emmet-vim.lua",
    "gitsigns.lua",
    "indent-blankline.lua",
    "lspconfig.lua",
    "lualine.lua",
    "mason.lua",
    "neogen.lua",
    "nvim-autopairs.lua",
    "nvim-tree.lua",
    "nvim-treesitter.lua",
    "nvim-web-devicons.lua",
    "tagbar.vim",
    "telescope.lua",
    "toggleterm.lua",
    "tokyonight.lua",
    "vim-dadbod-ui.vim",
    "vim-test.vim",
    "vimspector.vim",
    "which-key.lua"
}

-- source all the config files
for _, name in ipairs(core_conf_files) do
    local path = string.format("%s/lua/plugins/configs/%s", vim.fn.stdpath("config"), name)
    local source_cmd = "source " .. path
    vim.cmd(source_cmd);
end
