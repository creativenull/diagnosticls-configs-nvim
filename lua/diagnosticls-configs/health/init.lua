local health

-- Keep support for nvim 0.6/0.7 but use new vim.health for nvim >= 0.8
if vim.fn.has('nvim-0.8') == 1 then
  health = vim.health
else
  health = require('health')
end

local M = {}

local has_issues = function()
  return _G.diagnosticls_healthcheck ~= nil and not vim.tbl_isempty(_G.diagnosticls_healthcheck)
end

M.check = function()
  if has_issues() then
    for _, issue in pairs(_G.diagnosticls_healthcheck) do
      health.report_error(issue)
    end
  else
    health.report_ok('All checks passed')
  end
end

return M
