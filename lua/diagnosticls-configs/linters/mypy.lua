local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'mypy',
  command = fs.executable('mypy'),
  args = {
    '--show-error-context',
    '--show-column-numbers',
    '--show-error-codes',
    '--no-color-output',
    '--no-error-summary',
    '%file',
  },
  debounce = 100,
  offsetLine = 0,
  offsetColumn = 0,
  formatLines = 1,
  formatPattern = {
    [[.*:(\d+):(\d+): (\w*): (.*)(\r|\n)*$]],
    { line = 1, column = 2, security = 3, message = { '[mypy] ', 4 } },
  },
  rootPatterns = {
    'mypy.ini',
    '.mypy.ini',
    'pyproject.toml',
    'setup.cfg',
  },
}
