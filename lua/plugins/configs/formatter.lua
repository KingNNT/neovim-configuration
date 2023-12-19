-- Utilities for creating configurations
local util = require "formatter.util"

local prettier = function()
    return {
        exe = "npx prettier",
        args = {
            "--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
        },
        stdin = true,
    }
end

local eslint = function()
    return {
        exe = "npx eslint",
        args = {
            "--stdin",
            "--stdin-filename", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            "--fix-to-stdout"
        },
        stdin = true
    }
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
    -- Enable or disable logging
    logging = false,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        lua = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.lua").stylua,

            -- You can also define your own configuration
            function()
                -- Supports conditional formatting
                if util.get_current_buffer_file_name() == "special.lua" then
                    return nil
                end

                -- Full specification of configurations is down below and in Vim help
                -- files
                return {
                    exe = "stylua",
                    args = {
                        "--search-parent-directories",
                        "--stdin-filepath",
                        util.escape_path(util.get_current_buffer_file_path()),
                        "--",
                        "-",
                    },
                    stdin = true,
                }
            end
        },
        vue = {
            prettier
        },
        typescript = {
            prettier
        },
        scss = {
            prettier
        },
        php = {
            function()
                return {
                    exe = './vendor/bin/phpcbf',
                    args = {
                        "--standard=PSR12",
                        util.escape_path(util.get_current_buffer_file_path()),
                    },
                    stdin = false,
                }
            end
        },
        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}
