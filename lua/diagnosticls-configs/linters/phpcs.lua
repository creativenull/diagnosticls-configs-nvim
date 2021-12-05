local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'phpcs',
  command = fs.executable('phpcs', fs.Scope.COMPOSER),
  debounce = 100,
  args = { '--standard=PSR2', '--report=emacs', '-s', '-' },
  offsetLine = 0,
  offsetColumn = 0,
  formatLines = 1,
  formatPattern = {
    [[^.*:(\d+):(\d+):\s+(.*)\s+-\s+(.*)(\r|\n)*$]],
    { line = 1, column = 2, security = 3, message = { '[phpcs] ', 4 } },
  },
  securities = { error = 'error', warning = 'warning' },
  rootPatterns = { '.git', 'vendor', 'composer.json' },
}
