local const = require 'core.constant'
local env = require 'core.enviroment'
if env.plug_manager == const.plug_manager_vim_plug then
    vim.cmd.colorscheme("night-owl")
end
