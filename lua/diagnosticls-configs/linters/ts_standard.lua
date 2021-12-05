local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'ts_standard',
  command = fs.executable('ts-standard', fs.Scope.NODE),
  debounce = 100,
  args = { '--stdin', '--stdin-filename', '%filepath', '--verbose' },
  offsetLine = 0,
  offsetColumn = 0,
  formatLines = 1,
  formatPattern = {
    [[^\s*([^:]+):(\d+):(\d+):\s([^:]+)$]],
    { line = 2, column = 3, message = { '[ts-standard] ', 4 } },
  },
  rootPatterns = { '.git', '.gitignore' },
}
