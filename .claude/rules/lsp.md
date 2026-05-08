# LSP

This config uses Neovim's **native LSP API** (0.11+). There is no `require('lspconfig').xxx.setup{}` anywhere — and there shouldn't be.

## The wiring

```
mason.lua
  ├─ require("mason").setup()
  ├─ require("mason-lspconfig").setup({
  │    ensure_installed = servers,      ← hardcoded list matching lspconfig.lua
  │    automatic_enable = true,         ← calls vim.lsp.enable() for each installed server
  │  })
  └─ (cmp-nvim-lsp loaded eagerly as dependency)

lspconfig.lua
  ├─ Diagnostic keymaps (<space>e, [d, ]d, <space>q)
  ├─ LspAttach autocmd (buffer-local keymaps, per-client tweaks)
  ├─ User commands (:TSOrganizeImports, :RuffCheckAndFix)
  └─ config function:
       ├─ Build capabilities (protocol + cmp_nvim_lsp)
       ├─ vim.lsp.config('*', { capabilities = capabilities })
       └─ vim.lsp.config(name, cfg) per server in server_configs table
```

`nvim-lspconfig` is loaded eagerly as a mason dependency **only for its `lsp/<server>.lua` runtime files** — it provides the `cmd`, `filetypes`, and `root_markers` defaults that core merges with per-server `vim.lsp.config()` overrides. We never call any of nvim-lspconfig's Lua functions.

## Server configurations

Server-specific configs are defined in the `server_configs` table inside `lua/plugins/lsp/lspconfig.lua`. The mason ensure_installed list in `lua/plugins/lsp/mason.lua` must be kept in sync with the servers configured there.

Currently configured servers: cssls, ts_ls, intelephense, pyright, ruff, vue_ls, lua_ls, prismals, graphql, eslint, tailwindcss.

When adding a server:
1. Add an entry to the `server_configs` table in `lspconfig.lua`.
2. Add the server name to the `ensure_installed` list in `mason.lua`.
3. If the server needs only defaults (no custom settings/filetypes/init_options), you may skip step 1 — but you still need step 2 for auto-install.

## Capabilities — set once, globally

```lua
vim.lsp.config('*', { capabilities = capabilities })
```

This is called once in `lspconfig.lua` after merging `vim.lsp.protocol.make_client_capabilities()` with `cmp_nvim_lsp.default_capabilities()`. **Do not** add `capabilities = capabilities` to every server entry. Per-server entries should set only what's truly per-server (filetypes, settings, init_options, on_init, root_markers).

## LspAttach — only what isn't a 0.11+ default

Neovim 0.11+ provides these as built-in `LspAttach` defaults — **don't redefine them**:

| Keymap | Action |
|---|---|
| `K` | hover |
| `gri` | implementation |
| `grr` | references |
| `grn` | rename |
| `gra` | code action |
| `<C-s>` (insert) | signature help |

What `lspconfig.lua`'s `LspAttach` autocmd is allowed to do:
- Per-client capability tweaks (e.g. disabling Ruff's hover so Pyright wins).
- Buffer-local settings that aren't defaults (treesitter folding, custom `<space>`-prefixed keymaps).
- Anything specific to a `client.name`.

Snacks.nvim picker overrides `gd`, `gD`, `gr`, `gI`, `gy` for its picker UI — that's intentional and lives in `snacks.lua`, not `lspconfig.lua`.

## Deprecated APIs — do not use

| Deprecated | Use instead |
|---|---|
| `vim.diagnostic.goto_prev()` | `vim.diagnostic.jump({ count = -1, float = true })` |
| `vim.diagnostic.goto_next()` | `vim.diagnostic.jump({ count = 1, float = true })` |
| `vim.lsp.buf.execute_command(...)` | `vim.lsp.get_clients({ bufnr = 0, name = '...' })[1]:exec_cmd({...})` |
| `require('lspconfig').xxx.setup{}` | `vim.lsp.config('xxx', {...})` |
| Setting `vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'` | Default in 0.11+, no-op |
| `vuels` (server name) | `vue_ls` (renamed in mason and nvim-lspconfig) |

## Why nvim-lspconfig is mandatory here

Our per-server configs in `lspconfig.lua` only specify `filetypes`/`settings`/`init_options` — no `cmd`. Without nvim-lspconfig on rtp, `vim.lsp.enable('cssls')` doesn't know what binary to launch. If you remove nvim-lspconfig, you must write `lua/lsp/<server>.lua` files for every server (see `:help lsp-config`). For the current server roster this isn't worth it.

## Capabilities race — solved, don't reintroduce

A previous version exported `_G.cmp_nvim_lsp_capabilities` from `nvim-cmp.lua` and read it in `lspconfig.lua`. Because nvim-cmp is `event = "InsertEnter"` and mason is `lazy = false`, the global was always `nil` when LSP servers configured — silently dropping snippet/completion capabilities.

The fix is to load `cmp-nvim-lsp` as a mason dependency (eager) and `pcall(require, 'cmp_nvim_lsp')` directly inside `lspconfig.lua`. **Don't** reintroduce the `_G.*` global pattern.
