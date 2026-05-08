# Code Style and Conventions

## Lua Style
- **Indentation**: 2 spaces (no tabs), per `.editorconfig` and `shiftwidth=2` in options
- **Line endings**: LF (Unix-style), per `.editorconfig`
- **Charset**: UTF-8

## Module Pattern
- Each plugin spec file returns a single lazy.nvim spec table: `return { ... }`
- Config modules use the side-effect style (`config = function() ... end`) or export style (`opts`, `keys`)
- Utility modules use `local M = {}; ...; return M` pattern

## Naming
- Plugin spec files use the plugin's lazy.nvim name verbatim (e.g., `snacks.lua`, `lspconfig.lua`, `cmp.lua`)
- Directory names are lowercase, hyphenated where needed
- Variable names: snake_case for locals, CamelCase unused

## Key Conventions
- **No `require('lspconfig').xxx.setup{}`** — use `vim.lsp.config()` / `vim.lsp.enable()`
- **No numbered file prefixes** — load order is controlled by `priority` and `lazy = false`
- **No auto-source glob loader** — every config must be explicitly referenced
- **No `_G.*` globals** except intentional debugging hooks (`_G.inspect`, `_G.dd`, `_G.bt`)
- **No `config = true`** for plugins needing settings — always use explicit config function
- **`opts` is a function** when exporting from config modules: `opts = function() return require('...').opts end`

## Import Structure
- `lua/plugins/init.lua` returns a flat array of `{ import = "plugins.category" }` entries
- Lazy.nvim auto-discovers all `.lua` files in each category directory

## Comments
- Use `--` for single-line comments
- Use `--[[ ... ]]` for multi-line when needed
- Section headers use `-- Header Name ----------` style (see globals.lua, options.lua)