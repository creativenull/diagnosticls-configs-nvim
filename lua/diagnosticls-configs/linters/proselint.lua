local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'proselint',
  command = fs.executable('proselint', fs.Scope.NODE),
  args = { '--json', '-' },
  debounce = 200,
  parseJson = {
    errorsRoot = 'data.errors',
    line = 'line',
    column = 'column',
    security = 'severity',
    message = '[proselint] ${check}: ${message}',
  },
  securities = { error = 'error', warning = 'warning' },
  rootPatterns = { '.git' },
}
