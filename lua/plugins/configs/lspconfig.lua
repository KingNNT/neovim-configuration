-- Setup language servers.
local util = require 'lspconfig.util'

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
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
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
  desc = 'LSP: Set keymaps and disable hover for Ruff',
})

vim.api.nvim_create_user_command("TSOrganizeImports", function()
  vim.lsp.buf.execute_command({
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
  -- Run ruff check --fix on the current file
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
        print("❌ Ruff encountered errors.")
      end
    end,
  })
end, {
  desc = "Run `ruff check --fix` on the current file",
})

-- LSP config
local servers = require('plugins.configs.lsp.servers')

-- Get capabilities from nvim-cmp
local capabilities = _G.cmp_nvim_lsp_capabilities or vim.lsp.protocol.make_client_capabilities()

-- Server-specific configurations
local server_configs = {
  cssls = {
    filetypes = { 'typescript', 'javascript', 'vue', 'css', 'scss' },
    capabilities = capabilities,
  },
  ts_ls = {
    capabilities = capabilities,
    settings = {
      typescript = {
        format = {
          indentSize = 2,
          tabSize = 2,
          convertTabsToSpaces = false,
        }
      },
      javascript = {
        format = {
          indentSize = 2,
          tabSize = 2,
          convertTabsToSpaces = false,
        }
      }
    }
  },
  intelephense = {
    filetypes = { "php" },
    root_dir = util.root_pattern("composer.json", ".git"),
    capabilities = capabilities,
  },
  pyright = {
    filetypes = { 'python' },
    capabilities = capabilities,
    disableOrganizeImports = true,
  },
  ruff = {
    filetypes = { 'python' },
    capabilities = capabilities,
    disableOrganizeImports = true,
    init_options = {
      settings = {
        organizeImports = true
      }
    }
  },
  vuels = {
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    capabilities = capabilities,
    init_options = {
      vue = {
        hybridMode = false,
      },
    },
  },
  lua_ls = {
    filetypes = { 'lua' },
    capabilities = capabilities,
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
          path = {
            'lua/?.lua',
            'lua/?/init.lua',
          },
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME
          }
        }
      })
    end,
    settings = {
      Lua = {}
    }
  },
  prismals = {
    capabilities = capabilities,
    disableOrganizeImports = true,
  },
}

-- Apply server-specific configurations
for server_name, config in pairs(server_configs) do
  vim.lsp.config(server_name, config)
end

-- Configure all other servers with default capabilities
for _, server_name in ipairs(servers.servers) do
  if not server_configs[server_name] then
    vim.lsp.config(server_name, {
      capabilities = capabilities
    })
  end
end

-- Enable all LSP servers
for _, server_name in ipairs(servers.servers) do
  vim.lsp.enable(server_name)
end
