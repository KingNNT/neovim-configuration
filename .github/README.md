<h1 align="center">Neovim Configuration</h1>

<div align="center">
  <h6 align="center">Develop by KingNNT</h6>
</div>

<div align="center" style="margin-bottom: 16px">
	<a href="https://github.com/KingNNT/neovim-configuration/wiki">
    Wiki
  </a>
</div>

<div align="center">

[![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.11.2-blueviolet.svg?style=flat-square&logo=Neovim&color=90E59A&logoColor=white)](https://github.com/neovim/neovim)
[![GitHub Issues](https://img.shields.io/github/issues/KingNNT/KingNNT.svg?style=flat-square&label=Issues&color=d77982)](https://github.com/KingNNT/neovim-configuration)

</div>

## Showcase

![neovim-dashboard-image](./images/dashboard_20250306T201303.png?raw=true)

## What is it?

A personal Neovim configuration built on [Lazy.nvim](https://github.com/folke/lazy.nvim), targeting **Neovim 0.11+** with native LSP (`vim.lsp.config` / `vim.lsp.enable`). Uses [snacks.nvim](https://github.com/folke/snacks.nvim) as the primary UI framework (dashboard, explorer, picker, notifier, terminal).

### Highlights

- **Native LSP** — no `lspconfig.setup()`, uses Neovim 0.11+ `vim.lsp.config()` API directly
- **Snacks.nvim** — dashboard, file explorer, fuzzy picker, notifications, scratch buffers, zen mode
- **Mason** — auto-install LSP servers, formatters, and linters
- **nvim-cmp** — autocompletion with LuaSnip snippets
- **conform.nvim** — async formatting (stylua, prettier, ruff, goimports, etc.)
- **nvim-lint** — async linting (vale, ruff)
- **nvim-dap** — debugging with UI
- **neotest** — test runner (jest, playwright, pytest)
- **Treesitter** — syntax highlighting with auto-install
- **Flash** — navigation jumps
- **Which-key** — keymap discovery

## Install

### Install Dependencies

- [fd](https://github.com/sharkdp/fd?tab=readme-ov-file#installation)

### Install configuration

```
git clone https://github.com/KingNNT/neovim-configuration ~/.config/nvim --depth 1 && nvim

```

### Install libraries

You can install more library with [mason](https://github.com/williamboman/mason.nvim?tab=readme-ov-file)

#### HTML

- prettier

## Uninstall

- **_Linux / Macos (unix)_**

```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

```

## Project Structure

```
~/.config/nvim/
├── init.lua                  -- Entry point
├── lua/config/               -- Editor config (globals, options, keymaps, lazy bootstrap)
├── lua/plugins/              -- Plugin specs by category
│   ├── coding/               -- treesitter, autopairs, neogen, etc.
│   ├── debug/                -- dap, dapui, neotest
│   ├── extras/               -- wakatime
│   ├── git/                  -- gitsigns
│   ├── lsp/                  -- lspconfig, mason, cmp, conform, lint
│   ├── notebooks/            -- image.nvim, jupytext, molten
│   ├── tools/                -- colorizer, devicons, grug-far, lazydev, plenary, trouble
│   └── ui/                   -- snacks, tokyonight, lualine, bufferline, flash, which-key
├── lua/utils/                -- Helper functions
└── lazy-lock.json            -- Plugin version pins
```

## Plugins list

See individual plugin spec files in `lua/plugins/<category>/`.
