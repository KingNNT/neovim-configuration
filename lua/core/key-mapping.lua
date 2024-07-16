local map = vim.keymap.set

map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })
map("i", "<A-j>", "<Esc>:m+<CR>==", { desc = "Move line up" })
map("i", "<A-k>", "<Esc>:m-2<CR>==", { desc = "Move line down" })
map("i", "∆", "<Esc>:m+<CR>==", { desc = "Move line up on Mac" })
map("i", "˚", "<Esc>:m-2<CR>==", { desc = "Move line down on Mac" })

map("n", ":noh <CR>", "<Left>", { desc = "Clear highlights" })
map("n", "<C-h>", "<Left>", { desc = "Move left" })
map("n", "<C-l>", "<Right>", { desc = "Move right" })
map("n", "<C-j>", "<Down>", { desc = "Move down" })
map("n", "<C-k>", "<Up>", { desc = "Move up" })
map("n", "<leader>n", "<cmd> set nu! <CR>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd> set rnu! <CR>", { desc = "Toggle relative number" })
-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down" })
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up" })
map("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down" })
map("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up" })
map("n", "<A-j>", "<Esc>:m+<CR>==", { desc = "Move line up" })
map("n", "<A-k>", "<Esc>:m-2<CR>==", { desc = "Move line down" })
map("n", "∆", "<Esc>:m+<CR>==", { desc = "Move line up on Mac" })
map("n", "˚", "<Esc>:m-2<CR>==", { desc = "Move line down on Mac" })

map("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), { desc = "Escape terminal mode" })

map("v", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down" })
map("v", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up" })

map("x", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down" })
map("x", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up" })
-- -- Don't copy the replaced text after pasting in visual mode
-- -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Move up" })
