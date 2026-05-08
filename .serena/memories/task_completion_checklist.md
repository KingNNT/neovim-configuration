# Task Completion Checklist

When completing a task in this project:

1. **No automated tests** — this is a config repo, not a software project. Verify manually.
2. **Launch `nvim`** — check for error messages on startup
3. **Run `:messages`** — review for any warnings or errors
4. **Run `:checkhealth`** — verify health status if LSP or plugin changes were made
5. **Run `:Lazy sync`** — if plugins were added/removed, sync and update lockfile
6. **Check `:LspInfo`** — if LSP changes were made, verify in a relevant file
7. **Review `lazy-lock.json`** — commit updated lockfile if plugins changed
8. **Update documentation** — if structure changed, update `CLAUDE.md` and rules files
9. **No linting/formatting CI** — but do run `stylua` on modified Lua files if available