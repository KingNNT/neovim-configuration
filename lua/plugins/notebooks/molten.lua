return {
    "benlubas/molten-nvim",
    build = ":UpdateRemotePlugins",
    ft = { "python", "jupyter" },
    dependencies = {
        "3rd/image.nvim",
        "GCBallesteros/jupytext.nvim",
    },
    init = function()
        vim.g.molten_auto_open_output = false
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_wrap_output = true
        vim.g.molten_virt_text_output = true
        vim.g.molten_output_win_max_height = 20
    end,
    keys = {
        { "<leader>mi", "<cmd>MoltenInit<CR>",              desc = "Molten Init" },
        { "<leader>mc", "<cmd>MoltenEvaluateOperator<CR>",  desc = "Molten Evaluate Operator" },
        { "<leader>mc", ":<C-u>MoltenEvaluateVisual<CR>",   mode = "v", desc = "Molten Evaluate Visual" },
        { "<leader>mr", "<cmd>MoltenReevaluateCell<CR>",    desc = "Molten Reevaluate Cell" },
        { "<leader>md", "<cmd>MoltenDelete<CR>",            desc = "Molten Delete" },
        { "<leader>mo", "<cmd>MoltenShowOutput<CR>",        desc = "Molten Show Output" },
        { "<leader>mh", "<cmd>MoltenHideOutput<CR>",        desc = "Molten Hide Output" },
    },
}
