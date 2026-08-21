# Neovim Configuration Project

## Purpose
Personal Neovim configuration built on Lazy.nvim plugin manager. Targets **Neovim 0.11+** (using native LSP `vim.lsp.config` / `vim.lsp.enable`). 

## Tech Stack
- **Language**: Lua (Neovim Lua API)
- **Plugin Manager**: folke/lazy.nvim
- **LSP**: Native Neovim LSP (no nvim-lspconfig Lua API calls — only runtime files from nvim-lspconfig)
- **Package Manager**: williamboman/mason.nvim + mason-lspconfig bridge
- **Colorscheme**: folke/tokyonight.nvim
- **UI Framework**: folke/snacks.nvim (dashboard, explorer, picker, terminal, notifier, scratch, indent, scroll, words)
- **Completion**: saghen/blink.cmp (v1 stable, built-in sources + auto-brackets + signature help)
- **Formatting**: stevearc/conform.nvim (stylua, prettier, ruff format, goimports, etc.)
- **Linting**: mfussenegger/nvim-lint (vale, ruff)
- **Debugging**: mfussenegger/nvim-dap + rcarriga/nvim-dap-ui
- **Testing**: nvim-neotest/neotest (jest, playwright, pytest adapters)

## Plugin Organization
Plugin specs are organized by category as lazy.nvim import directories:
- `lua/plugins/coding/` — treesitter, autopairs, neogen, rainbow-delimiters, todo-comments
- `lua/plugins/debug/` — dap, dapui, neotest
- `lua/plugins/extras/` — wakatime
- `lua/plugins/git/` — gitsigns (+ vim-fugitive dependency)
- `lua/plugins/lsp/` — lspconfig, mason, conform, lint, blink
- `lua/plugins/notebooks/` — image.nvim, jupytext, molten
- `lua/plugins/tools/` — colorizer, devicons, grug-far, lazydev, plenary, trouble
- `lua/plugins/ui/` — snacks, colorscheme, lualine, bufferline, flash, which-key

Each directory contains individual `.lua` files, each returning a single lazy.nvim spec table.