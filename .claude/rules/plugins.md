# Plugins

## Adding a new plugin

1. **Pick a category** under `lua/plugins/` (coding, debug, extras, git, lsp, notebooks, tools, ui). If no category fits, add a new one and register it in `lua/plugins/init.lua`.
2. **Create the spec file** at `lua/plugins/<category>/<name>.lua`. Use the plugin's lazy.nvim name verbatim — don't rename it.
3. **Write the spec.** The file should `return { ... }` a single lazy.nvim spec table. Two valid styles:
   - **Side-effect style** — `config = function() require('<plugin>').setup({...}) end`:
     ```lua
     return {
         "author/plugin.nvim",
         event = "VeryLazy",
         config = function()
             require("plugin").setup({ ... })
         end,
     }
     ```
   - **Export style** — inline `opts` / `keys` / `init` directly in the spec:
     ```lua
     return {
         "author/plugin.nvim",
         event = "VeryLazy",
         opts = { ... },
         keys = {
             { "<leader>x", function() ... end, desc = "Description" },
         },
     }
     ```
   Pick the style that matches the surrounding plugins of the same category. Don't mix both inside one spec file.
4. **Pick a lazy trigger.** See the table below.

## Lazy-loading triggers

| Trigger | When to use | Examples in this repo |
|---|---|---|
| `lazy = false` + `priority` | Plugin must be on rtp before others initialise (themes, icons, mason). | plenary, nvim-web-devicons, snacks, tokyonight, nvim-lspconfig |
| `event = "VeryLazy"` | UI/utility plugin that should load after startup is idle. | lualine, bufferline, flash, which-key |
| `event = { "BufReadPre", "BufNewFile" }` | Plugin that operates on file buffers. | gitsigns, todo-comments, conform, nvim-lint, rainbow-delimiters, tree-sitter-manager |
| `event = "InsertEnter"` | Insert-mode-only plugin. | nvim-cmp |
| `cmd = {...}` | Plugin only used via user commands. | nvim-dap, neotest, trouble, neogen, grug-far |
| `ft = {...}` | Plugin only relevant to specific filetypes. | molten-nvim, image.nvim, lazydev (lua) |
| `keys = {...}` | Plugin only triggered by specific keymaps. | flash (combined with `opts`) |

Don't use `lazy = false` without setting `priority` if startup order matters. Don't set `priority` on plugins that aren't `lazy = false` — it's ignored.

## Priority ordering (current)

```
1000  plenary.nvim          — utility lib, must be earliest
 980  nvim-web-devicons     — icons used by snacks/lualine/bufferline
 970  snacks.nvim           — UI host, dashboard, picker
 960  nvim-lspconfig        — LSP runtime files (cmd, filetypes, root_markers defaults)
 960  tokyonight.nvim       — colorscheme
```

When adding a plugin with `lazy = false`, slot its priority between these rather than picking a number out of thin air.

## Common pitfalls

- **Don't depend on a lazy plugin from a non-lazy one** unless you list it under `dependencies = {...}` and the dependency is loaded eagerly. mason loads `cmp-nvim-lsp` eagerly precisely so `lspconfig.lua` can `require('cmp_nvim_lsp')` synchronously when configuring capabilities.
- **`config = true` is forbidden** for any plugin that needs settings — use `config = function() ... end` so the project owns the setup call.
- **Don't add a plugin if a folke ecosystem plugin or `snacks.nvim` already covers it.** This config has consolidated heavily on `folke/snacks.nvim` (dashboard, explorer, picker, terminal, notifier, scratch, indent, scroll, words). Check `lua/plugins/ui/snacks.lua` before adding redundant plugins.

## Removing a plugin

1. Delete the spec file from `lua/plugins/<category>/<name>.lua`.
2. Search for stale references: `rg "<name>" lua`.
3. If the category is now empty, consider removing its import from `lua/plugins/init.lua`.
4. Run `:Lazy sync` in Neovim to prune the plugin and update `lazy-lock.json`.
5. Commit the deleted spec and the updated lockfile together.
