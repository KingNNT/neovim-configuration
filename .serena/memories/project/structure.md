# Project Structure

```
~/.config/nvim/
├── init.lua                          -- Entry: vim.loader.enable() + require("config")
├── lazy-lock.json                    -- Plugin commit pins (committed)
├── .editorconfig                     -- LF line endings, UTF-8
├── .claude/
│   ├── CLAUDE.md                     -- Project-level AI instructions
│   └── rules/                        -- Detailed rules (architecture, plugins, lsp, lua-style)
├── .github/
│   └── README.md                     -- GitHub README
├── .wiki/                            -- Wiki pages (Installation, Requirements, etc.)
├── docs/
│   └── superpowers/                  -- Superpowers skill docs
├── lua/
│   ├── config/                       -- Editor-level config (boot sequence)
│   │   ├── init.lua                  -- Boot order: globals → options → autocmds → diagnostics → lazy → keymaps
│   │   ├── globals.lua               -- vim.g.*, provider toggles, leader keys, OS detection
│   │   ├── options.lua               -- vim.opt settings, folding, numbers, indents
│   │   ├── autocmds.lua              -- User commands (CopyPath), quickfix buflisted, ui2 experimental
│   │   ├── diagnostics.lua           -- vim.diagnostic.config (signs, float, virtual_text off)
│   │   ├── lazy.lua                  -- Bootstrap lazy.nvim, require("lazy").setup("plugins")
│   │   └── keymaps.lua               -- Base-layer keymaps (insert arrows, line-move, terminal escape)
│   ├── plugins/                      -- Lazy.nvim plugin specs
│   │   ├── init.lua                  -- Category imports array
│   │   ├── coding/                   -- treesitter, autopairs, neogen, rainbow-delimiters, todo-comments
│   │   ├── debug/                    -- dap, dapui, neotest
│   │   ├── extras/                   -- wakatime
│   │   ├── git/                      -- gitsigns (+ fugitive)
│   │   ├── lsp/                      -- lspconfig, mason, conform, lint, cmp
│   │   ├── notebooks/                -- image.nvim, jupytext, molten
│   │   ├── tools/                    -- colorizer, devicons, grug-far, lazydev, plenary, trouble
│   │   └── ui/                       -- snacks, colorscheme, lualine, bufferline, flash, which-key
│   └── utils/
│       └── init.lua                  -- Helpers (utils.has)
```

## Boot Sequence (load-bearing order)
1. `config.globals` — vim.g.mapleader, OS flags, disabled providers
2. `config.options` — vim.opt (affects plugin UI initialization)
3. `config.autocmds` — user commands, ui2 experimental
4. `config.diagnostics` — diagnostic signs/config
5. `config.lazy` — bootstrap lazy.nvim, then `lazy.setup("plugins")`
6. `config.keymaps` — base-layer keymaps (last, so plugins don't clobber them)