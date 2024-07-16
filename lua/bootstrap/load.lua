local M = {}

-- Load core
M.load_core = function()
    require('core')
end

-- Load key mappings
M.load_mappings = function()
    require('core.key-mapping')
end

-- Load plugin
M.load_plugin = function()
    require('plugins')
end

return M
