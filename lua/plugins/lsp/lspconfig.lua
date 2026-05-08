-- Native LSP setup (vim.lsp.config / vim.lsp.enable). Server start is handled by
-- mason-lspconfig.setup({ automatic_enable = true }) in mason.lua.

-- Global diagnostics mappings.
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end)
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Buffer-local LSP setup. Neovim 0.11+ already provides defaults for K (hover),
-- gri (implementation), grr (references), grn (rename), gra (code action),
-- and <C-s> (signature help in insert) — don't redefine those here.
-- Navigation (gd/gD/gr/gI/gy) is overridden by snacks.nvim's picker.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client == nil then
      return
    end
    -- Disable Ruff hover in favor of Pyright
    if client.name == 'ruff' then
      client.server_capabilities.hoverProvider = false
    end

    -- Native treesitter folding (replaces nvim-ufo)
    -- foldmethod and foldexpr are window-local options, use vim.wo not vim.bo
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

    -- Custom <space>-prefixed mappings (kept; these aren't 0.11+ defaults).
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
  desc = 'LSP: buffer-local keymaps and per-client tweaks',
})

-- TS organize imports: vim.lsp.buf.execute_command was deprecated; use Client:exec_cmd.
vim.api.nvim_create_user_command("TSOrganizeImports", function()
  local clients = vim.lsp.get_clients({ bufnr = 0, name = "ts_ls" })
  if #clients == 0 then
    vim.notify("ts_ls is not attached to this buffer", vim.log.levels.WARN)
    return
  end
  clients[1]:exec_cmd({
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  })
end, { desc = "Organize TypeScript/JavaScript Imports" })

vim.api.nvim_create_user_command("RuffCheckAndFix", function()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then
    print("No file detected")
    return
  end
  local bufnr = vim.api.nvim_get_current_buf()
  vim.fn.jobstart({ "ruff", "check", "--fix", file }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if next(data) ~= nil then
        print(table.concat(data, "\n"))
      end
    end,
    on_stderr = function(_, data)
      if next(data) ~= nil then
        print("Error: " .. table.concat(data, "\n"))
      end
    end,
    on_exit = function(_, code)
      if code == 0 then
        vim.schedule(function()
          if vim.api.nvim_buf_is_loaded(bufnr) then
            vim.api.nvim_command("edit!")
          end
        end)
      else
        print("Ruff encountered errors.")
      end
    end,
  })
end, { desc = "Run `ruff check --fix` on the current file" })

return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    -- Build capabilities once: protocol defaults + nvim-cmp's expanded set if available.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok_cmp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
    if ok_cmp then
      capabilities = vim.tbl_deep_extend('force', capabilities, cmp_lsp.default_capabilities())
    end

    -- Apply to all servers (Neovim 0.11+).
    vim.lsp.config('*', { capabilities = capabilities })

    -- Server-specific configurations (capabilities inherited from '*').
    local server_configs = {
      cssls = {
        filetypes = { 'css', 'scss', 'sass', 'less' },
      },
      ts_ls = {
        filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
        settings = {
          typescript = {
            format = { indentSize = 2, tabSize = 2, convertTabsToSpaces = false },
          },
          javascript = {
            format = { indentSize = 2, tabSize = 2, convertTabsToSpaces = false },
          },
        },
      },
      intelephense = {
        filetypes = { "php" },
        root_markers = { "composer.json", ".git" },
      },
      pyright = {
        filetypes = { 'python' },
        disableOrganizeImports = true,
      },
      ruff = {
        filetypes = { 'python' },
        disableOrganizeImports = true,
        init_options = {
          settings = { organizeImports = true },
        },
      },
      vue_ls = {
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        init_options = {
          vue = { hybridMode = false },
        },
      },
      lua_ls = {
        filetypes = { 'lua' },
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              version = 'LuaJIT',
              path = { 'lua/?.lua', 'lua/?/init.lua' },
            },
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME },
            },
          })
        end,
        settings = { Lua = {} },
      },
      prismals = {
        disableOrganizeImports = true,
      },
      graphql = {
        filetypes = { 'graphql', 'gql' },
      },
      eslint = {
        filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' },
      },
      tailwindcss = {
        filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' },
      },
    }

    for name, cfg in pairs(server_configs) do
      vim.lsp.config(name, cfg)
    end
  end,
}
