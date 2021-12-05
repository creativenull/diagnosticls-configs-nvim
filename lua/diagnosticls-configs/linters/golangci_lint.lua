local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'golangci_lint',
  command = fs.executable('golangci-lint'),
  args = { 'run', '--out-format', 'json' },
  debounce = 100,
  parseJson = {
    sourceNameFilter = true,
    sourceName = 'Pos.Filename',
    errorsRoot = 'Issues',
    line = 'Pos.Line',
    column = 'Pos.Column',
    message = '[golangci_lint] ${Text} [${FromLinter}]',
  },
  rootPatterns = { '.git', 'go.mod' },
}
