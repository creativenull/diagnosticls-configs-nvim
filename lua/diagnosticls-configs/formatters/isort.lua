local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'isort',
  command = fs.executable('isort'),
  args = { '--quiet', '--stdout', '-' },
  rootPatterns = { '.isort.cfg', 'pyproject.toml', '.git' },
}
