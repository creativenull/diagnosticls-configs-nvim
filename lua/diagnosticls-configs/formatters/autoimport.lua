local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'autoimport',
  command = fs.executable('autoimport'),
  args = { '-' },
  rootPatterns = { 'pyproject.toml', '.git' },
}
