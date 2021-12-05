local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'stylelint',
  command = fs.executable('stylelint', fs.Scope.NODE),
  debounce = 100,
  args = { '--formatter', 'json', '--stdin-filename', '%filepath' },
  parseJson = {
    errorsRoot = '[0].warnings',
    line = 'line',
    column = 'column',
    message = '[stylelint] ${text}',
    security = 'severity',
  },
  securities = { error = 'error', warning = 'warning' },
  rootPatterns = { '.git' },
}
