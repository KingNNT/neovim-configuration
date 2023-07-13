vim.g.user_emmet_install_global = 0

vim.api.nvim_create_augroup("EmmetGroup", {})

vim.api.nvim_create_autocmd("FileType", {
    group = "EmmetGroup",
    pattern = "html,css",
    command = "EmmetInstall",
    desc = "Install emmet"
})
