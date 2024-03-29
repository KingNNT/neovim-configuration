local M = {}
local merge_tb = vim.tbl_deep_extend

-- Load core
M.load_core = function()
    require('core.globals')
    require('core')
end

-- Load config
M.load_config = function()
    local config = require "configs.default"
    return config
end

-- Load key mappings
M.load_mappings = function(section, mapping_opt)
    vim.schedule(function()
        local function set_section_map(section_values)
            if section_values.plugin then
                return
            end

            section_values.plugin = nil

            for mode, mode_values in pairs(section_values) do
                local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})
                for keybind, mapping_info in pairs(mode_values) do
                    -- merge default + user opts
                    local opts = merge_tb("force", default_opts, mapping_info.opts or {})

                    mapping_info.opts, opts.mode = nil, nil
                    opts.desc = mapping_info[2]

                    vim.keymap.set(mode, keybind, mapping_info[1], opts)
                end
            end
        end

        local core_mappings = require("configs.default").core_mappings


        if type(section) == "string" then
            core_mappings[section]["plugin"] = nil
            core_mappings = { core_mappings[section] }
        end

        for _, sect in pairs(core_mappings) do
            set_section_map(sect)
        end
    end)
end

-- Load plugin
M.load_plugin = function()
    require('plugins')
end

return M
