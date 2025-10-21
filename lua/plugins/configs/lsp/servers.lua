-- Centralized LSP server configuration
-- This file defines all LSP servers used across the configuration

local M = {}

-- List of LSP servers to be installed via mason
M.servers = {
  "bashls",
  "cmake",
  "cssls",
  "cssmodules_ls",
  "dockerls",
  "docker_compose_language_service",
  "eslint",
  "emmet_language_server",
  "graphql",
  "jsonls",
  "ts_ls",
  "nginx_language_server",
  "intelephense",
  "prismals",
  "pyright",
  "ruff",
  "rust_analyzer",
  "sqlls",
  "tailwindcss",
  "terraformls",
  "vuels",
  "lua_ls",
}

return M
