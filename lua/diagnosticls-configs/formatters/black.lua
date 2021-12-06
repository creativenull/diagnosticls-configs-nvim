local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'black',
  command = fs.executable('black'),
  args = { '%filepath' },
  doesWriteToFile = true,
  rootPatterns = {
    '.git',
    'pyproject.toml',
    'setup.py',
  },
}
