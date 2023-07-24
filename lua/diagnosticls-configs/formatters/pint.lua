local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'pint',
  command = fs.executable('pint', fs.Scope.COMPOSER),
  args = { '%relativepath' },
  isStdout = false,
  doesWriteToFile = true,
  ignoreExitCode = true,
  rootPatterns = { 'composer.json' },
}
