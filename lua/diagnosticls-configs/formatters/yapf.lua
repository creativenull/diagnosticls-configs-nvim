local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'yapf',
  command = fs.executable('yapf'),
  args = { '-' },
  rootPatterns = {
    'requirements.txt',
    '.style.yapf',
    'setup.cfg',
    'pyproject.toml',
    '.git',
  },
}
