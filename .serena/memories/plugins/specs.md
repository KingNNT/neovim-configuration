# Plugin Specs

## Organization
Plugin specs live in `lua/plugins/<category>/<plugin>.lua`, each returning a lazy.nvim spec table.

Categories: coding, debug, extras, git, lsp, notebooks, tools, ui

## Priority Ordering (lazy = false plugins)
- 1000 — plenary.nvim (utility lib, earliest)
- 980 — nvim-web-devicons (icons for snacks/lualine/bufferline)
- 970 — snacks.nvim (UI host, dashboard, picker, explorer)
- 960 — tokyonight.nvim (colorscheme)
- 960 — nvim-lspconfig (LSP runtime files)

## Full Plugin Roster

### coding/
- romus204/tree-sitter-manager.nvim — syntax highlighting
- windwp/nvim-autopairs — auto-close brackets
- danymat/neogen — documentation generation
- HiPhish/rainbow-delimiters.nvim — colored delimiters
- folke/todo-comments.nvim — TODO highlight

### debug/
- mfussenegger/nvim-dap — debugging
- rcarriga/nvim-dap-ui — debug UI
- nvim-neotest/neotest — test runner

### extras/
- wakatime/vim-wakatime — time tracking

### git/
- lewis6991/gitsigns.nvim — git signs (+ vim-fugitive)

### lsp/
- neovim/nvim-lspconfig — native LSP config
- saghen/blink.cmp — completion (built-in sources: lsp, path, snippets, buffer; auto-brackets; cmdline; signature help; v1 stable)
- stevearc/conform.nvim — formatting
- mfussenegger/nvim-lint — linting
- williamboman/mason.nvim — package manager (+ mason-lspconfig, blink.cmp as eager deps)

### notebooks/
- 3rd/image.nvim — image rendering
- GCBallesteros/jupytext.nvim — Jupyter integration
- benlubas/molten-nvim — Jupyter kernel

### tools/
- catgoose/nvim-colorizer.lua — color highlighting
- nvim-tree/nvim-web-devicons — file icons
- MagicDuck/grug-far.nvim — search & replace
- folke/lazydev.nvim — Lua dev helpers
- nvim-lua/plenary.nvim — utility library
- folke/trouble.nvim — diagnostics list

### ui/
- folke/snacks.nvim — UI framework (dashboard, explorer, picker, notifier, scratch, indent, scroll, words, terminal, zen)
- folke/tokyonight.nvim — colorscheme
- nvim-lualine/lualine.nvim — statusline
- akinsho/bufferline.nvim — buffer tabs
- folke/flash.nvim — navigation
- folke/which-key.nvim — keymap popup