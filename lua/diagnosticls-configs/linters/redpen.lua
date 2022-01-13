local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'redpen',
  -- command = fs.get_executable('redpen'),
  command = './bin/redpen',
  args = { '--limit', '50', '%filepath' },
  debounce = 100,
  isStdout = false,
  isStderr = true,
  formatPattern = {
    [[^.*:(\d+):\s(.*)(\r|\n)*$]],
    { line = 1, column = 0, message = { '[redpen] ', 2 } },
  },
  rootPatterns = { '.git' },
}
