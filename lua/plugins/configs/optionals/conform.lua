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
            local result = {}
            if require("conform").get_formatter_info("ruff_format", bufnr).available then
                table.insert(result, "ruff")
            end
            if require("conform").get_formatter_info("isort", bufnr).available then
                table.insert(result, "isort")
            end
            if require("conform").get_formatter_info("black", bufnr).available then
                table.insert(result, "black")
            end

            return result
        end,
        ["*"] = { "codespell" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
    formatters = {
        isort = {
            command = "isort",
            args = { "--profile", "black", "-" }, -- Match black style
            stdin = true,
        },
    },
    log_level = vim.log.levels.ERROR,
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
