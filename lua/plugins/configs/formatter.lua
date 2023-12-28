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
        vue = {
            prettier
        },
        typescript = {
            prettier
        },
        typescriptreact = {
            prettier
        },
        json = {
            require("formatter.filetypes.lua").json,
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
