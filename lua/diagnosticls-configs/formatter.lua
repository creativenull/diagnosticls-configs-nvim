local M = {}

---Add a single formatter to the diagnosticls init_options
---@param diagnosticls_setup table
---@param filetype string
---@param formatter table
M.add_formatter = function(diagnosticls_setup, filetype, formatter)
  if formatter == nil or vim.tbl_isempty(formatter) then
    vim.api.nvim_err_writeln('[diagnosticls-configs] Formatter provided is empty')
    return
  end

  -- Add formatter
  local name = formatter.sourceName
  diagnosticls_setup.init_options.formatters[name] = formatter

  -- Assign formatter to filetype
  diagnosticls_setup.init_options.formatFiletypes[filetype] = name
end

---Add multiple formatters to the diagnosticls init_options
---@param diagnosticls_setup table
---@param filetype string
---@param formatters table
M.add_formatters = function(diagnosticls_setup, filetype, formatters)
  if diagnosticls_setup.init_options.formatFiletypes[filetype] == nil then
    diagnosticls_setup.init_options.formatFiletypes[filetype] = {}
  end

  for _, formatter in pairs(formatters) do
    -- Add formatter
    local name = formatter.sourceName
    diagnosticls_setup.init_options.formatters[name] = formatter

    -- Assign formatter to filetype list
    table.insert(diagnosticls_setup.init_options.formatFiletypes[filetype], name)
  end
end

return M
