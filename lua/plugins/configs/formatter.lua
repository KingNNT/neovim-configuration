-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace,
      -- Remove trailing whitespace without 'sed'
      -- require("formatter.filetypes.any").substitute_trailing_whitespace,
    }
  }
}

-- Redefine the :Format command to avoid conflicts
vim.api.nvim_create_user_command(
  "Format",
  function()
    vim.notify("The :Format command has deprecated", vim.log.levels.WARN)
  end,
  { desc = "Notify user about deprecated Format command" }
)

-- Define your custom command :FormatFormatter
vim.api.nvim_create_user_command(
  "FormatFormatter",
  function()
    -- Call the formatter.nvim format functionality
    require('formatter').format()
  end,
  { desc = "Run Formatter.nvim with custom command" }
)