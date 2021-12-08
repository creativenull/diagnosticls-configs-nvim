local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'black',
  command = fs.executable('black'),
  args = { '--quiet', '-' },
  rootPatterns = {
    '.git',
    'pyproject.toml',
    'setup.py',
  },
}
