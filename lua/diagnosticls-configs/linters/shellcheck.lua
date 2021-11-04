local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'shellcheck',
  command = fs.get_executable('shellcheck'),
  debounce = 100,
  args = { '--format', 'json1', '-' },
  parseJson = {
    errorsRoot = 'comments',
    sourceName = 'file',
    line = 'line',
    column = 'column',
    endLine = 'endLine',
    endColumn = 'endColumn',
    security = 'level',
    message = '[shellcheck] ${message} [SC${code}]',
  },
  securities = {
    error = 'error',
    warning = 'warning',
    info = 'info',
    style = 'hint',
  },
}
