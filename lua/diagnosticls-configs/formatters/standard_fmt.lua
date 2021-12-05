local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'standard_fmt',
  command = fs.executable('standard', fs.Scope.NODE),
  args = { '--fix', '--stdin' },
  rootPatterns = { '.git' },
}
