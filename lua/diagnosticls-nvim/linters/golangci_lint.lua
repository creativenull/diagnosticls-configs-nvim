local fs = require 'diagnosticls-nvim.fs'

return {
  sourceName = 'golangci_lint',
  command = fs.get_executable('golangci-lint'),
  args = { 'run', '--out-format', 'json' },
  debounce = 100,
  parseJson = {
    sourceNameFilter = true,
    sourceName = 'Pos.Filename',
    errorsRoot = 'Issues',
    line = 'Pos.Line',
    column = 'Pos.Column',
    message = '${Text} [${FromLinter}]',
  },
  rootPatterns = {
    '.git',
    'go.mod',
  },
}
