local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'standard_fmt',
  command = fs.get_executable('standard', 'node'),
  args = { '--fix', '--stdin' },
  rootPatterns = { '.git' },
}
