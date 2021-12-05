local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'prettier_standard',
  command = fs.executable('prettier-standard', fs.Scope.NODE),
  args = { '--stdin' },
  rootPatterns = { '.prettierignore' },
}
