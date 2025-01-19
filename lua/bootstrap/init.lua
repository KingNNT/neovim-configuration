local M = {}

--- Init app
M.init = function()
  require('core.globals')
  require('core.options')
  require('core.lazy')
  require('plugins')
  require('core.key-mapping')
end

return M
