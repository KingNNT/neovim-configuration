local lazy = require("lazy")
local plugins = require 'plugins.load'
local config = require 'plugins.configs.lazy'

lazy.setup(plugins, config)
