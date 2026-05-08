# Architecture

## Boot order is load-bearing

Modules are required in a fixed order from `lua/config/init.lua`. Don't reorder without understanding the consequences:

1. **`config.globals`** must run before anything reads `vim.g.mapleader`, the OS detection flags, or the disabled-provider list.
2. **`config.options`** must run before plugins, because some opts (`laststatus`, `signcolumn`, `foldlevelstart`, `pumborder`, native `autocomplete`) affect how plugins initialise their UIs.
3. **`config.autocmds`** runs before plugins to register user commands and quickfix behavior early.
4. **`config.diagnostics`** sets the global diagnostic config before LSP servers attach.
5. **`config.lazy`** prepends `lazy.nvim` to `rtp` — required before `require('plugins')`.
6. **`require('plugins')`** runs `lazy.setup("plugins")`. Any plugin with `lazy = false` + `priority` is loaded synchronously here.
7. **`config.keymaps`** runs last so plugin-defined keymaps don't get clobbered by base mappings (and so it can override anything plugins set).

## Where things live

- **Editor-level config** (no plugin involvement): `lua/config/`. Touch this for `vim.opt`, autocmds, user commands, diagnostic config, provider toggles.
- **Plugin specs**: `lua/plugins/<category>/<name>.lua`. One file per plugin, each returning a lazy.nvim spec table. `lua/plugins/init.lua` imports all categories.
- **LSP**: `lua/plugins/lsp/lspconfig.lua` (config calls, `LspAttach` autocmd, user commands) and `lua/plugins/lsp/mason.lua` (server install + auto-enable).

## Conventions

- **No auto-source.** There is no glob-based loader. Every config must be referenced explicitly from its spec file or via lazy.nvim's import system.
- **No numbered prefixes.** Load order is controlled by `priority` and `lazy = false` in the spec, not by filename.
- **No `lua/custom/` directory.** Earlier versions of this config had an NvChad-style auto-reload for `lua/custom/**/*.lua`. It was removed; do not reintroduce.
- **Globals are intentional.** `_G.inspect` (in `config.globals`), `_G.dd` / `_G.bt` (set by snacks via `VeryLazy` autocmd) are debugging hooks. Don't add new `_G.*` casually — prefer module returns.

## Modifying core files

- `config.options` is the only place that should set `vim.opt.*` and the global diagnostic config. Plugin configs set `vim.bo[buf].*` / `vim.wo[win].*` only.
- `config.keymaps` holds **base-layer** keymaps (insert-mode arrows, line-move, terminal escape). Plugin keymaps belong in the plugin's spec via `keys = {...}` or `vim.keymap.set` inside `config = function() ... end`.
