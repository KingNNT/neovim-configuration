# Lua style

## Indentation

- **Match the existing file's indentation.** This codebase has historically mixed 2-space and 4-space — don't reformat a file when making a small edit.
- New top-level files default to **2 spaces**, matching `vim.opt.shiftwidth` in `config/options.lua`.
- `.editorconfig` only enforces LF line endings, UTF-8, and final-newline — it doesn't dictate indent width for Lua.

## Module patterns

- Plugin spec files (`lua/plugins/<category>/<name>.lua`) return a single lazy.nvim spec table. Two styles:
  - **Side-effect**: `config = function() require('<plugin>').setup({...}) end` inside the returned spec.
  - **Inline opts/keys**: `opts = { ... }` and `keys = { ... }` directly in the returned spec table.
- Don't mix both styles in one spec file.
- Utility modules use `local M = {} ... return M`.

## Names

- Server names: lspconfig naming (`lua_ls`, `ts_ls`, `vue_ls`) — never mason package names.
- Plugin spec keys: keep the upstream owner/repo (`folke/snacks.nvim`, not `snacks.nvim`).
- Local Lua names: `snake_case` for variables, functions, modules. `PascalCase` only for class-like tables (rare in this repo).

## Comments

- Default to no comments. The names should explain what.
- When you do comment, explain **why** something exists, not what it does. Example pattern from the codebase:
  > `-- Disabled because nvim-cmp owns the completion UI; enabling both causes duplicate menus.`
- Don't write decorative banner comments (`---- options ----`) in new code; the existing ones in `config/options.lua` and `config/globals.lua` are grandfathered.

## Lua specifics

- Prefer `vim.uv` over `vim.loop` — Neovim 0.10+ aliases them, but `vim.uv` is the documented form.
- Prefer `vim.keymap.set` over `vim.api.nvim_set_keymap`.
- Prefer `vim.api.nvim_create_autocmd` with a named augroup over `vim.cmd('autocmd ...')`.
- Prefer `vim.bo[buf]` / `vim.wo[win]` over `vim.api.nvim_buf_set_option` / `nvim_win_set_option` (the latter are deprecated in 0.10+).
- Use `vim.tbl_deep_extend('force', a, b)` to merge config tables — never `vim.tbl_extend` for nested tables.

## Don'ts

- Don't introduce `_G.*` globals. Existing ones (`_G.inspect`, `_G.dd`, `_G.bt`) are deliberate debugging hooks; new code shouldn't add to that pile.
- Don't use `pcall(require, ...)` to silently ignore missing dependencies in plugin configs unless there's a concrete reason (the LSP capabilities case in `lspconfig.lua` is the exception, with a comment explaining why).
- Don't add a `setup_handlers`-style abstraction layer for LSP servers. The native API is the abstraction.
- Don't lazy-require a module inside a hot autocmd callback (`BufRead`, `CursorMoved`, etc.). Require at module load time.
