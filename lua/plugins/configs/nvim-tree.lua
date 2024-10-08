-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local api = require "nvim-tree.api"
local wk = require("which-key")
wk.add({
    {
        "<leader>t", group = "NvimTree"
    },
    {
        "<leader>tt", ":NvimTreeToggle<cr>", desc = "NvimTree toggle", mode = { "n" }
    }
})

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

require("nvim-tree").setup {
    ---
    on_attach = my_on_attach,
    ---
}
