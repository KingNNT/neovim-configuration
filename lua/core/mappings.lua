-- n, v, i, t = mode names

local M = {}

M.general = {
    i = {
        -- navigate within insert mode
        ["<C-h>"] = { "<Left>", "Move left" },
        ["<C-l>"] = { "<Right>", "Move right" },
        ["<C-j>"] = { "<Down>", "Move down" },
        ["<C-k>"] = { "<Up>", "Move up" },
    },

    n = {
        ["<Esc>"] = { ":noh <CR>", "Clear highlights" },
        -- switch between windows
        ["<C-h>"] = { "<C-w>h", "Window left" },
        ["<C-l>"] = { "<C-w>l", "Window right" },
        ["<C-j>"] = { "<C-w>j", "Window down" },
        ["<C-k>"] = { "<C-w>k", "Window up" },

        -- save
        ["<C-s>"] = { "<cmd> w <CR>", "Save file" },

        -- Copy all
        ["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },

        -- line numbers
        ["<leader>n"] = { "<cmd> set nu! <CR>", "Toggle line number" },
        ["<leader>rn"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },

        -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
        -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
        -- empty mode is same as using <cmd> :map
        -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
        ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
        ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },

        -- new buffer
        ["<leader>b"] = { "<cmd> enew <CR>", "New buffer" },
        ["<leader>ch"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },

        ["<leader>fm"] = {
            function()
                vim.lsp.buf.format { async = true }
            end,
            "LSP formatting",
        },
    },

    t = {
        ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
    },

    v = {
        ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    },

    x = {
        ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
        ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        -- Don't copy the replaced text after pasting in visual mode
        -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
        ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
    },
}

M.whichkey = {
    plugin = true,

    n = {
        ["<leader>wK"] = {
            function()
                vim.cmd "WhichKey"
            end,
            "Which-key all keymaps",
        },
        ["<leader>wk"] = {
            function()
                local input = vim.fn.input "WhichKey: "
                vim.cmd("WhichKey " .. input)
            end,
            "Which-key query lookup",
        },
    },
}

return M
