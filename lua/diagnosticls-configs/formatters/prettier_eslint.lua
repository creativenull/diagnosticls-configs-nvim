local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'prettier_eslint',
  command = fs.executable('prettier-eslint', fs.Scope.NODE),
  args = { '--stdin', '--stdin-filepath', '%filepath' },
  rootPatterns = { '.git' },
}
