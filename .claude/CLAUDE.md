# CLAUDE.md

Project-specific guidance for Claude Code working in this Neovim configuration repository.

## Repository Overview

A personal Neovim configuration built on Lazy.nvim. Targets **Neovim 0.11+** and uses native LSP (`vim.lsp.config` / `vim.lsp.enable`) — no `nvim-lspconfig.setup()` style anywhere.

## Bootstrap Chain

```
init.lua
  └─ require("config")
       ├─ require('config.globals')      -- vim.g.* and provider toggles
       ├─ require('config.options')      -- vim.opt, folding, numbers, indents
       ├─ require('config.autocmds')     -- user commands (:CopyPath), quickfix, ui2
       ├─ require('config.diagnostics')  -- diagnostic signs and float config
       ├─ require('config.lazy')         -- bootstrap lazy.nvim onto rtp
       └─ require('config.keymaps')      -- base-layer keymaps
```

## Top-Level Layout

| Path | Purpose |
|---|---|
| `init.lua` | Entry point. Enables `vim.loader`, calls `require("config")`. |
| `lua/config/` | Editor-level config (globals, options, autocmds, diagnostics, keymaps, lazy bootstrap). |
| `lua/plugins/init.lua` | Flat array of `{ import = "plugins.<category>" }` entries. |
| `lua/plugins/<category>/<name>.lua` | Per-plugin lazy.nvim spec (one file per plugin). |
| `lua/plugins/lsp/lspconfig.lua` | Native LSP wiring (`vim.lsp.config` calls + `LspAttach` + user commands). |
| `lua/plugins/lsp/mason.lua` | Mason + mason-lspconfig setup, server auto-install and enable. |
| `lua/utils/init.lua` | Small helpers (`utils.has`, etc.). |
| `lazy-lock.json` | Plugin commit pinning — committed. |

## Plugin Categories

| Category | Plugins |
|---|---|
| `coding/` | tree-sitter-manager, nvim-autopairs, neogen, rainbow-delimiters, todo-comments |
| `debug/` | nvim-dap, nvim-dap-ui, neotest |
| `extras/` | wakatime |
| `git/` | gitsigns (+ vim-fugitive) |
| `lsp/` | nvim-lspconfig, nvim-cmp, conform, nvim-lint, mason |
| `notebooks/` | image.nvim, jupytext, molten |
| `tools/` | colorizer, nvim-web-devicons, grug-far, lazydev, plenary, trouble |
| `ui/` | snacks.nvim, tokyonight, lualine, bufferline, flash, which-key |

## Custom Commands

- `:CopyPath` — copy current file's full path to clipboard
- `:Format` — format current buffer/range via conform
- `:TSOrganizeImports` — TS/JS organize imports (uses `Client:exec_cmd`)
- `:RuffCheckAndFix` — run `ruff check --fix` on current file

## Detailed Rules

@./rules/architecture.md
@./rules/plugins.md
@./rules/lsp.md
@./rules/lua-style.md
