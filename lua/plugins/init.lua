local env = require "core.enviroment"
local const = require "core.constant"

if env.plug_manager == const.plug_manager_vim_plug then
    require("plugins.manager.vim-plug")
elseif env.plug_manager == const.plug_manager_lazy then
    require("plugins.manager.lazy")
end

local core_conf_files = {
    "coc.lua",
    "Comment.lua",
    "dashboard-nvim.lua",
    "emmet-vim.lua",
    "gitsigns.lua",
    "indent-blankline.lua",
    "lspconfig.lua",
    "lualine.lua",
    "night-owl.lua",
    "nvim-tree.lua",
    "nvim-treesitter.lua",
    "nvim-web-devicons.lua",
    "tagbar.vim",
    "telescope.lua",
    "toggleterm.lua",
    "vim-dadbod-ui.vim",
    "vim-test.vim",
    "vimspector.vim",
}

-- source all the config files
for _, name in ipairs(core_conf_files) do
    local path = string.format("%s/lua/plugins/configs/%s", vim.fn.stdpath("config"), name)
    local source_cmd = "source " .. path
    vim.cmd(source_cmd);
end
