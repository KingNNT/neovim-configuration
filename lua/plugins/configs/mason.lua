require("mason").setup()
require("mason-lspconfig").setup {
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
    -- This setting has no relation with the `automatic_installation` setting.
    ---@type string[]
    ensure_installed = {
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
        "rust_analyzer",
        "sqlls",
        "tailwindcss",
        "terraformls",
        "volar",
    },
    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    ---@type boolean
    automatic_installation = false,

    -- See `:h mason-lspconfig.setup_handlers()`
    ---@type table<string, fun(server_name: string)>?
    handlers = nil,
}
