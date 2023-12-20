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

local function has_errors()
  return _G._diagnosticls and not vim.tbl_isempty(_G._diagnosticls.healthcheck.errors)
end

local function has_ok()
  return _G._diagnosticls and not vim.tbl_isempty(_G._diagnosticls.healthcheck.ok)
end

function M.check()
  if has_errors() then
    for _, err in pairs(_G._diagnosticls.healthcheck.errors) do
      report_error(err)
    end
  end

  if has_ok() then
    for _, ok in pairs(_G._diagnosticls.healthcheck.ok) do
      report_ok(ok)
    end
  end
end

return M
