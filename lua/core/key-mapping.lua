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
map("n", "<leader>n", "<cmd> set nu! <CR>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd> set rnu! <CR>", { desc = "Toggle relative number" })
map("n", "<A-j>", "<Esc>:m+<CR>==", { desc = "Move line up" })
map("n", "<A-k>", "<Esc>:m-2<CR>==", { desc = "Move line down" })
map("n", "∆", "<Esc>:m+<CR>==", { desc = "Move line up on Mac" })
map("n", "˚", "<Esc>:m-2<CR>==", { desc = "Move line down on Mac" })

map("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), { desc = "Escape terminal mode" })

-- -- Don't copy the replaced text after pasting in visual mode
-- -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Move up" })
