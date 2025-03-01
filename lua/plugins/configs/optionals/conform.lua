require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettier" },
        typescript = { "eslint_d", "prettier", "ts_ls" },
        javascriptreact = { "prettier" },
        typescriptreact = { "eslint_d", "prettier", "ts_ls" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        python = function(bufnr)
            if require("conform").get_formatter_info("ruff_format", bufnr).available then
                return { "ruff_format" }
            else
                return { "isort", "black" }
            end
        end,
        ["*"] = { "codespell" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
    -- If this is set, Conform will run the formatter on save.
    -- It will pass the table to conform.format().
    -- This can also be a function that returns the table.
    -- format_on_save = {
    --     -- I recommend these options. See :help conform.format for details.
    --     lsp_format = "fallback",
    --     timeout_ms = 500,
    -- },
    -- If this is set, Conform will run the formatter asynchronously after save.
    -- It will pass the table to conform.format().
    -- This can also be a function that returns the table.
    -- format_after_save = {
    --     lsp_format = "fallback",
    -- },
    -- Set the log level. Use `:ConformInfo` to see the location of the log file.
    log_level = vim.log.levels.ERROR,
    -- Conform will notify you when a formatter errors
    notify_on_error = true,
})

vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
