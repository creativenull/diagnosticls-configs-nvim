local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'xo',
  command = fs.executable('xo', fs.Scope.NODE),
  debounce = 100,
  args = { '--stdin', '--stdin-filename', '%filepath', '--reporter', 'json' },
  parseJson = {
    errorsRoot = '[0].messages',
    line = 'line',
    column = 'column',
    endLine = 'endLine',
    endColumn = 'endColumn',
    message = '[xo] ${message} [${ruleId}]',
    security = 'severity',
  },
  securities = { ['1'] = 'warning', ['2'] = 'error' },
  rootPatterns = { '.git', '.eslintignore' },
}
