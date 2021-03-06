local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'eslint_d',
  command = fs.executable('eslint_d', fs.Scope.NODE),
  debounce = 100,
  args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
  parseJson = {
    errorsRoot = '[0].messages',
    line = 'line',
    column = 'column',
    endLine = 'endLine',
    endColumn = 'endColumn',
    message = '[eslint] ${message} [${ruleId}]',
    security = 'severity',
  },
  securities = { ['1'] = 'warning', ['2'] = 'error' },
  rootPatterns = {
    '.eslintrc',
    '.eslintrc.cjs',
    '.eslintrc.js',
    '.eslintrc.json',
    '.eslintrc.yaml',
    '.eslintrc.yml',
  },
}
