local M = {}

local load = require("utils.load")
local lazy = require("bootstrap.lazy")

--- Init app
M.init = function()
  load.load_core()
  lazy.boot_lazy()
  load.load_plugin()
  load.load_mappings()
end

return M
