# Suggested Commands

## Development
- `nvim` — launch the editor with this config
- `nvim --headless "+Lazy! sync" +qa` — sync plugins headlessly

## Inside Neovim
- `:Lazy sync` — sync all plugins and update lazy-lock.json
- `:Lazy clean` — remove unused plugins
- `:Mason` — open Mason UI to install/manage LSP servers, formatters, linters
- `:LspInfo` — check LSP status for current buffer
- `:Format` — format current buffer/range via conform
- `:TSOrganizeImports` — organize TS/JS imports
- `:RuffCheckAndFix` — run ruff check --fix on current file
- `:CopyPath` — copy current file's full path to clipboard

## Git
- `git status` — check working tree status
- `git add -A && git commit -m "msg"` — stage and commit
- `git log --oneline -10` — recent commit history

## System (Darwin/macOS)
- `ls`, `find`, `grep`, `rg` (ripgrep) — file operations
- `fd` — fast file finder (required dependency)
- `stylua` — Lua formatter (used by conform)

## Verification
After making changes:
1. Launch `nvim` and check for errors via `:messages`
2. Run `:checkhealth` for diagnostics
3. Verify LSP with `:LspInfo` in a relevant file
4. Check `:Lazy` for plugin load status