local M = {}

M.opts = {
    headerMaxWidth = 80,
}

M.keys = {
    { "<leader>sr", function() require('grug-far').open() end, desc = "Search and Replace", mode = { "n", "v" } },
}

return M
