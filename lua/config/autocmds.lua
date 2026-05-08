local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.opt_local.buflisted = false
    end,
})

-------------------------------------- customize cmds ------------------------------------------
vim.api.nvim_create_user_command('CopyPath', function()
    pcall(function()
        vim.fn.Preserve("exec 'let @+ = expand('%:p')'")
    end)
end, {})

-------------------------------------- experimental ui2 ------------------------------------------
-- Enable redesigned core messages/commandline UI (Neovim 0.12+)
-- Avoids "Press ENTER" interruptions, highlights cmdline as you type, provides pager as buffer.
-- See :help ui2 for details. Disable by commenting out the line below.
pcall(function()
    require('vim._core.ui2').enable()
end)
