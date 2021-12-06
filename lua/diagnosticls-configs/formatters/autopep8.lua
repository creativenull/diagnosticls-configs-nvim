local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'autopep8',
  command = fs.executable('autopep8'),
  args = { '%filepath' },
  rootPatterns = { 'requirements.txt', '.git' },
}
