local builtin = require('telescope.builtin')
local trouble = require("trouble.sources.telescope")
local wk = require("which-key")

wk.add({
    {
        "<leader>f", group = "Find"
    },
    {
        "<leader>ff", builtin.find_files, desc = "Find file"
    },
    {
        "<leader>fg", builtin.live_grep, desc = "Find word by grep"
    },
    {
        "<leader>fb", builtin.buffers, desc = "Find buffers"
    },
    {
        "<leader>fh", builtin.help_tags, desc = "Find by tag"
    }
})

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
    defaults = {
        mappings = {
            i = { ["<c-t>"] = trouble.open },
            n = { ["<c-t>"] = trouble.open },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
