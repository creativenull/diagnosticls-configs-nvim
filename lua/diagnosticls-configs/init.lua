local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
  vim.api.nvim_err_writeln('[diagnosticls-configs] `nvim-lspconfig` plugin not installed!')
  vim.api.nvim_err_writeln('Please install via your plugin manager.')
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
  root_dir = lspconfig.util.root_pattern('.git'),
  filetypes = {},
  init_options = {
    filetypes = {},
    formatFiletypes = {},
    linters = {},
    formatters = {},
  },
}
local dls_options = {
  defaults = true,
  include_formatters = true,
}

local function tool_config_not_found(tool, sourceName)
  local found = vim.tbl_filter(function(item)
    return item.sourceName == sourceName
  end, tool)

  return #found == 0
end

local function get_defined_tools(lang_sets)
  local found_linters = {}
  local found_formatters = {}
  local linter_filetypes = {}
  local formatter_filetypes = {}

  for lang, lang_options in pairs(lang_sets) do
    linter_filetypes[lang] = {}
    formatter_filetypes[lang] = {}

    if vim.tbl_islist(lang_options.linters) then
      for _, linter in pairs(lang_options.linters) do
        -- if not already added, then add it
        if tool_config_not_found(found_linters, linter.sourceName) then
          table.insert(found_linters, linter)
        end

        -- add to filetypes no matter what
        table.insert(linter_filetypes[lang], linter.sourceName)
      end
    end

    -- only include formatters if needed
    if dls_options.include_formatters and vim.tbl_islist(lang_options.formatters) then
      for _, formatter in pairs(lang_options.formatters) do
        -- if not already added, then add it
        if tool_config_not_found(found_formatters, formatter.sourceName) then
          table.insert(found_formatters, formatter)
        end

        -- add to filetypes no matter what
        table.insert(formatter_filetypes[lang], formatter.sourceName)
      end
    end
  end

  return {
    linters = found_linters,
    filetypes = linter_filetypes,
    formatters = found_formatters,
    formatFiletypes = formatter_filetypes,
  }
end

function M.setup(options)
  if options == nil then
    return
  end

  vim.validate({
    defaults = { options.defaults, { 'boolean', 'nil' } },
    include_formatters = { options.include_formatters, { 'boolean', 'nil' } },
  })

  dls_options = vim.tbl_extend('force', dls_options, options)
end

function M.create(lang_sets)
  local init_options = get_defined_tools(lang_sets)
  local lsp_filetypes = init_options.filetypes

  if dls_options.include_formatters then
    -- merge filetypes from formatters too
    for k, v in pairs(init_options.formatFiletypes) do
      lsp_filetypes[k] = v
    end
  end

  -- TODO: read dls_options.defaults and merge with provided configs

  return {
    root_dir = lspconfig.util.root_pattern('.git'),
    filetypes = vim.tbl_keys(lsp_filetypes),
    init_options = init_options,
  }
end

--[[
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
      if vim.tbl_islist(configs.linter) and not vim.tbl_isempty(configs.linter) then
        add_linters(diagnosticls_setup, filetype, configs.linter)
      else
        add_linter(diagnosticls_setup, filetype, configs.linter)
      end
    end

    if configs.formatter ~= nil and diagnosticls_setup.format then
      if vim.tbl_islist(configs.formatter) and not vim.tbl_isempty(configs.formatter) then
        add_formatters(diagnosticls_setup, filetype, configs.formatter)
      else
        add_formatter(diagnosticls_setup, filetype, configs.formatter)
      end
    end
  end

  diagnosticls_setup.filetypes = vim.tbl_keys(filetypes)

  lspconfig.diagnosticls.setup(diagnosticls_setup)
end
--]]

return M
