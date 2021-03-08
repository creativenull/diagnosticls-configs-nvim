local prettier = require 'diagnosticls-nvim.formatters.prettier'
local xo = require 'diagnosticls-nvim.formatters.xo'

return {
  prettier = prettier,
  xo_fmt = xo,
}
