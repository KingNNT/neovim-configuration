# LSP Configuration

## Architecture
- **No `require('lspconfig').xxx.setup{}`** — uses native `vim.lsp.config()` / `vim.lsp.enable()` (Neovim 0.11+)
- **nvim-lspconfig** is loaded eagerly only for its runtime files (provides `cmd`, `filetypes`, `root_markers` defaults)
- **mason-lspconfig** bridges mason packages to lspconfig names + provides `automatic_enable`

## Key Files
- `lua/plugins/lsp/lspconfig.lua` — `vim.lsp.config()` calls, `LspAttach` autocmd, user commands
- `lua/plugins/lsp/mason.lua` — mason + mason-lspconfig setup
- `lua/plugins/lsp/cmp.lua` — nvim-cmp completion setup
- `lua/plugins/lsp/conform.lua` — formatting via conform.nvim
- `lua/plugins/lsp/lint.lua` — linting via nvim-lint

## Server List (configured in lspconfig.lua server_configs)
cssls, ts_ls, intelephense, pyright, ruff, vue_ls, lua_ls, prismals, graphql, eslint, tailwindcss

## Capabilities
Set once globally via `vim.lsp.config('*', { capabilities = capabilities })` — do not repeat per server.

## LspAttach
Neovim 0.11+ provides default keymaps (K, gri, grr, grn, gra, <C-s>). Only add custom overrides.
Snacks.nvim overrides gd, gD, gr, gI, gy for its picker UI.