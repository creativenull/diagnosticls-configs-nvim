local M = {}

---Add a single linter to the diagnosticls init_options
---@param diagnosticls_setup table
---@param filetype string
---@param linter table
M.add_linter = function(diagnosticls_setup, filetype, linter)
  if linter == nil or vim.tbl_isempty(linter) then
    vim.api.nvim_err_writeln('[diagnosticls-configs] Linter provided is empty')
    return
  end

  -- Add linter
  local name = linter.sourceName
  diagnosticls_setup.init_options.linters[name] = linter

  -- Assign linter to filetype
  diagnosticls_setup.init_options.filetypes[filetype] = name
end

---Add multiple linters to the diagnosticls init_options
---@param diagnosticls_setup table
---@param filetype string
---@param linters table
M.add_linters = function(diagnosticls_setup, filetype, linters)
  if diagnosticls_setup.init_options.filetypes[filetype] == nil then
    diagnosticls_setup.init_options.filetypes[filetype] = {}
  end

  for _, linter in pairs(linters) do
    -- Add linter
    local name = linter.sourceName
    diagnosticls_setup.init_options.linters[name] = linter

    -- Assign linter to filetype list
    table.insert(diagnosticls_setup.init_options.filetypes[filetype], name)
  end
end

return M
