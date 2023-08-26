local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'perltidy',
  command = fs.executable('perltidy'),
  args = { '--quiet' },
  rootPatterns = { '.git' },
}
