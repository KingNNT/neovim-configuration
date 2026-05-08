return {
    "MagicDuck/grug-far.nvim",
    cmd = { "GrugFar", "GrugFarWithin" },
    opts = { headerMaxWidth = 80 },
    keys = {
        { "<leader>sr", function() require('grug-far').open() end, desc = "Search and Replace", mode = { "n", "v" } },
    },
}
