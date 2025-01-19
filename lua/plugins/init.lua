local lazy = require("lazy")
local plugins = require 'plugins.load'
local config = require 'plugins.configs.lazy'

lazy.setup(plugins, config)

local path_configs = string.format("%s/lua/plugins/configs", vim.fn.stdpath("config"))
local required_files = vim.fn.glob(path_configs .. '/requireds' .. '/*.lua', false, true)
local optional_files = vim.fn.glob(path_configs .. '/optionals' .. '/*.lua', false, true)
for _, file in ipairs(required_files) do
    vim.cmd("source " .. file)
end
for _, file in ipairs(optional_files) do
    vim.cmd("source " .. file)
end
