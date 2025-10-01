# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Neovim configuration repository built around the Lazy.nvim plugin manager. The configuration follows a modular architecture with clear separation of concerns.

## Key Architecture Components

### Bootstrap System
- `init.lua` → `lua/bootstrap/init.lua` → Core modules in sequence
- Initialization order: globals → options → lazy plugin manager → plugins → key mappings

### Plugin Architecture
- **Plugin Definitions**: `lua/plugins/load.lua` - Central plugin specification with lazy loading
- **Plugin Configuration**: Split into required (`lua/plugins/configs/requireds/`) and optional (`lua/plugins/configs/optionals/`) modules
- **Auto-loading**: All `.lua` files in config directories are automatically sourced via vim.cmd("source")

### Core Configuration Structure
- `lua/core/globals.lua` - Global variables and functions
- `lua/core/options.lua` - Vim options, autocmds, and custom commands
- `lua/core/key-mapping.lua` - Base key mappings
- `lua/core/lazy.lua` - Lazy.nvim setup and bootstrap

## Essential Development Commands

### Plugin Management
```bash
# Open Neovim and access plugin manager
nvim
:Lazy
```

### Configuration Reload
- Configuration auto-reloads on save for files in `lua/custom/**/*.lua`
- Manual reload: restart Neovim or use `:source %`

## Dependencies & Requirements

### System Dependencies
- **Required**: Git, Node.js, Python
- **Optional**: ripgrep (for search functionality), universal-ctags (Ubuntu), fd

### Plugin Dependencies
- `plenary.nvim` - Core Lua utility library (priority: 1000)
- `vim-sensible` - Sensible defaults (priority: 990)
- `nvim-web-devicons` - Icon support (priority: 980)
- `snacks.nvim` - UI enhancements (priority: 970)

## Configuration Patterns

### Plugin Configuration Loading
- Required configs: Always loaded, stored in `requireds/`
- Optional configs: Lazy-loaded based on events, stored in `optionals/`
- Config files use numbered prefixes for load order (e.g., `1_tokyonight.lua`, `2_nvim-treesitter.lua`)

### Key Mapping Convention
- Leader key-based mappings defined in individual plugin configs
- Base mappings in `lua/core/key-mapping.lua`
- Insert mode navigation: `<C-h/j/k/l>` for directional movement
- Mac-specific Alt+j/k mappings using Unicode characters (∆/˚)

### Plugin Categories
- **Core**: plenary, sensible, web-devicons, snacks
- **UI**: tokyonight theme, lualine, bufferline, ufo folding
- **LSP**: nvim-lspconfig, mason, mason-lspconfig, nvim-cmp
- **Productivity**: treesitter, flash navigation, comment, todo-comments
- **Git**: gitsigns, fugitive
- **Development**: nvim-dap, neotest, conform formatter, nvim-lint

## File Organization Rules

### When Adding New Plugins
1. Add plugin spec to `lua/plugins/load.lua`
2. Create config file in appropriate subdirectory:
   - `lua/plugins/configs/requireds/` for essential plugins
   - `lua/plugins/configs/optionals/` for lazy-loaded plugins
3. Use numbered prefixes if load order matters
4. Return configuration tables with `opts`, `keys`, `init` functions as needed

### Configuration File Structure
- Each plugin config should return a table with configuration options
- Use `opts` for plugin options, `keys` for key mappings, `init` for initialization
- Keep configurations modular and self-contained

## Custom Commands
- `:CopyPath` - Copy current file's full path to clipboard