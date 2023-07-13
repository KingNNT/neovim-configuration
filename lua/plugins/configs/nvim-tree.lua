-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

local api = require "nvim-tree.api"
local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end

-- global
vim.api.nvim_set_keymap("n", "<F4>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })

-- on_attach
vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
