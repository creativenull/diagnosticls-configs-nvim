local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'perlimports',
  command = fs.executable('perlimports'),
  args = {
    '--read-stdin',
    '--filename',
    '%filepath',
  },
  rootPatterns = { '.git' },
}
