local fs = require 'diagnosticls-configs.fs'

return {
  sourceName = 'swiftlint',
  command = fs.get_executable('swiftlint'),
  debounce = 100,
  args = { 
    'lint', 
    --'%filepath',
    '--use-stdin',
    '--quiet', 
    '--reporter', 
    'json',
  },
  parseJson = {
    line = 'line',
    column = 'character',
    message = '${reason} [${rule_id}]',
    security = 'severity',
  },
  securities = {
    Warning = 'warning',
    Error = 'error',
  },
  rootPatterns = { 'Package.swift', '.git' },
}
