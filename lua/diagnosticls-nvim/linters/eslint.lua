local fs = require 'diagnosticls-nvim.fs'

return {
  sourceName = 'eslint',
  command = fs.get_executable('eslint', 'node'),
  debounce = 100,
  args = {'--stdin', '--stdin-filename', '%filepath', '--format', 'json'},
  parseJson = {
    errorsRoot = '[0].messages',
    line = 'line',
    column = 'column',
    endLine = 'endLine',
    endColumn = 'endColumn',
    message = '${message} [${ruleId}] [eslint]',
    security = 'severity',
  },
  securities = {[2] = 'error', [1] = 'warning'},
  rootPatterns = {
    '.eslintrc',
    '.eslintrc.cjs',
    '.eslintrc.js',
    '.eslintrc.json',
    '.eslintrc.yaml',
    '.eslintrc.yml',
  },
}
