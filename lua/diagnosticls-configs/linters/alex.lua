local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'alex',
  command = fs.get_executable('alex', 'node'),
  debounce = 100,
  offsetLine = 0,
  offsetColumn = 0,
  isStdout = false,
  isStderr = true,
  args = { '--stdin' },
  formatPattern = {
    [[^\s+(\d+):(\d+)-(\d+):(\d+)\s+(\w+)\s+(.*)(\r|\n)*$]],
    { line = 1, column = 2, endLine = 3, endColumn = 4, message = { '[alex] ', 6 }, security = 5 },
  },
  securities = {
    error = 'error',
    warning = 'warning',
  },
  rootPatterns = {
    '.git',
    '.alexrc',
  },
}
