local fs = require 'diagnosticls-configs.fs'

return {
  sourceName = 'xo',
  command = fs.get_executable('xo', 'node'),
  debounce = 100,
  args = {'--stdin', '--stdin-filename', '%filepath', '--reporter', 'json'},
  parseJson = {
    errorsRoot = '[0].messages',
    line = 'line',
    column = 'column',
    endLine = 'endLine',
    endColumn = 'endColumn',
    message = '[xo] ${message} [${ruleId}]',
    security = 'severity',
  },
  securities = {[2] = 'error', [1] = 'warning'},
  rootPatterns = {'.git', '.eslintignore'},
}
