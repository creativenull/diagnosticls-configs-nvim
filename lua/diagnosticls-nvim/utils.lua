local linters = require 'diagnosticls-nvim.linters'
local formatters = require 'diagnosticls-nvim.formatters'
local M = {}

M.get_linters = function()
  return linters
end

M.get_formatters = function()
  return formatters
end

return M
