local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'vulture',
  command = fs.executable('vulture'),
  args = { '%filepath' },
  debounce = 100,
  offsetLine = 0,
  offsetColumn = 0,
  formatLines = 1,
  formatPattern = {
    [[^.*:(\d+): (.*)]],
    { line = 1, message = { '[vulture] ', 2 } },
  },
  rootPatterns = { 'pyproject.toml', '.git' }
}
