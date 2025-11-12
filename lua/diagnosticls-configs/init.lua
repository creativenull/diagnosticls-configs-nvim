local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')

if vim.fn.has('nvim-0.11') == 0 and not lspconfig_ok then
  -- Only give this error if nvim < 0.11 and lspconfig plugin not installed
  vim.api.nvim_err_writeln('[diagnosticls-configs] `nvim-lspconfig` plugin required! Install via your plugin manager.')

  return
end

local add_linter = require('diagnosticls-configs.linter').add_linter
local add_linters = require('diagnosticls-configs.linter').add_linters
local add_formatter = require('diagnosticls-configs.formatter').add_formatter
local add_formatters = require('diagnosticls-configs.formatter').add_formatters
local M = {}

---@class DiagnosticLSConfig
local diagnosticls_setup = {
  -- Plugin Options
  format = true,
  default_config = false,

  -- LSP Setup
  root_dir = vim.fs.dirname(vim.fs.find({ '.git' }, { upward = true })[1]),
  filetypes = {},
  init_options = {
    filetypes = {},
    formatFiletypes = {},
    linters = {},
    formatters = {},
  },
}

---Initialize lsp options to pass thru diagnosticls
---@param user_diagnosticls_setup DiagnosticLSConfig
---@return nil
M.init = function(user_diagnosticls_setup)
  if user_diagnosticls_setup ~= nil and not vim.tbl_isempty(user_diagnosticls_setup) then
    diagnosticls_setup = vim.tbl_extend('force', diagnosticls_setup, user_diagnosticls_setup)
  end
end

---Setup linter(s) and/or formatter(s) given by filetypes
---@param filetypes table
---@return nil
M.setup = function(filetypes)
  -- Set some defaults but priority is given to
  -- filetypes from argument first
  if diagnosticls_setup.default_config then
    local default_filetypes = require('diagnosticls-configs.defaults')
    if filetypes == nil then
      filetypes = default_filetypes
    else
      filetypes = vim.tbl_extend('force', default_filetypes, filetypes)
    end
  end

  if vim.tbl_isempty(filetypes) then
    vim.api.nvim_err_writeln('[diagnosticls-configs] Provided setup() is invalid')
    return
  end

  for filetype, configs in pairs(filetypes) do
    if configs.linter ~= nil then
      if vim.islist(configs.linter) and not vim.tbl_isempty(configs.linter) then
        add_linters(diagnosticls_setup, filetype, configs.linter)
      else
        add_linter(diagnosticls_setup, filetype, configs.linter)
      end
    end

    if configs.formatter ~= nil and diagnosticls_setup.format then
      if vim.islist(configs.formatter) and not vim.tbl_isempty(configs.formatter) then
        add_formatters(diagnosticls_setup, filetype, configs.formatter)
      else
        add_formatter(diagnosticls_setup, filetype, configs.formatter)
      end
    end
  end

  diagnosticls_setup.filetypes = vim.tbl_keys(filetypes)

  -- Remove plugin options before passing to lsp client
  diagnosticls_setup.format = nil
  diagnosticls_setup.default_config = nil

  if vim.fn.has('nvim-0.11') == 1 then
    vim.lsp.config('diagnosticls', diagnosticls_setup)
    vim.lsp.enable('diagnosticls')
  else
    lspconfig.diagnosticls.setup(diagnosticls_setup)
  end
end

return M
