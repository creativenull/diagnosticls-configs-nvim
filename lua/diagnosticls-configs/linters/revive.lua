local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'revive',
  command = fs.executable('revive'),
  args = { '%file' },
  debounce = 100,
  formatPattern = {
    [[^[^:]+:(\d+):(\d+):\s+(.*)$]],
    { line = 1, column = 2, message = { '[revive] ', 3 } },
  },
  rootPatterns = { '.git', 'go.mod' },
}
