local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'xo_fmt',
  command = fs.executable('xo', fs.Scope.NODE),
  args = { '--stdin', '--stdin-filename', '%filepath', '--fix' },
  rootPatterns = { '.git', '.eslintignore' },
}
