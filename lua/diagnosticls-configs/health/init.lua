local M = {}

---Report ok message to :checkhealth support only for nvim >= 0.7
---@param msg string
---@return nil
local function report_ok(msg)
  if vim.fn.has('nvim-0.10') == 1 then
    vim.health.ok(msg)
  elseif vim.fn.has('nvim-0.8') == 1 then
    vim.health.report_ok(msg)
  elseif vim.fn.has('nvim-0.7') == 1 then
    require('health').report_ok(msg)
  end
end

---Report error message to :checkhealth support only for nvim >= 0.7
---@param msg string
---@return nil
local function report_error(msg)
  if vim.fn.has('nvim-0.10') == 1 then
    vim.health.error(msg)
  elseif vim.fn.has('nvim-0.8') == 1 then
    vim.health.report_error(msg)
  elseif vim.fn.has('nvim-0.7') == 1 then
    require('health').report_error(msg)
  end
end

local has_issues = function()
  return _G.diagnosticls_healthcheck ~= nil and not vim.tbl_isempty(_G.diagnosticls_healthcheck)
end

M.check = function()
  if has_issues() then
    for _, issue in pairs(_G.diagnosticls_healthcheck) do
      report_error(issue)
    end
  else
    report_ok('All checks passed')
  end
end

return M
