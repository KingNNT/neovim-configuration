require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "phpactor", "pyright", "tsserver", "volar", "eslint" },
}
