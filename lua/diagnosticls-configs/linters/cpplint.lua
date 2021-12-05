local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'cpplint',
  command = fs.executable('cpplint'),
  args = { '%file' },
  debounce = 100,
  isStderr = true,
  isStdout = false,
  offsetLine = 0,
  offsetColumn = 0,
  formatPattern = {
    [[^[^:]+:(\d+):(\d+)?\s+([^:]+?)\s\[(\d)\]$]],
    { line = 1, column = 2, message = { '[cpplint] ', 3 }, security = 4 },
  },
  securities = {
    [1] = 'info',
    [2] = 'warning',
    [3] = 'warning',
    [4] = 'error',
    [5] = 'error',
  },
  rootPatterns = { '.git' },
}
