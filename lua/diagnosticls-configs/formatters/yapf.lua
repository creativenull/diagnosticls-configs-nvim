local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'yapf',
  command = fs.executable('yapf'),
  rootPatterns = {
    'requirements.txt',
    '.style.yapf',
    'setup.cfg',
    'pyproject.toml',
    '.git',
  },
}
