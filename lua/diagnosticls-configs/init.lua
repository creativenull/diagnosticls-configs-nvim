local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
  vim.api.nvim_err_writeln('[diagnosticls-configs] `nvim-lspconfig` plugin not installed!')
  vim.api.nvim_err_writeln('Please install via your plugin manager.')
  return
end

local M = {}
local dls_options = {
  defaults = false,
  format = true,
}

---Check if a tool is in the inserted table
---@param tool table
---@param name string
---@return boolean
local function tool_config_not_found(tool, name)
  local found = vim.tbl_filter(function(item)
    return item.sourceName == name
  end, tool)

  return #found == 0
end

---Create a diagnostic-languageserver InitializationOptions struct
---@param lang_sets table
---@return table
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
    if dls_options.format and vim.tbl_islist(lang_options.formatters) then
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

---Set some options for the plugin
---@param options table
---@return nil
function M.setup(options)
  if options == nil then
    return
  end

  vim.validate({
    defaults = { options.defaults, { 'boolean', 'nil' } },
    format = { options.format, { 'boolean', 'nil' } },
  })

  dls_options = vim.tbl_extend('force', dls_options, options)
end

---Create nvim-lspconfig options merge with defaults provided
---by the plugin, if permitted
---@param lang_sets table
---@return table
function M.create(lang_sets)
  lang_sets = lang_sets == nil and {} or lang_sets

  if dls_options.defaults then
    -- merge with defaults first if set
    local default_lang_sets = require('diagnosticls-configs.defaults')
    lang_sets = vim.tbl_extend('force', default_lang_sets, lang_sets)
  end

  if not lang_sets then
    -- nothing to return for nvim-lspconfig
    return { root_dir = lspconfig.util.root_pattern('.git') }
  end

  local init_options = get_defined_tools(lang_sets)
  local lsp_filetypes = vim.fn.copy(init_options.filetypes)

  if dls_options.format then
    -- merge filetypes from formatters too
    for k, v in pairs(init_options.formatFiletypes) do
      lsp_filetypes[k] = v
    end
  end

  return {
    root_dir = lspconfig.util.root_pattern('.git'),
    filetypes = vim.tbl_keys(lsp_filetypes),
    init_options = init_options,
  }
end

return M
