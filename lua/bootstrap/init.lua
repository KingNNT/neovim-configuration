local M = {}

local load = require("utils.load")
--- Init app
M.init = function()
  load.load_core()
  load.load_mappings()
  load.load_plugin()
end

return M
