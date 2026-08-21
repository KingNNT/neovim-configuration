return {
    "williamboman/mason.nvim",
    lazy = false,
    priority = 960,
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp",
    },
    config = function()
        require("mason").setup()

        local servers = {
            "bashls",
            "cmake",
            "cssls",
            "cssmodules_ls",
            "dockerls",
            "docker_compose_language_service",
            "eslint",
            "emmet_language_server",
            "graphql",
            "jsonls",
            "ts_ls",
            "nginx_language_server",
            "intelephense",
            "prismals",
            "pyright",
            "ruff",
            "rust_analyzer",
            "sqlls",
            "tailwindcss",
            "terraformls",
            "vue_ls",
            "lua_ls",
        }

        require("mason-lspconfig").setup({
            ensure_installed = servers,
            automatic_enable = true,
        })
    end,
}
