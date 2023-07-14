local M = {}

local env = require "core.enviroment"
local load = require("utils.load")
local lazy = require("bootstrap.lazy")
local until_common = require("utils.common")
local const = require("core.constant")
--- Init app
M.init = function()
  load.load_core()
  if env.plug_manager == const.plug_manager_lazy then
    lazy.boot_lazy()
  end
  load.load_plugin()
  load.load_mappings()
end

return M
