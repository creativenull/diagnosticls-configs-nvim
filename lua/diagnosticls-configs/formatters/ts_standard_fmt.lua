local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'ts_standard_fmt',
  command = fs.executable('ts-standard', fs.Scope.NODE),
  args = { '--fix', '--stdin', '--stdin-filename', '%filepath' },
  rootPatterns = { '.git' },
}
