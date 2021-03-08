return {
  sourceName = 'xo',
  command = 'xo',
  debounce = 100,
  args = {  '--stdin', '--stdin-filename', '%filepath', '--reporter', 'json' },
  parseJson = {
    errorsRoot = '[0].messages',
    line = 'line',
    column = 'column',
    endLine = 'endLine',
    endColumn = 'endColumn',
    message = '${message} [${ruleId}]',
    security = 'severity',
  },
  securities = {
    [2] = 'error',
    [1] = 'warning'
  },
  rootPatterns = {
    '.git',
    '.eslintignore'
  }
}
