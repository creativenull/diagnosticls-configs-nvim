local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'rubocop',
  command = fs.executable('bundle', fs.Scope.BUNDLE),
  debounce = 100,
  args = {
    'exec',
    'rubocop',
    '--format',
    'json',
    '--force-exclusion',
    '--stdin',
    '%filepath',
  },
  parseJson = {
    errorsRoot = 'files[0].offenses',
    line = 'location.start_line',
    endLine = 'location.last_line',
    column = 'location.start_column',
    endColumn = 'location.end_column',
    message = '[rubocop] [${cop_name}] ${message}',
    security = 'severity',
  },
  securities = {
    fatal = 'error',
    error = 'error',
    warning = 'warning',
    convention = 'info',
    refactor = 'info',
    info = 'info',
  },
}
